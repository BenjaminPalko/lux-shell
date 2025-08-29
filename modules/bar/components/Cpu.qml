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

    content: RowLayout {
        id: row
        Ref {
            service: SystemInfo
        }
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.cpu.iconSize
            font.bold: true
            text: Icons.cpu

            color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
        }

        StyledText {
            id: text

            font.pixelSize: Dimensions.cpu.fontSize
            text: ` ${(SystemInfo.cpuPerc * 100).toFixed()}%`

            color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

            states: [
                State {
                    name: "showTemp"
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
