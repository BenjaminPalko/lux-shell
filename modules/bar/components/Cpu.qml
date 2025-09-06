import qs.components
import qs.config
import qs.services
import qs.utils
import QtQuick
import QtQuick.Layouts

StyledButton {
    id: root

    property bool showTemp: false

    onClicked: {
        showTemp = !showTemp;
    }

    contentItem: RowLayout {

        spacing: 0

        Ref {
            service: SystemInfo
        }

        LucideIcon {
            text: Styling.lucide.icons.cpu
            color: root.hovered ? Styling.theme.primarycontent : Styling.theme.basecontent
        }

        StyledText {
            id: text

            text: ` ${(SystemInfo.cpuPerc * 100).toFixed().toString().padStart(2, "_")}%`
            color: root.hovered ? Styling.theme.primarycontent : Styling.theme.basecontent
            states: [
                State {
                    name: "showTemp"
                    when: root.showTemp
                    PropertyChanges {
                        text {
                            text: ` ${SystemInfo.cpuTemp.toFixed().toString().padStart(2, "_")}℃`
                        }
                    }
                }
            ]
        }
    }
}
