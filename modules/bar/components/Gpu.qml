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
    implicitHeight: Dimensions.gpu.height

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
            font.pixelSize: Dimensions.gpu.iconSize
            font.bold: true
            text: Icons.gpu

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.gpu.verticalPadding
            bottomPadding: Dimensions.gpu.verticalPadding
            leftPadding: Dimensions.gpu.horizontalPadding
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.gpu.verticalPadding
            bottomPadding: Dimensions.gpu.verticalPadding
            rightPadding: Dimensions.gpu.horizontalPadding

            font.pixelSize: Dimensions.gpu.fontSize

            text: ` ${(SystemInfo.gpuPerc * 100).toFixed()}%`

            states: [
                State {
                    name: "temp"
                    when: root.showTemp
                    PropertyChanges {
                        text {
                            text: ` ${(SystemInfo.gpuTemp)}℃`
                        }
                    }
                }
            ]
        }
    }
}
