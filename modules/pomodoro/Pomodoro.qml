pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

StyledPanelWindow {
    id: root
    name: "pomodoro"

    visible: Visibility.pomodoro
    implicitWidth: rect.width
    implicitHeight: rect.height

    onFocusedChanged: {
        Visibility.pomodoro = focused;
    }

    WrapperItem {
        id: rect

        leftMargin: 48
        rightMargin: 48
        topMargin: 24
        bottomMargin: 24

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
                    borderColor: Styling.theme.base100
                    strokeColor: PomodoroService.state == "timer" ? Styling.theme.primary : Styling.theme.warning
                    strokeWidth: 12
                    fillColor: button.hovered ? Styling.theme.primary : "transparent"
                    percentage: (PomodoroService.state == "timer" ? (PomodoroService.initialTime - PomodoroService.remainingTime) : PomodoroService.remainingTime) / PomodoroService.initialTime % 1
                }

                StyledIconButton {
                    id: button

                    anchors.centerIn: circle

                    radius: 9999

                    focus: root.visible
                    text: PomodoroService.running ? Styling.lucide.icons.square : Styling.lucide.icons.play
                    font.pixelSize: 48

                    background: Item {}
                    onClicked: {
                        PomodoroService.toggle();
                    }

                    Keys.onSpacePressed: event => {
                        event.accepted = true;
                        PomodoroService.toggle();
                    }
                    Keys.onEscapePressed: event => {
                        event.accepted = true;
                        Visibility.pomodoro = false;
                    }
                    Keys.onTabPressed: event => {
                        event.accepted = true;
                        PomodoroService.reset();
                    }
                }
            }

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: {
                    const date = new Date(PomodoroService.remainingTime);
                    return `${date.getMinutes().toString().padStart(2, "0")}:${(date.getSeconds() % 3600).toString().padStart(2, "0")}`;
                }
                font.pixelSize: 16
            }

            StyledButton {

                Layout.alignment: Qt.AlignHCenter

                text: "Reset"

                onClicked: {
                    PomodoroService.reset();
                }
            }
        }
    }
}
