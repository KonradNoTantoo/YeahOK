import QtQuick 6.2

QtObject {
    enum Side
    {
        Top,
        Left,
        Right,
        Bottom
    }

    property int x: 0
    property int y: 0
    property var control_bar_side: undefined

    function horizontal() { return [Position.Side.Top, Position.Side.Bottom].includes(control_bar_side) }
    function vertical() { return [Position.Side.Left, Position.Side.Right].includes(control_bar_side) }
}
