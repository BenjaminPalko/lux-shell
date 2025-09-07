import qs.config
import QtQuick

Rectangle {
    radius: Styling.theme.radiusBox
    color: Styling.theme.base100
    Behavior on color {
        ColorAnimation {
            duration: Styling.animations.speed.normal
        }
    }
}
