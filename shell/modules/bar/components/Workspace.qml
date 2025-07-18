import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import "../../../config"

Item {
    id: workspace

    required property HyprlandWorkspace modelData

    visible: modelData.id > 0

    width: 30
    height: 30

    Button {
        id: button
        anchors.centerIn: parent

        padding: 6
        leftPadding: 7
        rightPadding: 7

        background: Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "#161212"
            radius: 8
        }

        rotation: workspace.modelData.active ? 0 : 180

        icon.source: "/home/baobeld/dotfiles/quickshell/shell/assets/triangle.svg"
        icon.color: workspace.modelData.active ? Theme.palette.primary : Theme.palette.basecontent

        onClicked: workspace.modelData.activate()
    }
}
