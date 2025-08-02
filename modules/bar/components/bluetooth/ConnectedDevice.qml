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
    required property BluetoothDevice modelData

    RowLayout {
        id: row

        spacing: 8

        Loader {
            active: root.modelData?.icon != undefined
            sourceComponent: IconImage {
                implicitSize: 22
                source: Quickshell.iconPath(root.modelData.icon, "device-support-unknown-symbolic")
            }
        }

        StyledText {
            text: root.modelData.deviceName
        }

        Loader {
            active: root.modelData.batteryAvailable
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
                            when: root.modelData.battery > 0.66
                        },
                        State {
                            name: "medium"
                            when: root.modelData.battery > 0.33
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "low"
                            when: root.modelData.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "critical"
                            when: root.modelData.battery > 0.10
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
                if (root.modelData.state != BluetoothDeviceState.Connected) {
                    return;
                }
                root.modelData.connected = false;
            }
        }
    }
}
