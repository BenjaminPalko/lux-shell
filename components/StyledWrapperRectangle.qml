import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    margin: 8
    radius: Styling.theme.radiusBox
    color: Styling.theme.base100
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
    border.width: 2
    border.color: Styling.theme.base100
    Behavior on border.color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
