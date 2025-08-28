import qs.components
import qs.config
import qs.widgets
import Quickshell

StyledLabel {
    StyledText {
        id: text

        font.pixelSize: Dimensions.clock.fontSize

        text: ` ${Qt.formatDateTime(clock.date, "hh:mm:ss AP")}`

        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }
    }
}
