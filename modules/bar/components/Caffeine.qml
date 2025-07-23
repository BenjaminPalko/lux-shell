import QtQuick
import Quickshell.Io
import "../../../config/"
import "../../../constants/"
import "../../../styled/"

Clickable {
    id: clickable

    implicitWidth: text.width
    implicitHeight: Dimensions.caffeine.height

    border.color: process.running ? Theme.palette.secondary : 'transparent'
    border.width: 2

    onClicked: {
        if (process.running) {
            process.signal(888);
            process.running = false;
        } else {
            process.running = true;
        }
    }

    StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.workspace.iconSize
        font.bold: true
        text: Icons.coffee

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.mpris.verticalPadding
        bottomPadding: Dimensions.mpris.verticalPadding
        leftPadding: Dimensions.mpris.horizontalPadding
        rightPadding: Dimensions.mpris.horizontalPadding
    }

    Process {
        id: process
        command: ["sh", "-c", "systemd-inhibit --what=idle --who=Caffeine --why=Caffeine --mode=block sleep inf"]
    }
}
