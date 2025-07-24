import QtQuick
import Quickshell
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"
import "../../../utils/"

StyledLabel {
    id: root

    implicitWidth: row.width
    implicitHeight: Dimensions.network.height

    Ref {
        id: ref
        service: NetworkService
    }

    Row {
        id: row
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.network.iconSize
            font.bold: true
            text: Icons.wifiOff

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.network.verticalPadding
            bottomPadding: Dimensions.network.verticalPadding
            leftPadding: Dimensions.network.horizontalPadding

            states: [
                State {
                    name: "high"
                    when: NetworkService.active?.strength > 50
                    PropertyChanges {
                        icon {
                            text: Icons.wifi
                        }
                    }
                },
                State {
                    name: "medium"
                    when: NetworkService.active?.strength > 25
                    PropertyChanges {
                        icon {
                            text: Icons.wifiHigh
                        }
                    }
                },
                State {
                    name: "low"
                    when: NetworkService.active?.strength > 0
                    PropertyChanges {
                        icon {
                            text: Icons.wifiLow
                        }
                    }
                }
            ]
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.network.verticalPadding
            bottomPadding: Dimensions.network.verticalPadding
            rightPadding: Dimensions.network.horizontalPadding

            font.pixelSize: Dimensions.network.fontSize

            text: ` ${(NetworkService.active?.strength ?? 0).toFixed()}%`
        }
    }
}
