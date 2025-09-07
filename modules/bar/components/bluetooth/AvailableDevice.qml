pragma ComponentBehavior: Bound

import qs.components
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Widgets

StyledRectangle {
    id: root
    required property BluetoothDevice modelData

    RowLayout {
        id: row

        spacing: 8

        Loader {
            active: root.modelData?.icon != undefined
            sourceComponent: IconImage {
                implicitSize: 22
                source: Quickshell.iconPath(root.modelData.icon, "device-support-unknown-symbolic")
            }
        }

        StyledText {
            text: root.modelData.deviceName
        }

        StyledButton {

            Layout.alignment: Qt.AlignRight
            hoverEnabled: !root.modelData.pairing
            text: 'Pair'

            onClicked: {
                if (!hoverEnabled) {
                    return;
                }
                root.modelData.trusted = true;
                root.modelData.pair();
            }
        }
    }
}
