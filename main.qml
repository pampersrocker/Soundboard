import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.4
Window {
    id: window
    visible: true
    width: 1280
    height: 720
    title: qsTr("Soundboard")

    function buttonSelected(button)
    {
        console.log(button.text, " selected")
        buttonSettings.selectedButton = button
    }
    function soundPlayed(sound)
    {

    }
    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Vertical

        Column {
            id: grid

            padding: 10
            spacing: 10

            Row{
                spacing: 5
                ShortcutButton { text: "Q"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                ShortcutButton { text: "W"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "E"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "R"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "T"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "Y"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "U"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "I"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "O"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "P"; onClicked: buttonSelected(button)}
            }
            Row{
                spacing: 5
                Item{width:66;height: 100}
                ShortcutButton { text: "A"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "S"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "D"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "F"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "G"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "H"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "J"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "K"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "L"; onClicked: buttonSelected(button)}

            }

            Row{
                spacing: 5
                Item{width:99;height: 100}
                ShortcutButton { text: "Z"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "X"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "C"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "V"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "B"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "N"; onClicked: buttonSelected(button)}
                ShortcutButton { text: "M"; onClicked: buttonSelected(button)}
            }
        }


        ButtonSettings {
            height: window.height/2
            id: buttonSettings
        }
    }
}
