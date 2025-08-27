pragma ComponentBehavior: Bound

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

            Circle {
                id: circle
                radius: 150
                color: Pomodoro.state == "timer" ? Theme.palette.primary : Theme.palette.warning
                percentage: (Pomodoro.state == "timer" ? (Pomodoro.initialTime - Pomodoro.remainingTime) : Pomodoro.remainingTime) / Pomodoro.initialTime % 1

                WrapperRectangle {
                    color: "transparent"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    ColumnLayout {
                        spacing: 18
                        StyledButton {

                            Layout.alignment: Qt.AlignHCenter

                            focus: root.visible

                            content: LucideIcon {
                                text: Pomodoro.running ? Icons.square : Icons.play
                                font.pixelSize: 20
                            }

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
                        StyledText {
                            Layout.alignment: Qt.AlignHCenter
                            text: {
                                const date = new Date(Pomodoro.remainingTime);
                                return `${date.getMinutes().toString().padStart(2, "0")}:${(date.getSeconds() % 3600).toString().padStart(2, "0")}`;
                            }
                            font.pixelSize: 16
                        }
                    }
                }
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
