import QtQuick
import Quickshell.Io
import "../../../config/"
import "../../../constants/"
import "../../../styled/"

Clickable {
    id: clickable

    implicitWidth: text.width
    implicitHeight: Dimensions.caffeine.height

    onClicked: {
        process.running = true;
    }

    StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.caffeine.fontSize
        font.bold: true
        text: Icons.brickWall

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.caffeine.verticalPadding
        bottomPadding: Dimensions.caffeine.verticalPadding
        leftPadding: Dimensions.caffeine.horizontalPadding
        rightPadding: Dimensions.caffeine.horizontalPadding
    }

    Process {
        id: process
        command: ["sh", "-c", "~/dotfiles/.scripts/pywal-swww.sh"]
    }
}
