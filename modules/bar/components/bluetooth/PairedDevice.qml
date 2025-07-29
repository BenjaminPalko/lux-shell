pragma ComponentBehavior: Bound

import qs.config
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
                source: Quickshell.iconPath(device.modelData.icon)
            }
        }

        StyledText {
            text: device.modelData.deviceName
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight
            StyledButton {
                hoverEnabled: device.modelData.state == BluetoothDeviceState.Disconnected
                color: containsMouse ? Theme.palette.info : Theme.palette.base200
                content: StyledText {
                    text: 'Connect'
                }
                onClicked: {
                    if (!hoverEnabled) {
                        return;
                    }
                    device.modelData.connect();
                }
            }

            StyledButton {
                hoverEnabled: device.modelData.state == BluetoothDeviceState.Disconnected
                color: containsMouse ? Theme.palette.error : Theme.palette.base200
                content: StyledText {
                    text: 'Unpair'
                }
                onClicked: {
                    if (!hoverEnabled) {
                        return;
                    }
                    device.modelData.forget();
                }
            }
        }
    }
}
