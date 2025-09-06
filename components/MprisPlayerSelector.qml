import qs.config
import qs.components
import qs.services
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: Styling.layout.spacing.xl

    Layout.alignment: Qt.AlignHCenter

    StyledIconButton {
        id: previousPlayerButton

        visible: Mpris.players.length > 1
        text: Styling.lucide.icons.chevronLeft

        onClicked: {
            Mpris.previousPlayer();
        }
    }

    StyledText {
        font.pixelSize: Styling.typography.textSize.xl
        text: {
            if (!Mpris.active) {
                return "inactive";
            }
            const player = Mpris.active;
            const displayName = player.identity ?? player.desktopEntry ?? player.dbusName ?? "unknown";
            if (displayName.toLowerCase().includes('tidal')) {
                return "Tidal";
            }
            if (displayName.toLowerCase().includes('zen')) {
                return "Zen";
            }
            return displayName;
        }
    }

    StyledIconButton {
        id: nextPlayerButton

        visible: Mpris.players.length > 1
        text: Styling.lucide.icons.chevronRight

        onClicked: {
            Mpris.nextPlayer();
        }
    }
}
