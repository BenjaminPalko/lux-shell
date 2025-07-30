import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root

    spacing: Dimensions.workspace.spacing

    Repeater {

        model: Hyprland.workspaces

        Workspace {}
    }
}
