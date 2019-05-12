import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.0
import QtMultimedia 5.8
Item {
    id: root

    visible: selectedButton !== undefined


    FileDialog {
        id: browseDialog
        nameFilters: ["Audio Files (*.wav *.ogg *.mp3)", "All files (*.*)"]
        selectExisting: true
        onAccepted: textField.text = fileUrl
        folder: browseDialog.shortcuts.music
    }

    property var selectedButton

    onSelectedButtonChanged: {
        if(root.selectedButton)
        {
            volumeSlider.value = QtMultimedia.convertVolume(root.selectedButton.volume,
                                                              QtMultimedia.LinearVolumeScale,
                                                              QtMultimedia.LogarithmicVolumeScale)
        }
    }

    Column {
        id: column
        anchors.fill: parent
        spacing: 10


        Text {
            id: text1
            text: root.selectedButton ? qsTr("Options for Button %1").arg(root.selectedButton.text) : ""
            font.pixelSize: 12
        }

        Row {
            id: row
            width: 200
            height: 100

            TextField {
                id: textField
                transformOrigin: Item.TopLeft
                onTextChanged: selectedButton.sound = text
            }

            Button {
                id: browseButton
                width: 80
                height: 40
                text: qsTr("...")
                onClicked: {
                    browseDialog.open();
                }
            }




        }

        Slider {
            id: volumeSlider

            property real volume: QtMultimedia.convertVolume(volumeSlider.value,
                                                                 QtMultimedia.LogarithmicVolumeScale,
                                                                 QtMultimedia.LinearVolumeScale)
            value: 1.0
            onValueChanged: {
                root.selectedButton.volume = volume
                volumeText.updateVolume(value)
            }


        }

        Text {
            id: volumeText
            function updateVolume(volume)
            {
                var dbVolume = QtMultimedia.convertVolume(volume,
                                                      QtMultimedia.LogarithmicVolumeScale,
                                                      QtMultimedia.DecibelVolumeScale)
                volumeText.text = qsTr("%1 dB".arg(dbVolume))
            }

            text: updateVolume(1)

        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
