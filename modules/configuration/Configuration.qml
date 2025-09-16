import qs.components
import qs.services
import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell.Wayland

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 800
    implicitHeight: 400

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: window.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    HyprlandFocusGrab {
        active: Visibility.configuration
        windows: [window]
        onCleared: {
            Visibility.configuration = false;
        }
    }

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

            text: "Audio"
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
            padding: 24
            AudioView {}
        }
        ScrollView {
            padding: 24
            StylingView {}
        }
    }
}
