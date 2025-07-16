import QtQuick
import QtQuick.Controls
import QtQuick.VectorImage
import Quickshell.Hyprland
import "../../../config"

Row {
    id: root

    spacing: 4

    Repeater {

        model: Hyprland.workspaces

        Item {
            id: workspace

            required property HyprlandWorkspace modelData

            visible: modelData.id > 0

            width: 25
            height: 25

            Rectangle {
                id: rectangle

                anchors.verticalCenter: parent.verticalCenter
                anchors.fill: parent
                color: "#161212"
                radius: 8
            }

            Button {
                id: button
                anchors.centerIn: parent
                anchors.fill: parent

                rotation: workspace.modelData.active ? 0 : 180

                icon.source: "/home/baobeld/dotfiles/quickshell/shell/assets/triangle.svg"
                icon.color: "#1fb854"

                // palette.button: QtColor.

                onClicked: workspace.modelData.activate()
            }
        }
    }
}
