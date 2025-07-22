import Quickshell.Services.Mpris
import QtQuick
import "../../../../styled/"
import "../../../../config/"

Loader {
    required property MprisPlayer modelData
    required property int index

    signal nextPlayer
    signal previousPlayer

    sourceComponent: player
    property Component player: Clickable {
        id: clickable

        implicitWidth: text.width
        implicitHeight: Dimensions.mpris.height

        onClicked: {
            if (!modelData.canTogglePlaying) {
                return;
            }
            if (modelData.isPlaying) {
                modelData.pause();
            } else {
                modelData.play();
            }
        }
        onScrolledUp: parent.nextPlayer()
        onScrolledDown: parent.previousPlayer()

        StyledText {
            id: text
            text: `${modelData.isPlaying ? "" : ""} ${modelData.trackTitle} - ${modelData.trackArtist}`

            anchors.verticalCenter: parent.verticalCenter
            topPadding: Dimensions.mpris.verticalPadding
            bottomPadding: Dimensions.mpris.verticalPadding
            leftPadding: Dimensions.mpris.horizontalPadding
            rightPadding: Dimensions.mpris.horizontalPadding

            font.pixelSize: Dimensions.mpris.fontSize

            states: State {
                name: "hovered"
                when: clickable.hovered
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
