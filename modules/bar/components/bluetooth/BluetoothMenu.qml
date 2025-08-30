pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth

StyledPopupWindow {
    id: root

    backgroundColor: Theme.palette.base300
    margins: 16
    radius: 8

    content: ColumnLayout {
        spacing: 8
        StyledWrapperRectangle {
            margin: 16
            Layout.fillWidth: true
            RowLayout {
                RowLayout {
                    StyledText {
                        text: "Enabled"
                    }

                    Switch {
                        checkable: !!Bluetooth.defaultAdapter
                        checked: Bluetooth.defaultAdapter?.enabled ?? false
                        onClicked: Bluetooth.defaultAdapter.enabled = checked
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    StyledText {
                        text: "Scan"
                    }

                    Switch {
                        checkable: !!Bluetooth.defaultAdapter
                        checked: Bluetooth.defaultAdapter?.discovering ?? false
                        onClicked: Bluetooth.defaultAdapter.discovering = checked
                    }
                }
            }
        }

        StyledWrapperRectangle {
            margin: 16
            ColumnLayout {
                spacing: 8

                StyledText {
                    Layout.topMargin: 8
                    Layout.minimumWidth: 320
                    font.bold: true
                    font.pixelSize: 14
                    text: "Connected Devices"
                }

                StyledListView {
                    id: list1
                    Layout.fillWidth: true
                    spacing: 8
                    implicitHeight: 20 + Math.min(40 * count, 160)
                    header: Loader {
                        active: list1.count == 0
                        sourceComponent: Loader {
                            active: list1.count == 0
                            sourceComponent: StyledText {
                                font.italic: true
                                text: "No devices connected..."
                            }
                        }
                    }
                    clip: true
                    model: ScriptModel {
                        values: Bluetooth.devices.values.filter(device => device.state == BluetoothDeviceState.Connected)
                    }
                    delegate: ConnectedDevice {
                        anchors.left: parent.left
                        anchors.right: parent.right
                    }
                }

                StyledText {
                    Layout.topMargin: 8
                    font.bold: true
                    font.pixelSize: 14
                    text: "Paired Devices"
                }

                StyledListView {
                    id: list2
                    Layout.fillWidth: true
                    spacing: 8
                    implicitHeight: 20 + Math.min(40 * count, 160)
                    header: Loader {
                        active: list2.count == 0
                        sourceComponent: StyledText {
                            font.italic: true
                            text: "No paired devices..."
                        }
                    }
                    clip: true
                    model: ScriptModel {
                        values: Bluetooth.defaultAdapter.devices.values.filter(device => device.bonded && device.state == BluetoothDeviceState.Disconnected)
                    }
                    delegate: PairedDevice {
                        anchors.left: parent.left
                        anchors.right: parent.right
                    }
                }

                StyledText {
                    Layout.topMargin: 8
                    font.bold: true
                    font.pixelSize: 14
                    text: "Available Devices"
                }

                StyledListView {
                    id: list3
                    Layout.fillWidth: true
                    spacing: 8
                    clip: true
                    implicitHeight: 20 + Math.min(40 * count, 160)
                    header: Loader {
                        active: list3.count == 0
                        sourceComponent: StyledText {
                            font.italic: true
                            text: Bluetooth.defaultAdapter.discovering ? "No devices found..." : "Scan to find devices..."
                        }
                    }
                    model: ScriptModel {
                        values: Bluetooth.devices.values.filter(device => !device.bonded && device.deviceName != "")
                    }
                    delegate: AvailableDevice {
                        anchors.left: parent.left
                        anchors.right: parent.right
                    }
                }
            }
        }
    }
}
