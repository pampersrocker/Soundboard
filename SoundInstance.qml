import QtQuick 2.0
import QtMultimedia 5.0
Audio {
    onStopped: {
        console.log("destroyed");
        destroy()
    }
}
