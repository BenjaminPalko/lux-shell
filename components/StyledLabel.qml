import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    id: root
    margin: 8
    radius: 8
    color: Theme.palette.base200
    ColorAnimation on color {
        duration: 200
        easing.type: Easing.InOutQuad
    }
}
