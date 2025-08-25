pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property bool enabled: true
    property bool hasNotifications: list.length > 0
    property list<Notification> list: []

    function clear() {
        list.forEach(notification => {
            notification?.dismiss();
        });
        list = [];
    }

    NotificationServer {
        id: server

        keepOnReload: false
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        onNotification: event => {
            if (!root.enabled) {
                return;
            }

            if (event == null) {
                console.log("Event is null?");
                return;
            }

            event.tracked = true;
            root.list = root.list.filter(item => item != null && item.id != event.id).push(event);
        }
    }
}
