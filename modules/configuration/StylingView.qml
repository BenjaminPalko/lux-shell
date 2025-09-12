import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts

StyledPane {
    GridLayout {

        columnSpacing: Styling.layout.spacing.xl

        StyledText {
            text: "Theme"
            // font.bold: true
            font.pixelSize: Styling.typography.textSize.lg
        }

        StyledComboBox {
            currentIndex: Theme.themes.indexOf(Theme.currentTheme)
            model: Theme.themes
            onActivated: index => {
                Theme.currentTheme = Theme.themes[index];
            }
        }
    }
}
