import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

StyledButton {
    id: root
    property UPowerDevice laptopBattery: UPower.devices.values.find(device => device.isLaptopBattery) ?? null
    property bool isCritical: laptopBattery?.percentage < 0.10

    contentItem: RowLayout {
        spacing: 4
        LucideIcon {
            Layout.alignment: Qt.AlignVCenter
            color: {
                if (root.isCritical) {
                    return Theme.palette.error;
                }
                if (root.hovered) {
                    return Theme.palette.primarycontent;
                }
                return Theme.palette.basecontent;
            }
            font.pixelSize: 16
            text: {
                if (root.laptopBattery?.state == UPowerDeviceState.Charging) {
                    return Styling.lucide.icons.batteryCharging;
                }
                if (root.isCritical) {
                    return Styling.lucide.icons.batteryWarning;
                }
                if (root.laptopBattery?.percentage < 0.33) {
                    return Styling.lucide.icons.batteryLow;
                }
                if (root.laptopBattery?.percentage < 0.66) {
                    return Styling.lucide.icons.batteryMedium;
                }
                return Styling.lucide.icons.batteryFull;
            }
        }

        StyledText {
            Layout.alignment: Qt.AlignVCenter
            color: {
                if (root.isCritical) {
                    return Theme.palette.error;
                }
                if (root.hovered) {
                    return Theme.palette.primarycontent;
                }
                return Theme.palette.basecontent;
            }
            text: `${(root.laptopBattery?.percentage.toFixed(2) * 100)}%`
        }
    }
    visible: laptopBattery
}
