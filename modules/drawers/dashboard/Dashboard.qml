pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.constants
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

StyledDrawer {
    id: root

    visible: Visibility.dashboard

    WrapperRectangle {
        color: Theme.palette.base200
        radius: 8
        margin: 32
        ColumnLayout {
            spacing: 8
            RowLayout {
                spacing: 8

                Layout.alignment: Qt.AlignHCenter

                StyledIconButton {
                    id: previousPlayerButton

                    visible: Mpris.players.length > 1
                    text: Icons.chevronLeft

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

                    text: Icons.chevronRight

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
}
