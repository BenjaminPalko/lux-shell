pragma ComponentBehavior: Bound

import qs.config
import qs.services
import qs.widgets
import QtQuick

StyledButton {
    id: root

    onClicked: {
        if (!Mpris.active.canTogglePlaying) {
            return;
        }
        if (Mpris.active.isPlaying) {
            Mpris.active.pause();
        } else {
            Mpris.active.play();
        }
    }

    content: StyledText {
        id: text
        text: `${Mpris.active?.isPlaying ? "" : ""} ${Mpris.active?.trackTitle} - ${Mpris.active?.trackArtist}`

        font.pixelSize: Dimensions.mpris.fontSize

        states: State {
            name: "hovered"
            when: root.containsMouse
            PropertyChanges {
                text {
                    color: Theme.palette.base300
                }
            }
        }
        transitions: Transition {
            from: ""
            to: "hovered"
            reversible: true
            ColorAnimation {
                properties: "color"
                duration: 200
                easing.type: Easing.InOutCubic
            }
        }
    }
}
