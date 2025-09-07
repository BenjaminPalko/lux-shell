import qs.components
import qs.config
import qs.services
import qs.utils
import QtQuick
import QtQuick.Layouts

RowLayout {

    Ref {
        service: SystemInfo
    }

    LucideIcon {
        text: Styling.lucide.icons.memoryStick
    }

    StyledText {
        text: ` ${(SystemInfo.memPerc * 100).toFixed()}%`
    }
}
