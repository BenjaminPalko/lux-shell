import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    radius: 8
    color: Theme.palette.base300
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
