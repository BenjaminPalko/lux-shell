pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter
    property list<BluetoothDevice> connectedDevices: defaultAdapter.devices.values.filter(device => device.connected)
    property list<BluetoothDevice> pairedDevices: defaultAdapter.devices.values.filter(device => device.paired && !device.connected)
    property list<BluetoothDevice> availableDevices: defaultAdapter.devices.values.filter(device => !device.paired)

    function isConnected(BluetoothDevice: device) {
        return device.state == BluetoothDeviceState.Connected;
    }

    function isConnecting(BluetoothDevice: device) {
        return device.state == BluetoothDeviceState.Connecting;
    }
}
