import qs.components
import qs.constants
import qs.services
import QtQuick

StyledIconButton {
    id: root

    onClicked: {
        menu.toggle();
    }

    text: Notifications.hasNotifications ? Icons.bell : Icons.bellRing

    states: State {
        when: Notifications.hasNotifications
        PropertyChanges {
            root {
                text: Icons.bellRing
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
