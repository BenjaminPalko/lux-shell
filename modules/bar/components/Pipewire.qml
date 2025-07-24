import QtQuick
import Quickshell.Services.Pipewire
import "../../../config/"
import "../../../styled/"

Clickable {
    id: clickable

    property var sink: Pipewire.defaultAudioSink

    implicitWidth: text.width
    implicitHeight: Dimensions.pipewire.height

    PwObjectTracker {
        id: bound
        objects: [clickable.sink]
    }

    onClicked: mouse => {
        if (!sink) {
          return
        }
        if (mouse.button == Qt.LeftButton) {
            sink.audio.muted = !sink?.audio.muted;
        } else if (mouse.button == Qt.RightButton)
        // show menu
        {}
    }

    onWheel: event => {
        if (event.angleDelta.y > 0) {
            sink.audio.volume = Math.min(sink.audio.volume + 0.02, 1.0);
        } else if (event.angleDelta.y < 0) {
            sink.audio.volume -= 0.02;
        }
    }

    states: [
        State {
            name: "muted"
            when: clickable.sink?.audio.muted ?? false
            PropertyChanges {
                text {
                    icon: " "
                }
            }
        },
        State {
            name: "off"
            when: clickable.sink?.audio.volume <= 0
            PropertyChanges {
                text {
                    icon: " "
                }
            }
        }
    ]

    StyledText {
        id: text

        property string icon: " "

        text: `${icon} ${(clickable.sink?.audio.volume * 100).toFixed()}%`
        font.pixelSize: Dimensions.pipewire.fontSize

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.pipewire.verticalPadding
        bottomPadding: Dimensions.pipewire.verticalPadding
        leftPadding: Dimensions.pipewire.horizontalPadding
        rightPadding: Dimensions.pipewire.horizontalPadding
    }
}
