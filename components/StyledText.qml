import qs.config
import QtQuick

Text {
    font.family: Theme.fontFamily
    color: Styling.theme.basecontent
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
