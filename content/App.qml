// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Layouts 6.2
import QtCore
import YeahOK
import content

Window {
    visible: true
    title: "YeahOK"
    id: mainWindow

    signal switchCase(upper: bool)
    signal alternateGraph(active: bool)

    property QtObject transmitter: KeyPressTransmitter
    property QtObject controlBarFactory: ControlBarFactory{}
    property QtObject pos_handler: PositionHandler{}

    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Popup

    QtObject {
        id: settings

        property var general: Settings {
            property string font: "Open Sans"
            property string language: ""
            property bool show_close_button: true
        }

        property var position: Settings {
            category: "Position"
            property string side: "top"
            property int x_offset: 0
            property int y_offset: 0
        }

        property var geometry: Settings {
            category: "Geometry"
            property int width: 1024
            property int height: 256
            property int spacing: 5
            property int control_bar_size: 32
        }

        property var colors: Settings {
            category: "Colors"
            property string active: "grey"
            property string inactive: "darkgrey"
            property string key_border: "green"
            property string key: "black"
            property string text: "white"
        }
    }

    property QtObject position: pos_handler.resolve(settings.position.side)

    property int foldSize: settings.geometry.control_bar_size + settings.geometry.spacing*2

    maximumHeight: settings.geometry.height
    minimumHeight: position.horizontal() ? foldSize : maximumHeight
    height: maximumHeight

    maximumWidth: settings.geometry.width
    minimumWidth: position.vertical() ? foldSize : maximumWidth
    width: maximumWidth

    property int folded_x: x
    property int unfolded_x: x
    property int folded_y: y
    property int unfolded_y: y

    property string language: settings.general.language

    Loader {
        id: controlBar
        anchors.margins: settings.geometry.spacing

        height: position.horizontal() ? settings.geometry.control_bar_size : undefined
        width: position.vertical() ? settings.geometry.control_bar_size : undefined

        sourceComponent: controlBarFactory.get(settings.position.side)

        Component.onCompleted: {
            anchors.top = position.control_bar_side !== Position.Side.Bottom ? parent.top : undefined
            anchors.left = position.control_bar_side !== Position.Side.Right ? parent.left : undefined
            anchors.right = position.control_bar_side !== Position.Side.Left ? parent.right : undefined
            anchors.bottom = position.control_bar_side !== Position.Side.Top ? parent.bottom : undefined
        }
    }

    Item {
        id: keyboardDock
        anchors.margins: settings.geometry.spacing

        anchors.top: position.control_bar_side === Position.Side.Top ? controlBar.bottom : parent.top
        anchors.left: position.control_bar_side === Position.Side.Left ? controlBar.right : parent.left
        anchors.right: position.control_bar_side === Position.Side.Right ? controlBar.left : parent.right
        anchors.bottom: position.control_bar_side === Position.Side.Bottom ? controlBar.top : parent.bottom

        states: [ "unfolded", "folded", "forcibly_folded" ]
        state: "unfolded"

        property int foldingDuration: 150

        function fold() {
            state = "folded"
            kbLoader.visible = false
        }

        function unfold() {
            if (state !== "forcibly_folded") {
                state = "unfolded"
            }
        }

        function forceFold() {
            state = "forcibly_folded"
            kbLoader.visible = false
        }

        function forceUnfold() {
            state = "unfolded"
        }

        transitions: [
            Transition {
                from: "unfolded"
                to: "folded"
                NumberAnimation {
                    target: mainWindow
                    properties: "height"
                    from: mainWindow.height
                    to: mainWindow.minimumHeight
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "width"
                    from: mainWindow.width
                    to: mainWindow.minimumWidth
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "x"
                    from: mainWindow.x
                    to: mainWindow.folded_x
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "y"
                    from: mainWindow.y
                    to: mainWindow.folded_y
                    duration: keyboardDock.foldingDuration
                }
                onRunningChanged: {
                    mouseCheck.blockUpdates = running
                }
            },
            Transition {
                from: "unfolded"
                to: "forcibly_folded"
                NumberAnimation {
                    target: mainWindow
                    properties: "height"
                    from: mainWindow.height
                    to: mainWindow.minimumHeight
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "width"
                    from: mainWindow.width
                    to: mainWindow.minimumWidth
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "x"
                    from: mainWindow.x
                    to: mainWindow.folded_x
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "y"
                    from: mainWindow.y
                    to: mainWindow.folded_y
                    duration: keyboardDock.foldingDuration
                }
            },
            Transition {
                from: "folded"
                to: "forcibly_folded"
                NumberAnimation {
                    target: mainWindow
                    properties: "height"
                    from: mainWindow.height
                    to: mainWindow.minimumHeight
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "width"
                    from: mainWindow.width
                    to: mainWindow.minimumWidth
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "x"
                    from: mainWindow.x
                    to: mainWindow.folded_x
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "y"
                    from: mainWindow.y
                    to: mainWindow.folded_y
                    duration: keyboardDock.foldingDuration
                }
            },
            Transition {
                from: "folded"
                to: "unfolded"
                NumberAnimation {
                    target: mainWindow
                    properties: "height"
                    from: mainWindow.height
                    to: mainWindow.maximumHeight
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "width"
                    from: mainWindow.width
                    to: mainWindow.maximumWidth
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "x"
                    from: mainWindow.x
                    to: mainWindow.unfolded_x
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "y"
                    from: mainWindow.y
                    to: mainWindow.unfolded_y
                    duration: keyboardDock.foldingDuration
                }
                onRunningChanged: {
                    kbLoader.visible = !running
                    mouseCheck.blockUpdates = running
                }
            },
            Transition {
                from: "forcibly_folded"
                to: "unfolded"
                NumberAnimation {
                    target: mainWindow
                    properties: "height"
                    from: mainWindow.height
                    to: mainWindow.maximumHeight
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "width"
                    from: mainWindow.width
                    to: mainWindow.maximumWidth
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "x"
                    from: mainWindow.x
                    to: mainWindow.unfolded_x
                    duration: keyboardDock.foldingDuration
                }
                NumberAnimation {
                    target: mainWindow
                    properties: "y"
                    from: mainWindow.y
                    to: mainWindow.unfolded_y
                    duration: keyboardDock.foldingDuration
                }
                onRunningChanged: {
                    kbLoader.visible = !running
                    mouseCheck.blockUpdates = running
                }
            }
        ]

        Loader {
            id: kbLoader
            visible: true
            anchors.fill: parent
        }
    }

    MouseArea {
        id: mouseCheck
        anchors.fill: parent
        anchors.margins: settings.geometry.spacing
        enabled: false
        hoverEnabled: true
        propagateComposedEvents: true
        acceptedButtons: Qt.NoButton
        property bool blockUpdates: false

        function updateFold() {
            if (blockUpdates || keyboardDock.state === "forcibly_folded") return

            if (containsMouse) {
                keyboardDock.unfold()
            } else {
                keyboardDock.fold()
            }
        }

        onContainsMouseChanged: updateFold()
    }

    Timer {
        id: startupFoldDelay
        running: false
        repeat: false
        interval: 500 // ms

        onTriggered: {
            mouseCheck.enabled = true
            mouseCheck.updateFold()
        }
    }

    Component.onCompleted: {
        folded_x = position.control_bar_side === Position.Side.Right ? position.x + maximumWidth - foldSize : position.x
        folded_y = position.control_bar_side === Position.Side.Bottom ? position.y + maximumHeight - foldSize : position.y
        unfolded_x = position.x
        unfolded_y = position.y

        loadKeyboardLayout()

        keyboardDock.state = "unfolded"
        x = unfolded_x
        y = unfolded_y

        startupFoldDelay.start()
    }

    color: keyboardDock.state === "unfolded" ? Qt.rgba(0,0,0,0.8) : Qt.rgba(0,0,0,0.5)

    function loadKeyboardLayout() {
        if (language.length === 0) {
            var locale = Qt.inputMethod.locale.name
            console.log("Found locale: ", locale)

            if (locale.length > 4) {
                language = locale.substring(3,5)
            } else if (locale.length > 1) {
                language = locale.substring(0,2)
            }

            if (language.length === 0) {
                language = "us"
            }
        }

        language = language.toLowerCase()
        console.log("Loading layout for language:", language)
        kbLoader.setSource("Layout_" + language + ".qml")
    }

    Component.onDestruction: {
        settings.general.language = mainWindow.language
    }
}
