pragma ComponentBehavior: Bound

import qs.components
import qs.config
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
                LucideIcon {
                    id: icon
                    text: Styling.lucide.icons.batteryFull
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
                                    text: Styling.lucide.icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "low"
                            when: root.modelData.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Styling.lucide.icons.batteryFull
                                }
                            }
                        },
                        State {
                            name: "critical"
                            when: root.modelData.battery > 0.10
                            PropertyChanges {
                                icon {
                                    text: Styling.lucide.icons.batteryWarning
                                    color: Styling.theme.error
                                }
                            }
                        }
                    ]
                }
            }
        }

        StyledButton {
            Layout.alignment: Qt.AlignRight
            text: 'Disconnect'
            palette.button: hovered ? Styling.theme.error : Styling.theme.base200

            onClicked: {
                if (root.modelData.state != BluetoothDeviceState.Connected) {
                    return;
                }
                root.modelData.connected = false;
            }
        }
    }
}
