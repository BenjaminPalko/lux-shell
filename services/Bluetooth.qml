pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter
    property list<BluetoothDevice> connectedDevices: defaultAdapter?.devices.values.filter(device => device.state == BluetoothDeviceState.Connected)
    property list<BluetoothDevice> pairedDevices: defaultAdapter?.devices.values.filter(device => device.bonded && device.state == BluetoothDeviceState.Disconnected)
    property list<BluetoothDevice> availableDevices: defaultAdapter?.devices.values.filter(device => !device.bonded && device.deviceName != "")

    function isConnected(BluetoothDevice: device) {
        return device.state == BluetoothDeviceState.Connected;
    }

    function isConnecting(BluetoothDevice: device) {
        return device.state == BluetoothDeviceState.Connecting;
    }
}
