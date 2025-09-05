import qs.components
import qs.config
import qs.services
import QtQuick

StyledIconButton {
    id: root

    onClicked: {
        menu.toggle();
    }

    text: Notifications.hasNotifications ? Styling.lucide.icons.bell : Styling.lucide.icons.bellRing

    states: State {
        when: Notifications.hasNotifications
        PropertyChanges {
            root {
                text: Styling.lucide.icons.bellRing
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
