import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    radius: 8
    color: Theme.palette.base100
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
