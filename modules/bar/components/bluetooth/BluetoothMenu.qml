pragma ComponentBehavior: Bound

import qs.config
import qs.constants
import qs.services
import qs.styled
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets

StyledPopupWindow {
    id: root

    backgroundColor: Theme.palette.base300
    margins: 16
    radius: 8

    content: ColumnLayout {
        spacing: 8
        WrapperRectangle {
            margin: 16
            color: Theme.palette.base200
            radius: 8
            Layout.fillWidth: true
            RowLayout {
                StyledText {
                    text: "Bluetooth"
                }

                Switch {
                    checked: Bluetooth.defaultAdapter.enabled
                    onClicked: Bluetooth.defaultAdapter.enabled = checked
                }
            }
        }

        WrapperRectangle {
            margin: 16
            color: Theme.palette.base200
            radius: 8
            ColumnLayout {
                spacing: 8

                StyledText {
                    font.bold: true
                    text: "Connected Devices"
                }

                DeviceList {
                    devices: Bluetooth.connectedDevices
                }

                StyledText {
                    font.bold: true
                    text: "Paired Devices"
                }

                DeviceList {
                    devices: Bluetooth.pairedDevices
                }

                StyledText {
                    font.bold: true
                    text: "Available Devices"
                }

                DeviceList {
                    devices: Bluetooth.availableDevices
                }
            }
        }
    }
}
