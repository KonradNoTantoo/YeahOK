import QtQuick 6.2
import QtQuick.Layouts 6.2

Item {
    Component {
        id: top
        HorizontalBar {
            fold: "↑"
            unfold: "↓"
        }
    }

    Component {
        id: left
        VerticalBar {
            fold: "←"
            unfold: "→"
        }
    }

    Component {
        id: right
        VerticalBar {
            fold: "→"
            unfold: "←"
        }
    }

    Component {
        id: bottom
        HorizontalBar {
            fold: "↓"
            unfold: "↑"
        }
    }

    function get(position: string): Component {
        switch(position) {
        case "top":
            return top
        case "left":
            return left
        case "right":
            return right
        case "bottom":
            return bottom
        default:
            return top
        }
    }
}
