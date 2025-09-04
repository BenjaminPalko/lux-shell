import qs.config
import QtQuick
import Quickshell
import Quickshell.Hyprland

PopupWindow {
    id: root

    implicitWidth: contentItem.children.reduce((prev, child) => Math.max(prev, child.width), 0)
    implicitHeight: contentItem.children.reduce((prev, child) => prev + child.height, 0)
    color: "transparent"
    contentItem.focus: visible

    function open() {
        visible = true;
    }

    function close() {
        visible = false;
    }

    // WlrLayershell.layer: WlrLayer.Top
    // WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None
    HyprlandFocusGrab {
        active: root.visible
        windows: [root]
        onCleared: {
            root.close();
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: Theme.palette.base200
        radius: 8
    }
}
