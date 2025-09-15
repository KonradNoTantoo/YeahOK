import QtQuick 6.2

ModifierKey {
    id: key
    scanCode: 0x64
    text: "Alt Gr"
    shiftText: "Alt Gr"

    onActivated: (checked) => mainWindow.alternateGraph(checked)

    Connections {
        target: mainWindow
        onSwitchCase: (upper) => {key.enabled = !upper}
    }
}
