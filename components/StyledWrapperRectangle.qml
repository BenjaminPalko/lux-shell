import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    radius: 8
    color: Theme.palette.base100
    ColorAnimation on color {
        duration: 200
        easing.type: Easing.InOutQuad
    }
}
