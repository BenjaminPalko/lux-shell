import qs.config
import qs.constants
import qs.services
import qs.widgets
import QtQuick

StyledButton {
    id: clickable

    onClicked: {
        Notifications.clear();
    }

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.notifications.fontSize
        font.bold: true
        text: Icons.bell

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

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
