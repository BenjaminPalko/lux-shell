pragma ComponentBehavior: Bound

import qs.config
import qs.services
import qs.widgets
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
                        onClicked: Bluetooth.defaultAdapter.discovering = true;

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
                    Layout.minimumWidth: 320
                    font.bold: true
                    text: "Connected Devices"
                }

                ColumnLayout {
                    Repeater {
                        model: Bluetooth.connectedDevices
                        delegate: ConnectedDevice {
                            Layout.fillWidth: true
                        }
                    }
                }

                StyledText {
                    font.bold: true
                    text: "Paired Devices"
                }

                ColumnLayout {
                    Repeater {
                        model: Bluetooth.pairedDevices
                        delegate: PairedDevice {
                            Layout.fillWidth: true
                        }
                    }
                }

                StyledText {
                    font.bold: true
                    text: "Available Devices"
                }

                ColumnLayout {
                    Repeater {
                        model: Bluetooth.availableDevices
                        delegate: AvailableDevice {
                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }
    }
}
