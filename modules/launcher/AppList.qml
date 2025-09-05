pragma ComponentBehavior: Bound

import "items"
import "services"
import qs.components
import qs.config
import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StyledListView {
    id: root

    required property TextField search

    Layout.fillWidth: true

    model: ScriptModel {
        id: model

        onValuesChanged: root.currentIndex = 0
        values: Apps.query(search.text)
    }

    spacing: 12

    implicitWidth: 500
    implicitHeight: 500
    highlightMoveDuration: 100
    highlightResizeDuration: 0
    highlight: Rectangle {
        radius: 8
        color: Styling.theme.primary
    }

    header: StyledText {
        text: "Apps"
        font.pixelSize: 18
        padding: 8
    }
    delegate: appItem

    Component {
        id: appItem

        AppItem {
            active: ListView.isCurrentItem
        }
    }
}
