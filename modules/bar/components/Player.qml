import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import "../../../styled/"
import "../../../config/"

Item {
    required property MprisPlayer modelData
    required property int index

    signal nextPlayer()
    signal previousPlayer()

    anchors.horizontalCenter: parent.horizontalCenter
    implicitWidth: childrenRect.width
    implicitHeight: Dimensions.mpris.height

    StyledLabel {
        anchors.fill: parent
    }

    StyledText {
        text: `${modelData.isPlaying ? "" : ""} ${modelData.trackTitle} - ${modelData.trackArtist}`

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.mpris.verticalPadding
        bottomPadding: Dimensions.mpris.verticalPadding
        leftPadding: Dimensions.mpris.horizontalPadding
        rightPadding: Dimensions.mpris.horizontalPadding

        font.pixelSize: Dimensions.mpris.fontSize
    }

    MouseArea {
        anchors.fill: parent

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
