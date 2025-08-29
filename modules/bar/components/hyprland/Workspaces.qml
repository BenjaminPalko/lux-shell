pragma ComponentBehavior: Bound

import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root

    spacing: Dimensions.workspace.spacing

    Repeater {

        model: Hyprland.workspaces

        Loader {
            id: loader
            required property HyprlandWorkspace modelData

            active: modelData.id > 0

            sourceComponent: workspace
            property Component workspace: Workspace {
                workspace: loader.modelData
            }
        }
    }
}
