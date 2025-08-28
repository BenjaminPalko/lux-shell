import qs.config
import QtQuick
import QtQuick.Controls

RoundButton {
    id: control

    radius: 8
    font.family: Theme.lucide.font.family
    font.pixelSize: 15
    font.bold: true
    padding: 8

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    contentItem: Text {
        text: control.text
        color: control.hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }
        font: control.font
    }

    background: Rectangle {
        color: control.hovered ? Theme.palette.primary : Theme.palette.base100
        Behavior on color {
            ColorAnimation {
                duration: 100
            }
        }
        radius: control.radius
    }
}
