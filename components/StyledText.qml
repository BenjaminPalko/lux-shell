import qs.config
import QtQuick

Text {
    font.family: Styling.typography.fontFamily
    font.pixelSize: Styling.typography.textSize.base
    color: Styling.theme.basecontent
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
