import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.0

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
            height: 400

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

    }


}
