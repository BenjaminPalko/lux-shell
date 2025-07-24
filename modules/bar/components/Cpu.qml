import QtQuick
import Quickshell
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"
import "../../../utils/"

Clickable {
    id: root

    property bool showTemp: true

    implicitWidth: row.width
    implicitHeight: Dimensions.storage.height

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
            font.pixelSize: Dimensions.storage.iconSize
            font.bold: true
            text: Icons.cpu

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.storage.verticalPadding
            bottomPadding: Dimensions.storage.verticalPadding
            leftPadding: Dimensions.storage.horizontalPadding
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.storage.verticalPadding
            bottomPadding: Dimensions.storage.verticalPadding
            rightPadding: Dimensions.storage.horizontalPadding

            font.pixelSize: Dimensions.storage.fontSize

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
