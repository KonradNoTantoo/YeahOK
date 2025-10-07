import QtQuick 6.2
import QtQuick.Layouts 6.2

StyledButton {
    text: "❌"

    property int height_: settings.geometry.control_bar_size
    property int width_: settings.geometry.control_bar_size

    Layout.minimumHeight: height_
    Layout.minimumWidth: width_
    Layout.preferredHeight: height_
    Layout.preferredWidth: width_
    Layout.maximumHeight: height_
    Layout.maximumWidth: width_
    Layout.fillWidth: false
    Layout.fillHeight: false

    onClicked: Qt.quit()
}
