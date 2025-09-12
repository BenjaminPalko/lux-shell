import qs.config
import QtQuick
import QtQuick.Controls.Basic

TabBar {
    id: control

    property alias orientation: view.orientation

    contentItem: ListView {
        id: view
        model: control.contentModel
        currentIndex: control.currentIndex
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
    }
    background: Rectangle {
      color: Styling.theme.base200
    }
}
