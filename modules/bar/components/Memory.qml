import QtQuick
import Quickshell
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"
import "../../../utils/"

StyledLabel {
    implicitWidth: childrenRect.width
    implicitHeight: Dimensions.memory.height

    Ref {
        service: SystemInfo
    }

    Row {
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.memory.iconSize
            font.bold: true
            text: Icons.memoryStick

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.memory.verticalPadding
            bottomPadding: Dimensions.memory.verticalPadding
            leftPadding: Dimensions.memory.horizontalPadding
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.memory.verticalPadding
            bottomPadding: Dimensions.memory.verticalPadding
            rightPadding: Dimensions.memory.horizontalPadding

            font.pixelSize: Dimensions.memory.fontSize

            text: ` ${(SystemInfo.memPerc * 100).toFixed()}%`
        }
    }
}
