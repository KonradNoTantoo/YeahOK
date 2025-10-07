import QtQuick 6.2

ModifierKey {
    id: key
    scanCode: 0x2A
    text: "⇧"

    onActivated: (checked) => mainWindow.switchCase(checked)

    Connections {
        target: mainWindow
        function onAlternateGraph(active) { key.enabled = !active }
    }
}
