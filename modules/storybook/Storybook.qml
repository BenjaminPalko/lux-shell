pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import qs.widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StyledWindow {
    id: root
    name: "storybook"

    visible: Visibility.storybook
    implicitWidth: rect.width
    implicitHeight: rect.height

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    WrapperRectangle {
        id: rect

        color: Theme.palette.base300
        leftMargin: 48
        rightMargin: 48
        topMargin: 24
        bottomMargin: 24
        radius: 8

        HyprlandFocusGrab {
            active: Visibility.storybook
            windows: [root]
            onCleared: {
                Visibility.storybook = false;
            }
        }

        ColumnLayout {
            StyledSwitch {}
            Button {
                id: toolTipButton
                text: "Hello world!"
                StyledToolTip {
                    visible: toolTipButton.hovered
                    text: qsTr("Save the active project")
                }
            }
        }
    }
}
