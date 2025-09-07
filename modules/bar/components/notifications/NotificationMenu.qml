pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Layouts

StyledPopupWindow {
    id: root

    backgroundColor: Styling.theme.base300
    margins: 16
    radius: 8

    content: GridLayout {

        columns: 2

        StyledSwitch {
            text: "Enabled"
            checked: Notifications.enabled
            onClicked: Notifications.enabled = checked
        }

        StyledButton {
            Layout.alignment: Qt.AlignRight
            text: "Clear"
            onClicked: Notifications.clear()
        }

        StyledRectangle {
            Layout.columnSpan: 2
            color: Styling.theme.base200
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
