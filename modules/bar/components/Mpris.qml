pragma ComponentBehavior: Bound

import qs.components
import qs.services
import QtQuick

StyledButton {
    id: root

    text: `${Mpris.active?.isPlaying ? "" : ""} ${Mpris.active?.trackTitle} - ${Mpris.active?.trackArtist}`

    onClicked: {
        Visibility.dashboard = !Visibility.dashboard;
    }
}
