import qs.config
import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: window

    required property string name
    property alias background: background

    WlrLayershell.namespace: `lux-${name}`
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
        border.color: Styling.theme.base200
        Behavior on border.color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
    }
}
