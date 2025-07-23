import QtQuick
import "../config/"

MouseArea {
    id: mouseArea

    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    property alias color: rectangle.color
    property alias border: rectangle.border

    Rectangle {
        id: rectangle
        anchors.fill: parent

        radius: Dimensions.radius
        color: mouseArea.containsMouse ? Theme.palette.primary : Theme.palette.base100
        Behavior on color {
            ColorAnimation {
                properties: "color"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}
