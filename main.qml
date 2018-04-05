import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Hello World")

    function buttonSelected(button)
    {
        console.log(button.text, " selected")
    }

    Column {
        id: grid
        anchors.fill: parent

        padding: 10
        spacing: 10



        Row{

            ShortcutButton { text: "Q"; onClicked: buttonSelected(button) }
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
            Item{width:66;height: 100}
            ShortcutButton { text: "A"}
            ShortcutButton { text: "S"}
            ShortcutButton { text: "D"}
            ShortcutButton { text: "F"}
            ShortcutButton { text: "G"}
            ShortcutButton { text: "H"}
            ShortcutButton { text: "J"}
            ShortcutButton { text: "K"}
            ShortcutButton { text: "L"}

        }

        Row{
            Item{width:99;height: 100}
            ShortcutButton { text: "Z"}
            ShortcutButton { text: "X"}
            ShortcutButton { text: "C"}
            ShortcutButton { text: "V"}
            ShortcutButton { text: "B"}
            ShortcutButton { text: "N"}
            ShortcutButton { text: "M"}
        }
    }
}
