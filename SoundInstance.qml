import QtQuick 2.0
import QtMultimedia 5.0
MediaPlayer {
    id: player
    onStopped: {
        //console.log("destroyed");
        //destroy()
    }

    Component.onCompleted: {
        player.notifyInterval = 16;
    }

}
