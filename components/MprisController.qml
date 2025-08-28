pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.constants
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets

ColumnLayout {
    id: root

    required property MprisPlayer player

    spacing: 12

    implicitWidth: 800

    StyledText {
        id: text
        Layout.alignment: Qt.AlignHCenter
        text: `${root.player.trackTitle} - ${root.player.trackArtist}`
        font.pixelSize: Dimensions.mpris.fontSize
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter
        StyledButton {
            id: backButton
            content: LucideIcon {
                color: backButton.containsMouse ? Theme.palette.primarycontent : Theme.palette.basecontent
                text: Icons.skipBack
            }
            onClicked: {
                root.player.previous();
            }
        }
        StyledButton {
            id: playPauseButton
            content: LucideIcon {
                color: playPauseButton.containsMouse ? Theme.palette.primarycontent : Theme.palette.basecontent
                text: root.player.isPlaying ? Icons.square : Icons.play
            }
            onClicked: {
                root.player.isPlaying = !root.player.isPlaying;
            }
        }
        StyledButton {
            id: forwardButton
            content: LucideIcon {
                color: forwardButton.containsMouse ? Theme.palette.primarycontent : Theme.palette.basecontent
                text: Icons.skipForward
            }
            onClicked: {
                root.player.next();
            }
        }
    }

    StyledText {
        Layout.alignment: Qt.AlignHCenter
        text: {
            function formatTime(num) {
                return Math.floor(num).toString().padStart(2, "0");
            }
            return `${formatTime(root.player.position / 60)}:${formatTime(root.player.position % 60)} - ${formatTime(root.player.length / 60)}:${formatTime(root.player.length % 60)}`;
        }
        font.pixelSize: Dimensions.mpris.fontSize
    }

    StyledSlider {
        from: 0
        to: root.player.length ?? 0
        value: root.player.position
        implicitHeight: 6
        Layout.fillWidth: true
        onMoved: {
            root.player.position = value;
        }

        Timer {
            running: root.player.isPlaying
            interval: 1000
            repeat: true
            onTriggered: root.player.positionChanged()
        }
    }
}
