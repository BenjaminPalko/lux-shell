pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.constants
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts

StyledDrawer {
    id: root

    visible: Visibility.dashboard

    margins: 20
    contentItem: ColumnLayout {

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            StyledButton {
                id: previousPlayerButton
                visible: Mpris.players.length > 1
                content: LucideIcon {
                    color: previousPlayerButton.containsMouse ? Theme.palette.primarycontent : Theme.palette.basecontent
                    text: Icons.chevronLeft
                }
                onClicked: {
                    Mpris.previousPlayer();
                }
            }

            StyledText {
                text: {
                    if (Mpris.active?.identity) {
                        const words = Mpris.active?.identity.split("-");
                        const capitalized = words.map(val => String(val).charAt(0).toUpperCase() + String(val).slice(1));
                        return capitalized.join(" ");
                    }
                    return Mpris.active?.desktopEntry ?? Mpris.active?.dbusName ?? "unknown";
                }
                font.pixelSize: 20
            }

            StyledButton {
                id: nextPlayerButton
                visible: Mpris.players.length > 1
                content: LucideIcon {
                    color: nextPlayerButton.containsMouse ? Theme.palette.primarycontent : Theme.palette.basecontent
                    text: Icons.chevronRight
                }
                onClicked: {
                    Mpris.nextPlayer();
                }
            }
        }

        MprisController {
            player: Mpris.active
        }
    }
}
