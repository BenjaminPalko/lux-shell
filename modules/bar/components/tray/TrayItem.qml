import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "../../../../config/"
import "../../../../styled/"
import "menu/"

Loader {
    required property SystemTrayItem modelData

    active: modelData.hasMenu

    onLoaded: console.log(modelData.icon)
    sourceComponent: item
    property Component item: Clickable {
        id: clickable

        property bool menuOpen

        width: Dimensions.tray.width
        height: Dimensions.tray.height

        onClicked: menuOpen = !menuOpen

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

        // Loader {
        //     active: menuOpen && modelData.hasMenu
        //
        //     property Component menu: Menu {
        //         menu: modelData.menu
        //     }
        // }
        PopupWindow {

            Menu {
                menu: modelData.menu
            }
        }
    }
}
