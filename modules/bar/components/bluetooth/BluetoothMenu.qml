pragma ComponentBehavior: Bound

import qs.config
import qs.widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
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
                RowLayout {
                    StyledText {
                        text: "Enabled"
                    }

                    Switch {
                        checked: Bluetooth.defaultAdapter.enabled
                        onClicked: Bluetooth.defaultAdapter.enabled = checked
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight
                    StyledText {
                        text: "Scan"
                    }

                    Switch {
                        checked: Bluetooth.defaultAdapter.discovering
                        onClicked: Bluetooth.defaultAdapter.discovering = checked
                    }
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
                    Layout.topMargin: 8
                    Layout.minimumWidth: 320
                    font.bold: true
                    font.pixelSize: 14
                    text: "Connected Devices"
                }

                ColumnLayout {
                    Loader {
                        active: repeater1.count == 0
                        sourceComponent: StyledText {
                            font.italic: true
                            text: "No devices connected..."
                        }
                    }
                    Repeater {
                        id: repeater1
                        model: ScriptModel {
                            values: Bluetooth.devices.values.filter(device => device.state == BluetoothDeviceState.Connected)
                        }
                        delegate: Loader {
                            id: connectedDeviceLoader
                            required property var modelData
                            Layout.fillWidth: true
                            active: modelData != null
                            sourceComponent: ConnectedDevice {
                                device: connectedDeviceLoader.modelData
                            }
                        }
                    }
                }

                StyledText {
                    Layout.topMargin: 8
                    font.bold: true
                    font.pixelSize: 14
                    text: "Paired Devices"
                }

                ColumnLayout {
                    Loader {
                        active: repeater2.count == 0
                        sourceComponent: StyledText {
                            font.italic: true
                            text: "No paired devices..."
                        }
                    }
                    Repeater {
                        id: repeater2
                        model: ScriptModel {
                            values: Bluetooth.devices.values.filter(device => device.bonded && device.state == BluetoothDeviceState.Disconnected)
                        }
                        delegate: Loader {
                            id: pairedDeviceLoader
                            required property var modelData
                            Layout.fillWidth: true
                            active: modelData != null
                            sourceComponent: PairedDevice {
                                device: pairedDeviceLoader.modelData
                            }
                        }
                    }
                }

                StyledText {
                    Layout.topMargin: 8
                    font.bold: true
                    font.pixelSize: 14
                    text: "Available Devices"
                }

                ColumnLayout {
                    Loader {
                        active: repeater3.count == 0
                        sourceComponent: StyledText {
                            font.italic: true
                            text: Bluetooth.defaultAdapter.discovering ? "No devices found..." : "Scan to find devices..."
                        }
                    }
                    Repeater {
                        id: repeater3
                        model: ScriptModel {
                            values: Bluetooth.devices.values.filter(device => !device.bonded && device.deviceName != "")
                        }
                        delegate: Loader {
                            id: availableDeviceLoader
                            required property var modelData
                            Layout.fillWidth: true
                            active: modelData != null
                            sourceComponent: AvailableDevice {
                                device: availableDeviceLoader.modelData
                            }
                        }
                    }
                }
            }
        }
    }
}
