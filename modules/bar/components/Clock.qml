import Quickshell
import Quickshell.Io
import QtQuick
import "../../../styled/"
import "../../../config/"

Item {
    id: root

    implicitWidth: Dimensions.clock.width
    implicitHeight: Dimensions.clock.height

    StyledLabel {
        anchors.fill: parent
        anchors.centerIn: parent
    }

    StyledText {
        id: text
        anchors.centerIn: parent
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
