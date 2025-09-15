import QtQuick 6.2

QtObject {
    id: handler

    property int x_shift: Screen.width - mainWindow.width
    property int y_shift: Screen.height - mainWindow.height

    property var center: Position {
        x: handler.x_shift/2 + settings.position.x_offset
        y: handler.y_shift/2 + settings.position.y_offset
        control_bar_side: Position.Side.Top
    }

    property var top: Position {
        x: handler.x_shift/2 + settings.position.x_offset
        y: settings.position.y_offset
        control_bar_side: Position.Side.Top
    }

    property var left: Position {
        x: settings.position.x_offset
        y: handler.y_shift/2 + settings.position.y_offset
        control_bar_side: Position.Side.Left
    }

    property var right: Position {
        x: x_shift + settings.position.x_offset
        y: handler.y_shift/2 + settings.position.y_offset
        control_bar_side: Position.Side.Right
    }

    property var bottom: Position {
        x: handler.x_shift/2 + settings.position.x_offset
        y: y_shift + settings.position.y_offset
        control_bar_side: Position.Side.Bottom
    }

    function resolve(position: string): Position {
        switch(position) {
        case "center":
            return center
        case "top":
            return top
        case "left":
            return left
        case "right":
            return right
        case "bottom":
            return bottom
        default:
            console.log("Positionning at top, received bad position =", position)
            return top
        }
    }
}
