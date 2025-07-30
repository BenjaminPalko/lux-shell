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
            service: SystemInfo
        }
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.storage.iconSize
            font.bold: true
            text: Icons.hardDrive
        }

        StyledText {
            id: text
            font.pixelSize: Dimensions.storage.fontSize
            text: ` ${(SystemInfo.storagePerc * 100).toFixed()}%`
        }
    }
}
