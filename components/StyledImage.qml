import qs.config
import QtQuick
import Quickshell.Widgets

Image {

    property alias radius: rectangle.radius
    property alias skeletonColor: rectangle.color

    ClippingRectangle {
        id: rectangle

        color: Styling.theme.base200

        anchors.fill: parent
    }
}
