import qs.components
import Quickshell

StyledRectangle {
    StyledText {
        text: ` ${Qt.formatDateTime(clock.date, "hh:mm:ss AP")}`
        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }
    }
}
