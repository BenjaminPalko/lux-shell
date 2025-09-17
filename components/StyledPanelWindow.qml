import qs.config
import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

PanelWindow {
    id: window

    default property alias content: contentItem.data
    property alias background: background
    required property string name
    property bool canFocus: true
    property bool focused: false
    property int padding: 4

    WlrLayershell.namespace: `lux-${name}`
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: window.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    onVisibleChanged: {
        if (!canFocus)
            return;
        focused = visible;
    }
    HyprlandFocusGrab {
        active: window.focused
        windows: [window]
        onCleared: {
            if (!window.canFocus)
                return;
            window.focused = false;
        }
    }

    color: "transparent"

    Rectangle {
        id: background
        anchors.fill: parent
        radius: Styling.theme.radiusBox
        Behavior on radius {
            NumberAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        color: Styling.theme.base100
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        border.width: 2
        border.color: Styling.theme.base300
        Behavior on border.color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
    }

    Item {
        id: contentItem

        anchors.centerIn: parent
        implicitWidth: parent.width - 2 * window.padding
        implicitHeight: parent.height - 2 * window.padding
    }
}
