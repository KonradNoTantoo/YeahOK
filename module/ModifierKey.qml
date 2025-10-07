import QtQuick 6.2
import QtQuick.Controls 6.2

Key {
    checkable: true

    onClicked: {}

    signal activated(checked: bool)

    onCheckedChanged: {
        mainWindow.transmitter.on_modifier_changed(scanCode, checked)
        activated(checked)
    }
}
