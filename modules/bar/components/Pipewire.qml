import qs.components
import qs.config
import qs.services
import QtQuick

StyledButton {
    id: root

    text: `${Pipewire.muted ? " " : Pipewire.volume <= 0 ? " " : " "}   ${(Pipewire.volume * 100).toFixed()}%`

    onClicked: {
        Pipewire.toggleMute();
    }

    WheelHandler {
        onWheel: event => {
            if (event.angleDelta.y > 0) {
                Pipewire.incrementVolume();
            } else if (event.angleDelta.y < 0) {
                Pipewire.decrementVolume();
            }
        }
    }

    states: [
        State {
            name: "muted"
            when: Pipewire.muted
            PropertyChanges {
                root {
                    palette.button: Theme.palette.error
                }
            }
        }
    ]
}
