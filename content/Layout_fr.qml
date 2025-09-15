import QtQuick 6.2
import QtQuick.Layouts 6.2

ColumnLayout {
    spacing: settings.geometry.spacing

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x02
            text: "&"
            shiftText: "1"
        }

        Key {
            scanCode: 0x03
            text: "é"
            shiftText: "2"
            altGrText: "~"
        }

        Key {
            scanCode: 0x04
            text: "\""
            shiftText: "3"
            altGrText: "#"
        }

        Key {
            scanCode: 0x05
            text: "'"
            shiftText: "4"
            altGrText: "{"
        }

        Key {
            scanCode: 0x06
            text: "("
            shiftText: "5"
            altGrText: "["
        }

        Key {
            scanCode: 0x07
            text: "-"
            shiftText: "6"
            altGrText: "|"
        }

        Key {
            scanCode: 0x08
            text: "è"
            shiftText: "7"
            altGrText: "`"
        }

        Key {
            scanCode: 0x09
            text: "_"
            shiftText: "8"
            altGrText: "\\"
        }

        Key {
            scanCode: 0x0A
            text: "ç"
            shiftText: "9"
            altGrText: "^"
        }

        Key {
            scanCode: 0x0B
            text: "à"
            shiftText: "0"
            altGrText: "@"
        }

        Key {
            scanCode: 0x0C
            text: ")"
            shiftText: "°"
            altGrText: "]"
        }
    }

    RowLayout {
        spacing: parent.spacing

        Key {
            scanCode: 0x10
            text: "a"
        }

        Key {
            scanCode: 0x11
            text: "z"
        }

        Key {
            scanCode: 0x12
            text: "e"
            altGrText: "€"
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
            text: "q"
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
            scanCode: 0x27
            text: "m"
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
            text: "w"
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
            text: ","
            shiftText: "?"
        }

        Key {
            scanCode: 0x33
            text: ";"
            shiftText: "."
        }

        Key {
            scanCode: 0x34
            text: ":"
            shiftText: "/"
        }

        Key {
            scanCode: 0x35
            text: "!"
            shiftText: "§"
        }
    }

    RowLayout {
        Key {
            scanCode: 0x39
            text: ""
        }

        AltGrKey {
            Layout.fillWidth: false
        }
    }
}
