import QtQuick 6.2
import QtQuick.Controls 6.2

Button {
    id: root

    property string shiftText: ""
    property string altGrText: ""

    background: Rectangle {
        color: root.down || root.checked ? settings.colors.active : settings.colors.key
        border.color: root.enabled ? settings.colors.key_border : settings.colors.inactive
        border.width: 1
    }

    contentItem: Item {
        Text {
            id: textItem

            text: root.text
            color: root.enabled ? settings.colors.text : settings.colors.inactive
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            font {
                family: settings.general.font
                weight: Font.Normal
                pixelSize: Math.min(root.height, root.width) * 0.6
                capitalization: Font.MixedCase
            }
        }

        implicitWidth: textItem.implicitWidth
    }

    function switchCase(upper: bool) {
        if (text !== "" && shiftText !== "") {
            textItem.text = upper ? shiftText : text
        } else {
            textItem.font.capitalization = upper ? Font.AllUppercase : Font.MixedCase
        }
    }

    function alternateGraph(active: bool) {
        if (text !== "" && altGrText !== "") {
            textItem.text = active ? altGrText : text
        }
    }

    Connections {
        target: mainWindow
        onSwitchCase: (upper) => switchCase(upper)
    }

    Connections {
        target: mainWindow
        onAlternateGraph: (active) => alternateGraph(active)
    }
}
