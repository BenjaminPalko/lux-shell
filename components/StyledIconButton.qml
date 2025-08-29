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

    font.family: loader.font.family
    font.pixelSize: 18
    radius: 8
    padding: 6

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    contentItem: Text {
        font: control.font
        text: control.text
        color: control.hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
        Behavior on color {
            ColorAnimation {
                duration: 100
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
