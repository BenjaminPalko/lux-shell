import qs.components
import qs.services
import QtQuick
import QtQuick.Controls

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 800
    implicitHeight: 400

    StyledTabBar {
        id: tabs
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: view.left

        implicitWidth: 200
        orientation: ListView.Vertical

        StyledTabButton {
            anchors.left: parent.left
            anchors.right: parent.right

            text: "General"
        }
        StyledTabButton {
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Styling"
        }
    }

    SwipeView {
        id: view

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: tabs.right

        clip: true
        orientation: Qt.Vertical

        currentIndex: tabs.currentIndex

        ScrollView {
            padding: 36
            StyledPane {
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }
        ScrollView {
            padding: 36
            StylingView {}
        }
    }
}
