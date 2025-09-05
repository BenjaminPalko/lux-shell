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
        ColorAnimation on color {
            duration: 100
        }
        rotation: control.rotation
        RotationAnimation on rotation {
            duration: 200
            easing.type: Easing.InOutCubic
        }
    }

    background: Rectangle {
        id: rect
        border.color: control.hovered ? Theme.palette.base300 : Theme.palette.base200
        ColorAnimation on border.color {
            duration: 100
        }
        border.width: 0
        color: control.hovered ? Theme.palette.primary : Theme.palette.base200
        ColorAnimation on color {
            duration: 100
        }
        radius: control.radius
    }
}
