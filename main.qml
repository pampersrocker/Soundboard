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
        activeSoundList.children[0].model.addSound(sound)

    }
    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Vertical

        SplitView{

            Column {
                id: grid

                padding: 10
                spacing: 10

                Row{
                    spacing: 5
                    ShortcutButton { text: "Q"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "W"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "E"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "R"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "T"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "Y"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "U"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "I"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "O"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "P"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                }
                Row{
                    spacing: 5
                    Item{width:66;height: 100}
                    ShortcutButton { text: "A"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "S"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "D"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "F"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "G"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "H"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "J"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "K"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "L"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}

                }

                Row{
                    spacing: 5
                    Item{width:99;height: 100}
                    ShortcutButton { text: "Z"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "X"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "C"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "V"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "B"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "N"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                    ShortcutButton { text: "M"; onClicked: buttonSelected(button); onSoundPlayed: window.soundPlayed(sound)}
                }
            }

            ActiveSoundList {
                id: activeSoundList

            }
        }


        ButtonSettings {
            height: window.height/2
            id: buttonSettings
        }
    }
}
