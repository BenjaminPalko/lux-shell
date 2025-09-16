import QtQuick
import QtQuick.Controls

TabBar {
    id: control

    property alias orientation: view.orientation

    contentItem: Item {
        ListView {
            id: view
            anchors.centerIn: parent
            implicitWidth: parent.width - 20
            implicitHeight: parent.height - 20
            model: control.contentModel
            currentIndex: control.currentIndex
            spacing: control.spacing
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds
        }
    }

    background: Item {}
}
