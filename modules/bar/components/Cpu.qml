import qs.components
import qs.config
import qs.constants
import qs.services
import qs.utils
import qs.widgets
import QtQuick
import QtQuick.Layouts

StyledButton {
    id: root

    property bool showTemp: false

    onClicked: {
        showTemp = !showTemp;
    }

    contentItem: RowLayout {
        id: row

        spacing: 0

        Ref {
            service: SystemInfo
        }
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.cpu.iconSize
            font.bold: true
            text: Icons.cpu
            color: root.hovered ? Theme.palette.primarycontent : Theme.palette.basecontent
        }

        StyledText {
            id: text

            font.pixelSize: Dimensions.cpu.fontSize
            text: ` ${(SystemInfo.cpuPerc * 100).toFixed().toString().padStart(2, "_")}%`
            color: root.hovered ? Theme.palette.primarycontent : Theme.palette.basecontent

            states: [
                State {
                    name: "showTemp"
                    when: root.showTemp
                    PropertyChanges {
                        text {
                            text: `${(SystemInfo.cpuTemp)}℃`
                        }
                    }
                }
            ]
        }
    }
}
