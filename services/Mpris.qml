pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    property list<MprisPlayer> players: Mpris.players.values
    property MprisPlayer active: players[properties.currentIndex]

    PersistentProperties {
        id: properties

        property int currentIndex: 0
    }

    onPlayersChanged: {
        if (!active) {
            properties.currentIndex = 0;
        }
    }

    function nextPlayer() {
        if (players.length == 0) {
            return;
        }
        properties.currentIndex = (properties.currentIndex + 1) % players.length;
    }

    function previousPlayer() {
        if (players.length == 0) {
            return;
        }
        const newIndex = properties.currentIndex - 1;
        properties.currentIndex = newIndex >= 0 ? newIndex : players.length - 1;
    }
}
