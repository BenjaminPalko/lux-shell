pragma ComponentBehavior: Bound

import qs.components
import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "menu/"

StyledIconButton {
    id: root

    property SystemTrayItem trayItem

    onClicked: menu.toggle()

    contentItem: IconImage {
        id: icon
        asynchronous: true
        implicitSize: 18
        source: {
            let icon = root.trayItem.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
    }

    Menu {
        id: menu

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8

        menuOpener: QsMenuOpener {
            menu: root.trayItem.menu
        }
    }
}
