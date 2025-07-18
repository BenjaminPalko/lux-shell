import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland

Row {
    id: root

    spacing: 4

    Repeater {

        model: Hyprland.workspaces

        Workspace {}
    }
}
