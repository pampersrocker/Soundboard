import QtQuick 2.7
import QtQuick.Controls 1.0
import QtMultimedia 5.8
import Qt.labs.settings 1.0
Item {
    id: root
    width: 100
    height: 100


    property string text: "A"
    property string sound
    property real volume: 1.0
    property var audioInstance
    property var soundInstances: []
    property bool allowMultiple: false

    Settings {
        category: root.text
        property alias sound: root.sound
        property alias volume: root.volume
        property alias allowMultiple: root.allowMultiple
    }

    property var preloadedInstance
    property var instanceComponent: Qt.createComponent("SoundInstance.qml")

    onSoundChanged: {
        console.log("Changed sound of", text, " to ", sound);
        if(sound.length)
        {
            var newAudio = instanceComponent.createObject(root, {"source": sound, "volume": volume})
            preloadedInstance = newAudio
            preloadedInstance.volume = volume
        }
        else
        {
            preloadedInstance = undefined
        }

        var soundName = sound
        soundName = soundName.replace("\\", "/")
        soundName = soundName.substring(soundName.lastIndexOf("/") + 1, soundName.length)
        if(soundName.length > 20)
        {
            soundName = soundName.substring(0,8) + "..." + soundName.substr(soundName.length-8, soundName.length)
        }

        text2.text = soundName

    }

    signal clicked(var button)
    signal activated(var button)
    signal stopped(var button)
    signal soundPlayed(var sound)

    onActivated: {
        //soundEffect.play();
        clickedAnimation.restart();
        if(!allowMultiple && audioInstance)
        {
            audioInstance.stop()
            audioInstance = undefined
            stopped(root)
            return;
        }
        if(allowMultiple)
        {
            preloadedInstance = instanceComponent.createObject(root, {"source": sound, "volume": volume})
        }

        if(preloadedInstance !== undefined)
        {
            var newAudio = preloadedInstance
            newAudio.volume = volume
            newAudio.play()
            if (newAudio.playbackState !== MediaPlayer.PlayingState)
            {
                console.log("destroying empty")
                newAudio.destroy()
            }
            else
            {
                audioInstance = newAudio
                soundInstances.push(newAudio)
                soundPlayed(newAudio)
            }
        }
    }

    onStopped: {
        for(var instance in soundInstances)
        {
            if(soundInstances[instance])
            {
                soundInstances[instance].stop()
            }
        }
        soundInstances = []
    }



    Button {
        id: button
        width: 100
        height: 100
        z: -1
        onClicked: {
            root.clicked(root)
        }
    }

    Rectangle{
        id: colorRect
        anchors.fill: parent
        color: "#e6e6e6"

        ColorAnimation on color {
            id: clickedAnimation
            from: "red"
            to: state === "" ? "#e6e6e6" : state === "BoundMultiple" ? "#00a8a0" : "#00a805"
            duration: 200
            running: false
        }
    }

    Text {
        id: text1
        x: 8
        y: 8
        width: 56
        height: 42
        text: parent.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 30
    }

    Text {
        id: text2
        x: 32
        y: 32
        width: 56
        height: 42
        text: parent.sound
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 10
        wrapMode: Text.Wrap
    }

    Shortcut
    {
        id: shortcut
        sequence: root.text
        context: Qt.ApplicationShortcut
        onActivated: {
            console.log("pressed ", root.text)
            root.activated(root)
        }
        enabled: true
    }
    Shortcut
    {
        id: shortcutstop
        sequence: "Shift+" + root.text
        context: Qt.ApplicationShortcut
        onActivated: {
            console.log("stop ", root.text)
            root.stopped(root)
        }
        enabled: true
    }
    states: [
        State{
                name: "Bound"
                when: sound !== "" && !allowMultiple
                PropertyChanges {
                    target: colorRect
                    color: "#00a805"
                }
        },
        State{
                name: "BoundMultiple"
                when: sound !== "" && allowMultiple
                PropertyChanges {
                    target: colorRect
                    color: "#00a8a0"
                }
        }
    ]
}
