import qs.config
import qs.constants
import qs.services
import qs.styled
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root
    required property var devices

    Repeater {
        model: devices
        delegate: Clickable {
            id: device
            required property var modelData

            implicitWidth: row.width
            implicitHeight: row.height
            Layout.fillWidth: true

            RowLayout {
                id: row

                StyledText {
                    topPadding: 8
                    bottomPadding: 8
                    leftPadding: 8
                    text: device.modelData.deviceName
                }
                StyledText {
                    font.family: Theme.lucide.font.family
                    font.pixelSize: 10
                    font.bold: true
                    text: device.modelData.connected ? Icons.bluetoothConnected : Icons.bluetooth

                    topPadding: 8
                    bottomPadding: 8
                    rightPadding: 8

                    color: device.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
                }
            }
        }
    }
}
