import qs.config
import QtQuick

Text {
    font.family: Theme.fontFamily
    color: Theme.palette.basecontent
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.fast
        }
    }
}
