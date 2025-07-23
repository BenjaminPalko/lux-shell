import Quickshell
import "../../../styled/"
import "../../../config/"

StyledLabel {
    implicitWidth: childrenRect.width
    implicitHeight: Dimensions.clock.height

    StyledText {
        id: text
        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.clock.verticalPadding
        bottomPadding: Dimensions.clock.verticalPadding
        leftPadding: Dimensions.clock.horizontalPadding
        rightPadding: Dimensions.clock.horizontalPadding

        font.pixelSize: Dimensions.clock.fontSize

        text: ` ${Qt.formatDateTime(clock.date, "hh:mm:ss AP")}`

        SystemClock {
            id: clock
            precision: SystemClock.Seconds
        }
    }
}
