import qs.config
import QtQuick
import QtQuick.Controls

Pane {
    id: pane

    padding: 24
    background: Rectangle {
        color: "transparent"
        border.width: Styling.theme.border
        border.color: pane.hovered ? Styling.theme.accent : Styling.theme.basecontent
        opacity: 0.2
        Behavior on border.color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        radius: Styling.theme.radiusBox
    }
}
