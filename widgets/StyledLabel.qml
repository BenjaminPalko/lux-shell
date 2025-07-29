import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    id: root
    margin: 8
    radius: 8
    color: Theme.palette.base100
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
