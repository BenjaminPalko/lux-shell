pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

StyledWindow {
    id: root
    name: "powermenu"

    visible: Visibility.powermenu
    implicitWidth: rect.width
    implicitHeight: rect.height

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    Process {
        id: process
    }

    StyledWrapperRectangle {
        id: rect

        margin: 14
        radius: 8

        HyprlandFocusGrab {
            active: Visibility.powermenu
            windows: [root]
            onCleared: {
                Visibility.powermenu = false;
            }
        }

        StyledListView {
            id: list

            Layout.fillWidth: true

            focus: Visibility.powermenu
            Keys.onEscapePressed: event => {
                event.accepted = true;
                Visibility.powermenu = false;
            }
            Keys.onReturnPressed: event => {
                event.accepted = true;
                process.startDetached();
            }
            Keys.onSpacePressed: event => {
                event.accepted = true;
                process.startDetached();
            }
            Keys.onUpPressed: event => {
                event.accepted = true;
                list.decrementCurrentIndex();
            }
            Keys.onDownPressed: event => {
                event.accepted = true;
                list.incrementCurrentIndex();
            }

            model: Config.powermenu.actions

            spacing: 8

            implicitWidth: 220
            implicitHeight: 185

            highlightMoveDuration: 1000
            highlightResizeDuration: 0
            highlight: Rectangle {
                radius: 8
                color: Theme.palette.primary
            }

            onCurrentItemChanged: {
                process.command = ["sh", "-c", list.currentItem.modelData.command];
            }

            delegate: StyledText {
                id: button
                required property var modelData
                required property int index

                anchors.left: parent.left
                anchors.right: parent.right

                MouseArea {
                    hoverEnabled: true
                    anchors.fill: button
                    onEntered: {
                        list.currentIndex = button.index;
                    }
                    onClicked: {
                        process.startDetached();
                    }
                }

                padding: 16
                color: list.currentIndex == index ? Theme.palette.primarycontent : Theme.palette.basecontent
                text: modelData.text
                font.pixelSize: 18
                font.bold: true
            }
        }
    }
}
