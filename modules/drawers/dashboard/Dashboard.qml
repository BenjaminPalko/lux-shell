pragma ComponentBehavior: Bound

import qs.components
import qs.services
import QtQuick
import QtQuick.Layouts

StyledDrawer {
    id: root

    visible: Visibility.dashboard

    StyledWrapperRectangle {
        margin: 32
        ColumnLayout {
            spacing: 8

            MprisPlayerSelector {
                Layout.alignment: Qt.AlignHCenter
            }

            MprisController {
                player: Mpris.active
            }
        }
    }
}
