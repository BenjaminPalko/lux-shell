import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../../../../config/"

RowLayout {
    id: root

    spacing: Dimensions.workspace.spacing

    Repeater {

        model: Hyprland.workspaces

        Workspace {}
    }
}
