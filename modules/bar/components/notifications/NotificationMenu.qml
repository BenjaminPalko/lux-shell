pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
                text: "Clear"
                onClicked: Notifications.clear()
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

                header: StyledText {
                    text: "Notifications"
                    font.bold: true
                    font.pixelSize: 16
                }
                model: Notifications.list
                delegate: NotificationItem {}
            }
        }
    }
}
