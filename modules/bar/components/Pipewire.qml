import qs.config
import qs.services
import qs.widgets
import QtQuick

StyledButton {
    id: root

    onClicked: mouse => {
        if (mouse.button == Qt.LeftButton) {
            Pipewire.toggleMute();
        } else if (mouse.button == Qt.RightButton) {
            popup.opened = !popup.opened;
        }
    }

    onWheel: event => {
        if (event.angleDelta.y > 0) {
            Pipewire.incrementVolume();
        } else if (event.angleDelta.y < 0) {
            Pipewire.decrementVolume();
        }
    }

    states: [
        State {
            name: "muted"
            when: Pipewire.muted
            PropertyChanges {
                root {
                    color: Theme.palette.error
                }
            }
        }
    ]

    content: StyledText {
        id: text
        property string icon: Pipewire.muted ? " " : Pipewire.volume <= 0 ? " " : " "
        text: `${icon} ${(Pipewire.volume * 100).toFixed()}%`
        font.pixelSize: Dimensions.pipewire.fontSize
        color: root.containsMouse || Pipewire.muted ? Theme.palette.base300 : Theme.palette.basecontent
    }
}
