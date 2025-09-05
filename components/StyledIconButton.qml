import qs.config
import QtQuick
import QtQuick.Controls

RoundButton {
    id: control

    property alias border: rect.border
    property color color: hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
    property int rotation: 0

    font.family: Styling.lucide.font.family
    font.pixelSize: 19
    radius: 8
    padding: 8

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    contentItem: Text {
        id: icon
        font: control.font
        text: control.text
        color: control.color
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        rotation: control.rotation
        Behavior on rotation {
            RotationAnimation {
                duration: Styling.animations.speed.slow
                easing.type: Easing.OutQuad
            }
        }
    }

    background: Rectangle {
        id: rect
        border.color: control.hovered ? Theme.palette.base300 : Theme.palette.base200
        Behavior on border.color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        border.width: 0
        color: control.hovered ? Theme.palette.primary : Theme.palette.base200
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        radius: control.radius
    }
}
