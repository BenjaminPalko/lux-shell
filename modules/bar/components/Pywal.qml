import qs.components
import qs.config
import QtQuick
import Quickshell.Io

StyledIconButton {
    id: clickable

    text: Styling.lucide.icons.brickWall

    onClicked: {
        process.running = true;
    }

    Process {
        id: process
        command: ["sh", "-c", "~/dotfiles/.scripts/pywal-swww.sh"]
    }
}
