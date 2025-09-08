import qs.components
import qs.config
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GridLayout {
    flow: GridLayout.TopToBottom
    columns: 2
    rows: 10

    ColumnLayout {
        StyledText {
            text: "Icon Button"
            font.pixelSize: 18
        }
        StyledIconButton {
            text: Styling.lucide.icons.square
        }
    }

    ColumnLayout {
        StyledText {
            text: "Slider"
            font.pixelSize: 18
        }
        StyledSlider {
            id: slider
            from: 0
            to: 100
            value: 50
        }
    }
}
