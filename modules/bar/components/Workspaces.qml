import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import "../../../config/"

Row {
    id: root

    spacing: Dimensions.workspace.spacing

    Repeater {

        model: Hyprland.workspaces

        Workspace {}
    }
}
