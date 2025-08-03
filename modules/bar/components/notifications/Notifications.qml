import qs.config
import qs.constants
import qs.services
import qs.widgets
import QtQuick

StyledButton {
    id: root

    onClicked: {
        menu.toggle();
    }

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.notifications.fontSize
        font.bold: true
        text: Icons.bell

        color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        states: State {
            when: Notifications.hasNotifications
            PropertyChanges {
                text {
                    text: Icons.bellRing
                    color: root.containsMouse ? Theme.palette.base300 : Theme.palette.secondary
                }
            }
        }
    }

    NotificationMenu {
        id: menu

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8
    }
}
