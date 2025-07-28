import qs.config
import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    id: root
    required property Component content
    margin: 8
    radius: 8
    color: Theme.palette.base100
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
    Loader {
        active: true
        sourceComponent: content
    }
}
