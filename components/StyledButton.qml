import qs.config
import QtQuick
import QtQuick.Controls

Button {
    id: root
    property alias border: rectangle.border
    property alias radius: rectangle.radius

    font.pixelSize: Styling.typography.textSize.base
    font.family: Styling.typography.fontFamily
    verticalPadding: 6
    horizontalPadding: 8

    palette.button: hovered ? Styling.theme.primary : Styling.theme.base200
    Behavior on palette.button {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }
    palette.buttonText: hoverEnabled && hovered ? Styling.theme.primarycontent : Styling.theme.basecontent
    Behavior on palette.buttonText {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }

    wheelEnabled: true

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    background: Rectangle {
        id: rectangle
        color: root.palette.button
        radius: Styling.theme.radiusField
    }
}
