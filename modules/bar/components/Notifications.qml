import QtQuick
import Quickshell.Io
import "../../../config/"
import "../../../constants/"
import "../../../services/"
import "../../../styled/"

Clickable {
    id: clickable

    implicitWidth: text.width
    implicitHeight: Dimensions.notifications.height

    onClicked: {
        Notifications.clear();
    }

    StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.notifications.fontSize
        font.bold: true
        text: Icons.bell

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.notifications.verticalPadding
        bottomPadding: Dimensions.notifications.verticalPadding
        leftPadding: Dimensions.notifications.horizontalPadding
        rightPadding: Dimensions.notifications.horizontalPadding

        states: State {
            when: Notifications.hasNotifications
            PropertyChanges {
                text {
                  text: Icons.bellRing
                  color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.secondary
                }
            }
        }
    }
}
