import qs.components
import qs.config
import qs.services
import qs.utils
import QtQuick
import QtQuick.Layouts

StyledLabel {

    RowLayout {

        Ref {
            service: SystemInfo
        }

        LucideIcon {
            text: Styling.lucide.icons.hardDrive
        }

        StyledText {
            id: text

            text: ` ${(SystemInfo.storagePerc * 100).toFixed()}%`
        }
    }
}
