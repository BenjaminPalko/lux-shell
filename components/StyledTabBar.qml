import QtQuick
import QtQuick.Controls.Basic

TabBar {
    id: control

    property alias orientation: view.orientation

    contentItem: ListView {
        id: view
        model: control.contentModel
        currentIndex: control.currentIndex
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
    }

    background: Item {}
}
