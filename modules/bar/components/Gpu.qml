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
        root.showTemp = !root.showTemp;
    }

    content: RowLayout {
        id: row
        Ref {
            service: SystemInfo
        }
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.gpu.iconSize
            font.bold: true
            text: Icons.gpu
        }

        StyledText {
            id: text

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
