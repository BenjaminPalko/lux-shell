import qs.components
import Quickshell

StyledText {
    text: ` ${Qt.formatDateTime(clock.date, "hh:mm:ss AP")}`
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
