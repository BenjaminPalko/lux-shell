import qs.config
import QtQuick
import QtQuick.Controls

Slider {
    id: control

    height: 24

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: control.height
        width: control.availableWidth
        height: implicitHeight
        radius: 8
        color: Theme.palette.base100

        Rectangle {
            width: control.visualPosition * parent.width
            Behavior on width {
                NumberAnimation {
                    duration: 75
                }
            }
            height: parent.height
            color: Theme.palette.primary
            radius: 8
        }
    }
    handle: null
}
