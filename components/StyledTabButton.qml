import qs.config
import QtQuick
import QtQuick.Controls

TabButton {
    id: control

    property alias radius: rectangle.radius
    padding: 8
    radius: Styling.theme.radiusField

    contentItem: Text {
        font.pixelSize: Styling.typography.textSize.base
        font.family: Styling.typography.fontFamily
        text: control.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: control.hovered ? Styling.theme.primarycontent : Styling.theme.basecontent
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
    }

    background: Rectangle {
        id: rectangle
        color: control.hovered ? Styling.theme.primary : Styling.theme.base100
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        opacity: control.checked || control.hovered ? 1.0 : 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: Styling.animations.speed.normal
            }
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
