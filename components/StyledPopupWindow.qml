import qs.config
import QtQuick
import Quickshell
import Quickshell.Hyprland

PopupWindow {
    id: root

    required property Component content

    implicitWidth: background.width
    implicitHeight: background.height
    color: "transparent"

    HyprlandFocusGrab {
        id: grab
        active: root.visible
        windows: [root]
        onCleared: {
            background.state = "closed";
        }
    }

    function toggle() {
        background.state = background.state == "opened" ? "closed" : "opened";
    }

    StyledWrapperRectangle {
        id: background

        margin: 16
        focus: true
        onFocusChanged: {
            if (!focus) {
                grab.active = false;
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: Styling.animations.speed.normal
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
