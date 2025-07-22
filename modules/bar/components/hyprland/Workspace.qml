import QtQuick
import Quickshell.Hyprland
import "../../../../config"
import "../../../../styled/"

Loader {
    required property HyprlandWorkspace modelData

    active: modelData.id > 0

    sourceComponent: workspace
    property Component workspace: Clickable {
        id: clickable

        width: Dimensions.workspace.width
        height: Dimensions.workspace.height

        onClicked: modelData.activate()

        Icon {
            id: icon

            source: "/home/baobeld/dotfiles/quickshell/assets/triangle.svg"

            anchors.centerIn: parent
            size: Dimensions.workspace.iconSize

            states: State {
                name: "active"
                when: modelData.active
                PropertyChanges {
                    icon {
                        rotation: 180
                        color: clickable.hovered ? Theme.palette.basecontent : Theme.palette.primary
                    }
                }
            }

            transitions: Transition {
                from: ""
                to: "active"
                reversible: true
                ParallelAnimation {
                    RotationAnimation {
                        duration: 200
                        easing.type: Easing.InOutCubic
                    }
                    ColorAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }
}
