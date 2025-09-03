import qs.config
import QtQuick

Text {
    color: Theme.palette.basecontent
    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }
    font.family: Theme.lucide.font.family
    font.pixelSize: Dimensions.gpu.iconSize
    font.bold: true
}
