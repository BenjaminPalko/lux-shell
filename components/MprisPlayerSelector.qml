import qs.components
import qs.constants
import qs.services
import qs.widgets
import QtQuick
import QtQuick.Layouts

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
        font.pixelSize: 20
    }

    StyledIconButton {
        id: nextPlayerButton

        visible: Mpris.players.length > 1
        text: Icons.chevronRight

        onClicked: {
            Mpris.nextPlayer();
        }
    }
}
