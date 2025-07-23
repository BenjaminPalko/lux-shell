pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../config/"
import "../../../../../styled/"

PopupWindow {
    id: window

    property QsMenuOpener menuOpener
    property bool opened: false

    color: 'transparent'

    implicitWidth: menu.width
    implicitHeight: menu.height

    Rectangle {
        id: background

        anchors.fill: menu
        color: Theme.palette.base300
        border.color: Theme.palette.base200
        border.width: 2
        radius: 8

        opacity: 0

        states: State {
            name: "opened"
            when: window.opened
            PropertyChanges {
                background {
                    opacity: 1
                }
            }
        }

        transitions: [
            Transition {
                from: ""
                to: "opened"
                SequentialAnimation {
                    ScriptAction {
                        script: window.visible = true
                    }
                    NumberAnimation {
                        property: "background.opacity"
                        duration: 200
                    }
                }
            },
            Transition {
                from: "opened"
                to: ""
                SequentialAnimation {
                    PauseAnimation {
                        duration: repeater.count * 15
                    }
                    NumberAnimation {
                        property: "background.opacity"
                        duration: 200
                    }
                    ScriptAction {
                        script: window.visible = false
                    }
                }
            }
        ]
    }

    ColumnLayout {
        id: menu

        anchors.margins: 30

        Repeater {
            id: repeater
            model: window.menuOpener.children
            delegate: Loader {
                id: loader

                required property QsMenuEntry modelData
                required property int index

                active: true

                opacity: 0

                Layout.minimumWidth: 120

                sourceComponent: modelData.isSeparator ? menuSeperator : menuItem
                property Component menuSeperator: Rectangle {
                    implicitWidth: menu.width
                    implicitHeight: 2

                    color: Theme.palette.base100
                }
                property Component menuItem: MenuItem {
                    menuEntry: modelData
                }

                states: State {
                    name: "opened"
                    when: window.opened
                    PropertyChanges {
                        loader {
                            opacity: 1
                        }
                    }
                }

                transitions: [
                    Transition {
                        from: ""
                        to: "opened"
                        SequentialAnimation {
                            PauseAnimation {
                                duration: 15 * loader.index
                            }
                            NumberAnimation {
                                property: "opacity"
                                duration: 100
                            }
                        }
                    },
                    Transition {
                        from: "opened"
                        to: ""
                        SequentialAnimation {
                            PauseAnimation {
                                duration: 15 * (repeater.count - loader.index)
                            }
                            NumberAnimation {
                                property: "opacity"
                                duration: 200
                            }
                        }
                    }
                ]
            }
        }
    }
}
