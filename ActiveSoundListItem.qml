import QtQuick 2.0


ListElement {
    id: root
    property var sound

    signal finished(var sound)

    function soundStopped(){

        finished(sound)
    }


    Component.onCompleted: {
        sound.stopped.connect(soundStopped)
    }

}
