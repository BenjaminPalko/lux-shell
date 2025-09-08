import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 800
    implicitHeight: 400

    ColumnLayout {
        spacing: 0
        anchors.fill: parent
        StyledText {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            text: "Configurations"
            font.pixelSize: Styling.typography.textSize.xl
            padding: 8
        }

        StyledRectangle {
            id: titleBar

            Layout.fillWidth: true
            Layout.preferredHeight: 4
        }

        ScrollView {
            id: view

            Layout.fillHeight: true
            padding: 24
            background: Item {}

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
    }

    component Menus: QtObject {
        property Component theme
    }
}
