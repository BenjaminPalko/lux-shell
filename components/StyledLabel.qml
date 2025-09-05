import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    id: root
    margin: 8
    radius: 8
    color: Styling.theme.base200
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }
}
