pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    property list<MprisPlayer> players: Mpris.players.values
    property MprisPlayer active: players.filter(player => player.isPlaying)[0] ?? players[0]
}
