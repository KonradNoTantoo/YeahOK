import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

StyledButton {
    id: key

    property int scanCode: 0x00

    focusPolicy: Qt.NoFocus
    Layout.minimumHeight: key.implicitHeight
    Layout.minimumWidth: key.implicitWidth
    Layout.fillWidth: true
    Layout.fillHeight: true

    onClicked: mainWindow.transmitter.on_click(scanCode)
}
