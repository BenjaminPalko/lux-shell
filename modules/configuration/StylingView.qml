import qs.components
import qs.components.composite
import qs.config
import QtQuick
import QtQuick.Layouts

StyledPane {
    GridLayout {

        columnSpacing: Styling.layout.spacing.xl

        StyledText {
            text: "Theme"
            font.pixelSize: Styling.typography.textSize.lg
        }

        ThemeComboBox {}
    }
}
