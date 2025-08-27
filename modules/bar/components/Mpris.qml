pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts

StyledButton {
    id: root

    padding: 6

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

    content: ColumnLayout {
        id: content

        spacing: 0

        implicitWidth: text.width
        implicitHeight: text.height
        StyledText {
            id: text
            text: `${Mpris.active?.isPlaying ? "" : ""} ${Mpris.active?.trackTitle} - ${Mpris.active?.trackArtist}`

            font.pixelSize: Dimensions.mpris.fontSize

            states: State {
                name: "hovered"
                when: root.containsMouse
                PropertyChanges {
                    text {
                        color: Theme.palette.primarycontent
                    }
                }
            }
            transitions: Transition {
                from: ""
                to: "hovered"
                reversible: true
                ColorAnimation {
                    properties: "color"
                    duration: 100
                    easing.type: Easing.InOutCubic
                }
            }
        }
        StyledSlider {
            from: 0
            to: Mpris.active?.length ?? 0
            value: Mpris.active?.position
            implicitHeight: 6
            Layout.fillWidth: true
            onMoved: {
                Mpris.active.position = value;
            }

            Timer {
                running: Mpris.active?.isPlaying
                interval: 1000
                repeat: true
                onTriggered: Mpris.active?.positionChanged()
            }
        }
    }
}
