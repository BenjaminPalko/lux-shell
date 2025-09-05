import qs.config
import QtQuick

Text {
    font.family: Styling.lucide.font.family
    font.pixelSize: 16

    color: Styling.theme.basecontent
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
