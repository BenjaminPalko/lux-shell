import qs.components
import qs.config
import QtQuick

StyledComboBox {
    id: control

    currentIndex: Theme.themes.indexOf(Theme.currentTheme)
    model: Theme.themes
    onActivated: index => {
        Theme.currentTheme = Theme.themes[index];
    }
}
