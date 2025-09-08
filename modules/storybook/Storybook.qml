pragma ComponentBehavior: Bound

import qs.components
import qs.services
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Wayland

StyledPanelWindow {
    id: root
    name: "storybook"

    visible: Visibility.storybook
    implicitWidth: 500
    implicitHeight: 600

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    HyprlandFocusGrab {
        active: Visibility.storybook
        windows: [root]
        onCleared: {
            Visibility.storybook = false;
        }
    }

    ColumnLayout {
        id: layout

        anchors.fill: parent
        spacing: 0

        StyledTabBar {
            id: tabs
            Layout.fillWidth: true
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

        StackLayout {
            currentIndex: tabs.currentIndex

            ScrollView {
                Layout.maximumHeight: 400
                padding: 36
                Fields {}
            }
            ScrollView {
                Layout.maximumHeight: 400
                padding: 36
                Selectors {}
            }
            ScrollView {
                Layout.maximumHeight: 400
                padding: 36
                Components {}
            }
        }
    }
}
