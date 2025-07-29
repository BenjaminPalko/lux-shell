pragma ComponentBehavior: Bound

import qs.config
import qs.constants
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Widgets

StyledLabel {
    id: device
    required property BluetoothDevice modelData

    RowLayout {
        id: row

        spacing: 8

        Loader {
            active: modelData.icon != undefined
            sourceComponent: IconImage {
                implicitSize: 18
                source: Quickshell.iconPath(modelData.icon)
            }
        }

        StyledText {
            text: device.modelData.deviceName
        }

        Loader {
            active: device.modelData.batteryAvailable
            sourceComponent: RowLayout {
                StyledText {
                    id: icon
                    font.family: Theme.lucide.font.family
                    font.pixelSize: Dimensions.cpu.iconSize
                    font.bold: true
                    text: Icons.batteryFull
                    states: [
                        State {
                            name: "full"
                            when: device.modelData.battery > 0.66
                        },
                        State {
                            name: "medium"
                            when: device.modelData.battery > 0.33
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "low"
                            when: device.modelData.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "critical"
                            when: device.modelData.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryWarning
                                    color: Theme.palette.error
                                }
                            }
                        }
                    ]
                }
            }
        }

        StyledButton {
            Layout.alignment: Qt.AlignRight
            color: containsMouse ? Theme.palette.error : Theme.palette.base200
            content: StyledText {
                text: 'Disconnect'
            }
            onClicked: {
                if (modelData.state != BluetoothDeviceState.Connected) {
                    return;
                }
                modelData.disconnect();
            }
        }
    }
}
