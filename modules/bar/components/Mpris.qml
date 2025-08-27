pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts

StyledButton {
    id: root

    onClicked: {
        Visibility.dashboard = !Visibility.dashboard;
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
    }
}
