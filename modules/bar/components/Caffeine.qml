import qs.config
import qs.constants
import qs.widgets
import Quickshell.Io

StyledButton {
    id: root

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

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.caffeine.fontSize
        font.bold: true
        text: Icons.coffee

        color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
    }

    Process {
        id: process
        command: ["sh", "-c", "systemd-inhibit --what=idle --who=Caffeine --why='Caffeine module is active' --mode=block sleep inf"]
    }
}
