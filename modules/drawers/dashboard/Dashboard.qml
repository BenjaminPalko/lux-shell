pragma ComponentBehavior: Bound

import qs.components
import qs.components.composite
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

StyledDrawer {
    id: root

    visible: Visibility.dashboard

    WrapperItem {
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
