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
        radius: Styling.theme.radiusField
        color: Styling.theme.base200

        Rectangle {
            width: control.visualPosition * parent.width
            Behavior on width {
                NumberAnimation {
                    duration: Styling.animations.speed.fast
                }
            }
            height: parent.height
            color: Styling.theme.primary
            radius: Styling.theme.radiusField
        }
    }
    handle: null
}
