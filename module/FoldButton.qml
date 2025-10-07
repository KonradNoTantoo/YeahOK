import QtQuick 6.2
import QtQuick.Layouts 6.2

StyledButton {
    id: btn
    property string fold: ""
    property string unfold: ""
    property bool folded: keyboardDock.state !== "unfolded"

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

    text: folded ? unfold : fold
    onClicked: folded ? keyboardDock.forceUnfold() : keyboardDock.forceFold()
}
