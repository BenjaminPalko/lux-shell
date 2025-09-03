pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    property bool onBattery: UPower.onBattery
    property UPowerDevice laptopBattery: UPower.devices.values.find(device => device.isLaptopBattery)

}
