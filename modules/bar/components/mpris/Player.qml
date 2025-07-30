import qs.config
import qs.widgets
import Quickshell.Services.Mpris
import QtQuick

Loader {
    id: root
    required property MprisPlayer modelData
    required property int index

    signal nextPlayer
    signal previousPlayer

    sourceComponent: player
    property Component player: StyledButton {
        id: button

        onClicked: {
            if (!root.modelData.canTogglePlaying) {
                return;
            }
            if (root.modelData.isPlaying) {
                root.modelData.pause();
            } else {
                root.modelData.play();
            }
        }

        onWheel: event => {
            if (event.angleDelta.y > 0) {
                root.nextPlayer();
            } else if (event.angleDelta.y < 0) {
                root.previousPlayer();
            }
        }

        content: StyledText {
            id: text
            text: `${root.modelData.isPlaying ? "" : ""} ${root.modelData.trackTitle} - ${root.modelData.trackArtist}`

            font.pixelSize: Dimensions.mpris.fontSize

            states: State {
                name: "hovered"
                when: button.containsMouse
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
}
