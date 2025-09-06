import qs.components
import Quickshell

StyledLabel {
    StyledText {
        text: ` ${Qt.formatDateTime(clock.date, "hh:mm:ss AP")}`
        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }
    }
}
