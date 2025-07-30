import qs.config
import qs.constants
import qs.widgets
import QtQuick
import Quickshell.Io

StyledButton {
    id: clickable

    onClicked: {
        process.running = true;
    }

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.caffeine.fontSize
        font.bold: true
        text: Icons.brickWall

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
    }

    Process {
        id: process
        command: ["sh", "-c", "~/dotfiles/.scripts/pywal-swww.sh"]
    }
}
