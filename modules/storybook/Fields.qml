import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts

ColumnLayout {

    spacing: Styling.layout.spacing.xl

    ColumnLayout {
        StyledText {
            text: "Button"
            font.pixelSize: 18
        }
        StyledPane {
            StyledButton {
                text: "Button"
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "Icon Button"
            font.pixelSize: 18
        }
        StyledPane {
            StyledIconButton {
                text: Styling.lucide.icons.square
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "Slider"
            font.pixelSize: 18
        }
        StyledPane {
            StyledSlider {
                id: slider
                from: 0
                to: 100
                value: 50
            }
        }
    }

    component FieldElement: QtObject {
        property string title
        property Component component
    }
}
