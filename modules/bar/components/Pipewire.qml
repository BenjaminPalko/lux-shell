import qs.config
import qs.widgets
import QtQuick
import Quickshell.Services.Pipewire

StyledButton {
    id: button

    property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        id: bound
        objects: [button.sink]
    }

    onClicked: mouse => {
        if (!sink) {
            return;
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
            when: button.sink?.audio.muted ?? false
            PropertyChanges {
                text {
                    icon: " "
                }
            }
        },
        State {
            name: "off"
            when: button.sink?.audio.volume <= 0
            PropertyChanges {
                text {
                    icon: " "
                }
            }
        }
    ]

    content: StyledText {
        id: text
        property string icon: " "
        text: `${icon} ${(button.sink?.audio.volume * 100).toFixed()}%`
        font.pixelSize: Dimensions.pipewire.fontSize
        color: button.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
    }
}
