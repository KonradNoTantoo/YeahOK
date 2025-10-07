import QtQuick 6.2
import QtQuick.Layouts 6.2

ColumnLayout {
    spacing: settings.geometry.spacing

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x02
            text: "1"
            shiftText: "!"
        }

        Key {
            scanCode: 0x03
            text: "2"
            shiftText: "@"
        }

        Key {
            scanCode: 0x04
            text: "3"
            shiftText: "#"
        }

        Key {
            scanCode: 0x05
            text: "4"
            shiftText: "$"
        }

        Key {
            scanCode: 0x06
            text: "5"
            shiftText: "%"
        }

        Key {
            scanCode: 0x07
            text: "6"
            shiftText: "^"
        }

        Key {
            scanCode: 0x08
            text: "7"
            shiftText: "&"
        }

        Key {
            scanCode: 0x09
            text: "8"
            shiftText: "*"
        }

        Key {
            scanCode: 0x0A
            text: "9"
            shiftText: "("
        }

        Key {
            scanCode: 0x0B
            text: "0"
            shiftText: ")"
        }

        Key {
            scanCode: 0x0C
            text: "-"
            shiftText: "_"
        }
    }

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x10
            text: "q"
        }

        Key {
            scanCode: 0x11
            text: "w"
        }

        Key {
            scanCode: 0x12
            text: "e"
        }

        Key {
            scanCode: 0x13
            text: "r"
        }

        Key {
            scanCode: 0x14
            text: "t"
        }

        Key {
            scanCode: 0x15
            text: "y"
        }

        Key {
            scanCode: 0x16
            text: "u"
        }

        Key {
            scanCode: 0x17
            text: "i"
        }

        Key {
            scanCode: 0x18
            text: "o"
        }

        Key {
            scanCode: 0x19
            text: "p"
        }

        Key {
            scanCode: 0x0E
            text: "⌫"
            autoRepeat: true
        }
    }

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x1E
            text: "a"
        }

        Key {
            scanCode: 0x1F
            text: "s"
        }

        Key {
            scanCode: 0x20
            text: "d"
        }

        Key {
            scanCode: 0x21
            text: "f"
        }

        Key {
            scanCode: 0x22
            text: "g"
        }

        Key {
            scanCode: 0x23
            text: "h"
        }

        Key {
            scanCode: 0x24
            text: "j"
        }

        Key {
            scanCode: 0x25
            text: "k"
        }

        Key {
            scanCode: 0x26
            text: "l"
        }

        Key {
            scanCode: 0x1C
            text: "↵"
        }
    }

    RowLayout {
        spacing: parent.spacing

        ShiftKey {}

        Key {
            scanCode: 0x2C
            text: "z"
        }

        Key {
            scanCode: 0x2D
            text: "x"
        }

        Key {
            scanCode: 0x2E
            text: "c"
        }

        Key {
            scanCode: 0x2F
            text: "v"
        }

        Key {
            scanCode: 0x30
            text: "b"
        }

        Key {
            scanCode: 0x31
            text: "n"
        }

        Key {
            scanCode: 0x32
            text: "m"
        }

        Key {
            scanCode: 0x33
            text: ","
            shiftText: "<"
        }

        Key {
            scanCode: 0x34
            text: "."
            shiftText: ">"
        }

        Key {
            scanCode: 0x35
            text: "/"
            shiftText: "?"
        }
    }

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x39
            text: ""
        }

        AltGrKey {
            Layout.fillWidth: false
        }
    }
}
