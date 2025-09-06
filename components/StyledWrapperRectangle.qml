import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    radius: Styling.theme.radiusBox
    color: Styling.theme.base100
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
