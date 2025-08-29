import qs.config
import QtQuick
import QtQuick.Controls

RoundButton {
    id: control

    FontLoader {
        id: loader
        source: "../assets/lucide.woff"
    }

    property alias border: rect.border
    property color color: hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
    property int rotation: 0

    font.family: loader.font.family
    font.pixelSize: 18
    radius: 8
    padding: 6

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
                duration: 100
            }
        }
        rotation: control.rotation
        Behavior on rotation {
            RotationAnimation {
                duration: 200
                easing.type: Easing.InOutCubic
            }
        }
    }

    background: Rectangle {
        id: rect
        border.color: control.hovered ? Theme.palette.primary : Theme.palette.base100
        Behavior on border.color {
            ColorAnimation {
                duration: 100
            }
        }
        border.width: 2
        color: control.hovered ? Theme.palette.primary : Theme.palette.base100
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }
        radius: control.radius
    }
}
