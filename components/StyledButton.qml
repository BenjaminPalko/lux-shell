import qs.config
import QtQuick
import QtQuick.Controls

Button {
    id: root
    property alias border: rectangle.border
    property alias radius: rectangle.radius

    font.pixelSize: 14
    verticalPadding: 6
    horizontalPadding: 8

    palette.button: hovered ? Theme.palette.primary : Theme.palette.base200
    Behavior on palette.button {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }
    palette.buttonText: hoverEnabled && hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
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
        radius: 8
    }
}
