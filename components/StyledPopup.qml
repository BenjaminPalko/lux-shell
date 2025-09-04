import qs.config
import QtQuick
import Quickshell
import Quickshell.Hyprland

PopupWindow {
    id: root

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    color: "transparent"

    function open() {
        visible = true;
    }

    function close() {
        visible = false;
    }

    HyprlandFocusGrab {
        id: grab
        windows: [root]
        onCleared: {
            root.close();
        }
      }

    Rectangle {
        id: background
        anchors.centerIn: root
        implicitWidth: root.contentItem.children.reduce((prev, child) => Math.max(prev, child.width), 0)
        implicitHeight: root.contentItem.children.reduce((prev, child) => prev + child.height, 0)
        color: Theme.palette.base200
        radius: 8
    }
}
