import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    anchors.fill: parent

    spacing: Styling.layout.spacing.xl

    StyledText {
        text: "Speaker Settings"
    }
    StyledPane {
        Layout.fillWidth: true
        padding: 24
        GridLayout {
            Layout.fillWidth: true

            columnSpacing: Styling.layout.spacing.xl

            StyledText {
                Layout.column: 1
                Layout.row: 1
                text: "Device"
            }

            StyledComboBox {
                Layout.column: 2
                Layout.row: 1
                Layout.fillWidth: true
                currentIndex: Pipewire.sinks.indexOf(Pipewire.sink)
                model: Pipewire.sinks.map(sink => sink.nickname ?? sink.name)
                onActivated: index => {
                    Pipewire.setSink(Pipewire.sinks[index]);
                }
            }

            StyledText {
                Layout.column: 1
                Layout.row: 2
                text: "Volume"
            }

            StyledSlider {
                Layout.column: 2
                Layout.row: 2
                from: 0.0
                to: 1.0
                value: Pipewire.volume
                onMoved: {
                    Pipewire.setVolume(value);
                }
            }
        }
    }

    StyledText {
        text: "Microphone Settings"
    }
    StyledPane {
        Layout.fillWidth: true
        padding: 24
        GridLayout {
            Layout.fillWidth: true

            columnSpacing: Styling.layout.spacing.xl

            StyledText {
                Layout.column: 1
                Layout.row: 2
                text: "Microphones"
            }

            StyledComboBox {
                Layout.column: 2
                Layout.row: 2
                Layout.fillWidth: true
                currentIndex: Pipewire.sources.indexOf(Pipewire.source)
                model: Pipewire.sources.map(source => source.nickname ?? source.name)
                onActivated: index => {
                    Pipewire.setSource(Pipewire.sinks[index]);
                }
            }
        }
    }
}
