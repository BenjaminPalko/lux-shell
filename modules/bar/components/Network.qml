import qs.components
import qs.config
import qs.services
import qs.utils
import QtQuick
import QtQuick.Layouts

StyledLabel {

    RowLayout {

        Ref {
            service: NetworkService
        }

        LucideIcon {
            id: icon
            text: Styling.lucide.icons.wifiOff
            states: [
                State {
                    name: "high"
                    when: NetworkService.active?.strength > 50
                    PropertyChanges {
                        icon {
                            text: Styling.lucide.icons.wifi
                        }
                    }
                },
                State {
                    name: "medium"
                    when: NetworkService.active?.strength > 25
                    PropertyChanges {
                        icon {
                            text: Styling.lucide.icons.wifiHigh
                        }
                    }
                },
                State {
                    name: "low"
                    when: NetworkService.active?.strength > 0
                    PropertyChanges {
                        icon {
                            text: Styling.lucide.icons.wifiLow
                        }
                    }
                }
            ]
        }

        StyledText {
            id: text
            text: ` ${(NetworkService.active?.strength ?? 0).toFixed()}%`
        }
    }
}
