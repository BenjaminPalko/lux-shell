import qs.config
import QtQuick
import QtQuick.Controls.Basic

TabButton {
    id: control

    contentItem: Text {
        id: icon
        font.pixelSize: Styling.typography.textSize.base
        font.family: Styling.typography.fontFamily
        text: control.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        padding: 6
        color: control.hovered ? Styling.theme.primarycontent : Styling.theme.basecontent
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
        id: rectangle
        color: control.hovered ? Styling.theme.primary : Styling.theme.base200
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.normal
            }
        }
        // radius: Styling.theme.radiusField
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }
}
