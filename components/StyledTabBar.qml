import QtQuick
import QtQuick.Controls

Container {
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
