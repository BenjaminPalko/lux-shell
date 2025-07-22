import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Item {
    id: root

    property int currentIndex: 0

    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height

    Repeater {
        id: players
        model: Mpris.players.values.filter(item => item != null)

        Player {

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
