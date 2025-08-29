import qs.components
import qs.constants
import QtQuick
import Quickshell.Io

StyledIconButton {
    id: clickable

    text: Icons.brickWall

    onClicked: {
        process.running = true;
    }

    Process {
        id: process
        command: ["sh", "-c", "~/dotfiles/.scripts/pywal-swww.sh"]
    }
}
