pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets

StyledPanelWindow {
    id: root
    name: "powermenu"

    visible: Visibility.powermenu
    implicitWidth: rect.width
    implicitHeight: rect.height

    Process {
        id: process
    }

    onFocusedChanged: {
        Visibility.powermenu = focused;
    }

    WrapperItem {
        id: rect

        margin: 14

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

            spacing: Styling.layout.spacing.base

            implicitWidth: 220
            implicitHeight: 185

            highlightMoveDuration: 1000
            highlightResizeDuration: 0
            highlight: Rectangle {
                radius: 8
                color: Styling.theme.primary
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
                color: list.currentIndex == index ? Styling.theme.primarycontent : Styling.theme.basecontent
                text: modelData.text
                font.pixelSize: Styling.typography.textSize.lg
                font.bold: true
            }
        }
    }
}
