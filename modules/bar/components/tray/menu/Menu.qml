pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../config/"
import "../../../../../styled/"

StyledPopupWindow {
    id: window

    backgroundColor: Theme.palette.base300
    radius: 8

    property QsMenuOpener menuOpener

    content: ColumnLayout {
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
                                duration: (repeater.count / root.animationDuration) * loader.index
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
