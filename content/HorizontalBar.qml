import QtQuick 6.2
import QtQuick.Layouts 6.2

RowLayout {
    id: controlBar

    property string fold: ""
    property string unfold: ""

    opacity: keyboardDock.state !== "unfolded" ? 0.5 : 1

    FoldButton {
        fold: controlBar.fold
        unfold: controlBar.unfold
        Layout.alignment: Qt.AlignCenter
        width_: (settings.geometry.width * 2) / 3
    }

    ExitButton {
        Layout.alignment: Qt.AlignRight
    }
}
