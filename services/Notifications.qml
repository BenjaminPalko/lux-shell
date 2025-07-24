pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property bool hasNotifications: notifications.length > 0
    property list<Notification> notifications: []

    function clear() {
        notifications.forEach(notification => {
            notification.dismiss();
        });
        notifications = [];
    }

    NotificationServer {
        onNotification: event => {
            event.tracked = true;
            root.notifications.push(event);
        }
    }
}
