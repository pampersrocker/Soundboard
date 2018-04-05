import QtQuick 2.4
import QtQuick.Controls 1.0

Item {
    width: 100
    height: 100

    property string text: "A"

    signal clicked(var button)

    Button {
        id: button1
        width: 100
        height: 100
        z: -1
        onClicked: {
            parent.clicked(parent)
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
}
