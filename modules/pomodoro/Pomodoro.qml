pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.constants
import qs.services
import qs.widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

StyledWindow {
    id: root
    name: "pomodoro"

    visible: Visibility.pomodoro
    implicitWidth: rect.width
    implicitHeight: rect.height

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    WrapperRectangle {
        id: rect

        color: Theme.palette.base300
        leftMargin: 48
        rightMargin: 48
        topMargin: 24
        bottomMargin: 24
        radius: 8

        HyprlandFocusGrab {
            active: Visibility.pomodoro
            windows: [root]
            onCleared: {
                Visibility.pomodoro = false;
            }
        }

        ColumnLayout {

            spacing: 22

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: "Pomodoro"
                font.pixelSize: 22
            }

            Item {
                implicitWidth: circle.width
                implicitHeight: circle.height

                Circle {
                    id: circle
                    radius: 150
                    borderColor: Theme.palette.base100
                    strokeColor: Pomodoro.state == "timer" ? Theme.palette.primary : Theme.palette.warning
                    strokeWidth: 12
                    fillColor: button.hovered ? Theme.palette.primary : "transparent"
                    percentage: (Pomodoro.state == "timer" ? (Pomodoro.initialTime - Pomodoro.remainingTime) : Pomodoro.remainingTime) / Pomodoro.initialTime % 1
                }

                StyledIconButton {
                    id: button

                    anchors.centerIn: circle

                    radius: 9999

                    focus: root.visible
                    text: Pomodoro.running ? Icons.square : Icons.play
                    font.pixelSize: 48

                    background: undefined
                    onClicked: {
                        Pomodoro.toggle();
                    }

                    Keys.onSpacePressed: event => {
                        event.accepted = true;
                        Pomodoro.toggle();
                    }
                    Keys.onEscapePressed: event => {
                        event.accepted = true;
                        Visibility.pomodoro = false;
                    }
                    Keys.onTabPressed: event => {
                        event.accepted = true;
                        Pomodoro.reset();
                    }
                }
            }

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: {
                    const date = new Date(Pomodoro.remainingTime);
                    return `${date.getMinutes().toString().padStart(2, "0")}:${(date.getSeconds() % 3600).toString().padStart(2, "0")}`;
                }
                font.pixelSize: 16
            }

            StyledButton {

                Layout.alignment: Qt.AlignHCenter

                content: StyledText {
                    text: "Reset"
                    font.pixelSize: 14
                }

                onClicked: {
                    Pomodoro.reset();
                }
            }
        }
    }
}
