import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "../../../../config/"
import "../../../../styled/"
import "menu/"

Clickable {
    id: root

    property SystemTrayItem trayItem
    property bool menuOpened: false

    implicitWidth: Dimensions.tray.width
    implicitHeight: Dimensions.tray.height

    onClicked: toggleMenu()

    function toggleMenu() {
        menuOpened = !menuOpened;
    }

    IconImage {
        id: icon
        anchors.margins: 6
        anchors.fill: parent
        asynchronous: true
        source: {
            let icon = modelData.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
        anchors.centerIn: parent
    }

    PopupWindow {
        id: popup

        visible: root.menuOpened

        color: 'transparent'

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8

        implicitWidth: menu.width
        implicitHeight: menu.height

        Rectangle {
            anchors.fill: parent
            color: Theme.palette.base300
            radius: 8
        }

        Menu {
            id: menu

            menuOpener: QsMenuOpener {
                menu: trayItem.menu
            }
        }
    }
}
