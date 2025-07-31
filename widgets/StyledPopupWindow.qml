import qs.services
import QtQuick
import Quickshell
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
        Visibility.togglePopup(this);
    }

    implicitWidth: background.width
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
        }
    }
    implicitHeight: background.height
    Behavior on implicitHeight {
        NumberAnimation {
            duration: 100
        }
    }

    WrapperRectangle {
        id: background

        opacity: 0
        Behavior on opacity {
            NumberAnimation {
                duration: root.animationDuration
            }
        }

        states: State {
            name: "opened"
            when: root.opened
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
                ScriptAction {
                    script: root.visible = true
                }
            },
            Transition {
                from: "opened"
                to: ""
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
