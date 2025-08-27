pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.constants
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets

WrapperRectangle {
    id: root
    required property MprisPlayer player

    color: Theme.palette.base200
    radius: 8
    margin: 16

    ColumnLayout {

        spacing: 12

        implicitWidth: 800

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            text: {
                if (root.player.identity) {
                    const words = root.player.identity.split("-");
                    const capitalized = words.map(val => String(val).charAt(0).toUpperCase() + String(val).slice(1));
                    return capitalized.join(" ");
                }
                return root.player.desktopEntry ?? root.player.dbusName ?? "unknown";
            }
            font.pixelSize: 20
        }

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
}
