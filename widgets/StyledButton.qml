import qs.config
import QtQuick
import Quickshell.Widgets

WrapperMouseArea {
    id: root
    required property Component content
    property alias padding: rectangle.margin
    property alias color: rectangle.color
    property alias border: rectangle.border
    property alias radius: rectangle.radius

    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor

    WrapperRectangle {
        id: rectangle
        margin: 8
        radius: 8
        color: root.containsMouse && root.hoverEnabled ? Theme.palette.primary : Theme.palette.base100
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
}
