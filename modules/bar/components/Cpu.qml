import QtQuick
import Quickshell
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"
import "../../../utils/"

Clickable {
    id: root

    property bool showTemp: false

    implicitWidth: row.width
    implicitHeight: Dimensions.cpu.height

    Ref {
        service: SystemInfo
    }

    onClicked: {
        root.showTemp = !root.showTemp;
    }

    Row {
        id: row
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.cpu.iconSize
            font.bold: true
            text: Icons.cpu

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.cpu.verticalPadding
            bottomPadding: Dimensions.cpu.verticalPadding
            leftPadding: Dimensions.cpu.horizontalPadding
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.cpu.verticalPadding
            bottomPadding: Dimensions.cpu.verticalPadding
            rightPadding: Dimensions.cpu.horizontalPadding

            font.pixelSize: Dimensions.cpu.fontSize

            text: ` ${(SystemInfo.cpuPerc * 100).toFixed()}%`

            states: [
                State {
                    name: "temp"
                    when: root.showTemp
                    PropertyChanges {
                        text {
                            text: ` ${(SystemInfo.cpuTemp)}℃`
                        }
                    }
                }
            ]
        }
    }
}
