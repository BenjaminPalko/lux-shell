import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Item {
    id: root

    property int currentIndex: 0
    property var players: Mpris.players

    anchors.horizontalCenter: parent.horizontalCenter

    Repeater {
        id: players
        model: Mpris.players.values.filter(item => item != null)

        Player {

          anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter

            visible: index === root.currentIndex && modelData.canControl

            onNextPlayer: {
                currentIndex = (currentIndex + 1) % players.count;
            }
            onPreviousPlayer: {
                currentIndex = (currentIndex - 1 + players.count) % players.count;
            }
        }
    }
}
