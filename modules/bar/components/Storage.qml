import QtQuick
import Quickshell
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"
import "../../../utils/"

StyledLabel {
    implicitWidth: childrenRect.width
    implicitHeight: Dimensions.storage.height

    Ref {
        service: SystemInfo
    }

    Row {
        StyledText {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.storage.iconSize
            font.bold: true
            text: Icons.hardDrive

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.storage.verticalPadding
            bottomPadding: Dimensions.storage.verticalPadding
            leftPadding: Dimensions.storage.horizontalPadding
        }

        StyledText {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.storage.verticalPadding
            bottomPadding: Dimensions.storage.verticalPadding
            rightPadding: Dimensions.storage.horizontalPadding

            font.pixelSize: Dimensions.storage.fontSize

            text: ` ${(SystemInfo.storagePerc * 100).toFixed()}%`
        }
    }
}
