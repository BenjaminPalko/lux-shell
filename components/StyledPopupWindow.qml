import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets

PopupWindow {
    id: root
    property bool opened: false
    property int animationDuration: 200
    property alias margins: background.margin
    property alias backgroundColor: background.color
    property alias radius: background.radius
    property alias state: background.state
    required property Component content

    color: "transparent"

    function toggle() {
        root.state = root.state == "opened" ? "closed" : "opened";
    }

    HyprlandFocusGrab {
        id: grab
        active: root.visible
        windows: [root]
        onCleared: {
            root.state = "closed";
        }
    }

    implicitWidth: background.width
    implicitHeight: background.height

    WrapperRectangle {
        id: background

        focus: true
        onFocusChanged: {
            if (!focus) {
                grab.active = false;
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration
            }
        }

        state: "closed"
        states: [
            State {
                name: "closed"
                PropertyChanges {
                    background {
                        opacity: 0
                    }
                }
            },
            State {
                name: "opened"
                PropertyChanges {
                    background {
                        opacity: 1
                    }
                }
            }
        ]

        transitions: [
            Transition {
                from: "closed"
                to: "opened"
                ScriptAction {
                    script: root.visible = true
                }
            },
            Transition {
                from: "opened"
                to: "closed"
                SequentialAnimation {
                    PauseAnimation {
                        duration: root.animationDuration
                    }
                    ScriptAction {
                        script: root.visible = false
                    }
                }
            }
        ]

        Loader {
            active: root.visible
            sourceComponent: root.content
        }
    }
}
