import QtQuick 2.0
import QtQuick.Controls 1.4
Item {
    id: root
    ListView {
        id: listView
        anchors.fill: parent
        model: ActiveSoundModel {}
        delegate: Item {
            x: 5
            width: 80
            height: 40

            Text {
                text: sound.source
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }

            function onPositionChanged()
            {
                if(sound)
                {
                    progress.value = sound.position
                }
            }

            Component.onCompleted: {
                sound.positionChanged.connect(onPositionChanged)
            }

            ProgressBar{
                id: progress
                value: sound.position
                maximumValue: sound.duration
            }
        }

    }

}
