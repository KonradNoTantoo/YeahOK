import QtQuick 6.2
import QtQuick.Layouts 6.2

ColumnLayout {
    id: controlBar

    property string fold: ""
    property string unfold: ""

    opacity: keyboardDock.state !== "unfolded" ? 0.5 : 1

    ExitButton {
        Layout.alignment: Qt.AlignTop
    }

    FoldButton {
        fold: controlBar.fold
        unfold: controlBar.unfold
        Layout.alignment: Qt.AlignCenter
        height_: (settings.geometry.height * 2) / 3
    }
}
