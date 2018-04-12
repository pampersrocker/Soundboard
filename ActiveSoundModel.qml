import QtQuick 2.4

ListModel {
    id: model

    function updateData(sound)
    {
        for(var itemIndex = count -1 ; itemIndex >= 0; --itemIndex)
        {
            var item = get(itemIndex);
            if(item.sound === sound)
            {
                remove(itemIndex)
            }
        }
    }

    function addSound(sound)
    {
        var item = Qt.createComponent("ActiveSoundListItem.qml").createObject(root, {"sound": sound})
        item.finished.connect(updateData)
        model.append(item)
    }
}
