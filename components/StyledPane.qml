import qs.config
import QtQuick
import QtQuick.Controls

Pane {
    padding: 24
    background: Rectangle {
        color: "transparent"
        border.width: Styling.theme.border
        border.color: Styling.theme.basecontent
        opacity: 0.33
        Behavior on border.color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        radius: Styling.theme.radiusBox
    }
}
