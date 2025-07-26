import qs.config
import qs.styled
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Bluetooth

StyledPopupWindow {
    id: root

    backgroundColor: Theme.palette.base300
    margins: 8
    radius: 8

    property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter

    content: ColumnLayout {

        RowLayout {
            StyledText {
                text: root.defaultAdapter.name
            }

            Switch {
                checked: root.defaultAdapter.enabled
                onClicked: root.defaultAdapter.enabled = checked
            }
        }
    }
}
