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
    id: root
    required property BluetoothDevice device

    RowLayout {
        id: row

        spacing: 8

        Loader {
            active: root.device?.icon != undefined
            sourceComponent: IconImage {
                implicitSize: 22
                source: Quickshell.iconPath(root.device.icon, "device-support-unknown-symbolic")
            }
        }

        StyledText {
            text: root.device.deviceName
        }

        Loader {
            active: root.device.batteryAvailable
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
                            when: root.device.battery > 0.66
                        },
                        State {
                            name: "medium"
                            when: root.device.battery > 0.33
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "low"
                            when: root.device.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "critical"
                            when: root.device.battery > 0.10
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
                font.pixelSize: 12
            }
            onClicked: {
                if (root.device.state != BluetoothDeviceState.Connected) {
                    return;
                }
                root.device.connected = false;
            }
        }
    }
}
