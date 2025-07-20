import QtQuick
import QtQuick.Effects
import "../config/"

Image {
    id: root

    property int size: 18
    property color color: Theme.palette.basecontent

    width: size
    height: size

    MultiEffect {
        id: effect
        source: root
        anchors.fill: root
        colorization: 1.0
        colorizationColor: color
    }
}
