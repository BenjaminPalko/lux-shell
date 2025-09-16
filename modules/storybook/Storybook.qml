pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import Quickshell.Wayland

StyledPanelWindow {
    id: root
    name: "storybook"

    visible: Visibility.storybook
    implicitWidth: 500
    implicitHeight: 600

    background.color: Styling.theme.base200

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    HyprlandFocusGrab {
        active: Visibility.storybook
        windows: [root]
        onCleared: {
            Visibility.storybook = false;
        }
    }

    StyledTabBar {
        id: tabs
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: view.top
        implicitHeight: 40

        StyledTabButton {
            text: "Fields"
        }
        StyledTabButton {
            text: "Selectors"
        }
        StyledTabButton {
            text: "Components"
        }
    }

    SwipeView {
        id: view

        anchors.top: tabs.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        currentIndex: tabs.currentIndex

        background: Rectangle {
            color: Styling.theme.base100
            radius: Styling.theme.radiusBox
        }

        ScrollView {
            padding: 36
            Fields {}
        }
        ScrollView {
            padding: 36
            Selectors {}
        }
        ScrollView {
            padding: 36
            Components {}
        }
    }
}
