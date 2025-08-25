pragma ComponentBehavior: Bound

import qs.config
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

StyledPopupWindow {
    id: root

    backgroundColor: Theme.palette.base300
    margins: 16
    radius: 8

    content: ColumnLayout {
        spacing: 16

        RowLayout {
            Layout.fillWidth: true
            StyledText {
                text: "Enabled"
            }

            Switch {
                checked: Notifications.enabled
                onClicked: Notifications.enabled = checked
            }

            StyledButton {
                id: clearButton
                Layout.alignment: Qt.AlignRight
                onClicked: Notifications.clear()
                content: StyledText {
                    text: "Clear"
                    color: clearButton.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
                }
            }
        }

        StyledLabel {
            color: Theme.palette.base200
            StyledListView {
                id: notifications

                spacing: 8
                implicitHeight: 300
                implicitWidth: 300
                clip: true

                header: WrapperRectangle {
                    margin: 8
                    color: 'transparent'
                    StyledText {
                        text: "Notifications"
                        font.bold: true
                        font.pixelSize: 16
                    }
                }
                model: Notifications.list
                delegate: NotificationItem {}
            }
        }
    }
}
