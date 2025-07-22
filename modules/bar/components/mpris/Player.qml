import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import "../../../../styled/"
import "../../../../config/"

Item {
    required property MprisPlayer modelData
    required property int index

    signal nextPlayer
    signal previousPlayer

    implicitWidth: text.width
    implicitHeight: Dimensions.mpris.height

    StyledLabel {
        anchors.fill: text
    }

    StyledText {
        id: text
        text: `${modelData.isPlaying ? "" : ""} ${modelData.trackTitle} - ${modelData.trackArtist}`

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.mpris.verticalPadding
        bottomPadding: Dimensions.mpris.verticalPadding
        leftPadding: Dimensions.mpris.horizontalPadding
        rightPadding: Dimensions.mpris.horizontalPadding

        font.pixelSize: Dimensions.mpris.fontSize
    }

    MouseArea {
        anchors.fill: text

        cursorShape: Qt.PointingHandCursor

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
        onWheel: event => {
            if (event.angleDelta.y > 0) {
                parent.nextPlayer();
            } else if (event.angleDelta.y < 0) {
                parent.previousPlayer();
            }
        }
    }
}
