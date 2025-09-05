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
    ColorAnimation on palette.button {
        duration: 100
    }
    palette.buttonText: hoverEnabled && hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
    ColorAnimation on palette.buttonText {
        duration: 100
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
