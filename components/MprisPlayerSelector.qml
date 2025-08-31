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
            function parseName(name) {
                const words = name.split("-");
                const capitalized = words.map(val => val.trim().charAt(0).toUpperCase() + val.trim().slice(1));
                return capitalized.join(" ");
            }
            return parseName(Mpris.active?.desktopEntry ?? Mpris.active?.dbusName ?? "unknown");
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
