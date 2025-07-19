import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import "../../../config"

Item {
    id: workspace

    required property HyprlandWorkspace modelData

    visible: modelData.id > 0

    width: Dimensions.workspace.width
    height: Dimensions.workspace.height

    Rectangle {
        id: rectangle
        anchors.fill: button
        color: Theme.palette.base100
        radius: Dimensions.radius
    }

    Button {
        id: button
        anchors.centerIn: parent

        verticalPadding: Dimensions.workspace.verticalPadding
        horizontalPadding: Dimensions.workspace.horizontalPadding

        background: null

        icon.source: "/home/baobeld/dotfiles/quickshell/assets/triangle.svg"
        icon.color: Theme.palette.basecontent

        onClicked: workspace.modelData.activate()

        states: State {
            name: "active"
            when: workspace.modelData.active
            PropertyChanges {
                button {
                    rotation: 180
                    icon.color: Theme.palette.primary
                }
            }
        }

        transitions: Transition {
            from: ""
            to: "active"
            reversible: true
            NumberAnimation {
                properties: "rotation"
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }
    }
}
