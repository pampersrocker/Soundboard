import QtQuick 2.7
import QtQuick.Controls 1.0
import QtMultimedia 5.8
Item {
    id: root
    width: 100
    height: 100


    property string text: "A"
    property string sound

    signal clicked(var button)
    signal activated(var button)
    signal soundPlayed(var sound)

    onActivated: {
        //soundEffect.play();
        clickedAnimation.restart();
        var newAudio = Qt.createComponent("SoundInstance.qml").createObject(root, {"source": sound})
        newAudio.play()
        if (newAudio.playbackState !== MediaPlayer.PlayingState)
        {
            console.log("destroying empty")
            newAudio.destroy()
        }

        soundPlayed(newAudio)
    }





    onSoundChanged: {
        console.log("Changed sound of", text, " to ", sound);
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
            to: "#e6e6e6"
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
}
