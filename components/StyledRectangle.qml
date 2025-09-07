import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    id: root
    margin: 8
    radius: Styling.theme.radiusBox
    color: Styling.theme.base200
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }
}
