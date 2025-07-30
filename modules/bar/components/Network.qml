import qs.config
import qs.constants
import qs.services
import qs.utils
import qs.widgets
import QtQuick
import QtQuick.Layouts

StyledLabel {
    RowLayout {
        Ref {
            service: NetworkService
        }
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.network.iconSize
            font.bold: true
            text: Icons.wifiOff

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
            font.pixelSize: Dimensions.network.fontSize
            text: ` ${(NetworkService.active?.strength ?? 0).toFixed()}%`
        }
    }
}
