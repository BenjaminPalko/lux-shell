pragma ComponentBehavior: Bound

import qs.config
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

        RowLayout {
            Layout.alignment: Qt.AlignRight
            StyledButton {
                hoverEnabled: root.device.state == BluetoothDeviceState.Disconnected
                color: containsMouse ? Theme.palette.primary : Theme.palette.base200
                content: StyledText {
                    text: 'Connect'
                    font.pixelSize: 12
                }
                onClicked: {
                    if (!hoverEnabled) {
                        return;
                    }
                    root.device.connect();
                }
            }

            StyledButton {
                hoverEnabled: root.device.state == BluetoothDeviceState.Disconnected
                color: containsMouse ? Theme.palette.error : Theme.palette.base200
                content: StyledText {
                    text: 'Unpair'
                    font.pixelSize: 12
                }
                onClicked: {
                    if (!hoverEnabled) {
                        return;
                    }
                    root.device.forget();
                }
            }
        }
    }
}
