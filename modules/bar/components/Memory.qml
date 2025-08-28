import qs.components
import qs.config
import qs.constants
import qs.services
import qs.widgets
import qs.utils
import QtQuick
import QtQuick.Layouts

StyledLabel {
    RowLayout {
        Ref {
            service: SystemInfo
        }
        StyledText {
            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.memory.iconSize
            font.bold: true
            text: Icons.memoryStick
        }

        StyledText {
            id: text
            font.pixelSize: Dimensions.memory.fontSize
            text: ` ${(SystemInfo.memPerc * 100).toFixed()}%`
        }
    }
}
