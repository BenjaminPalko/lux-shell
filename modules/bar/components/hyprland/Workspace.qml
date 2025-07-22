import QtQuick
import Quickshell.Hyprland
import "../../../../config"
import "../../../../constants/"
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

        Text {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.workspace.iconSize
            font.bold: true
            text: Icons.triangle

            color: Theme.palette.basecontent

            anchors.centerIn: parent

            states: [
                State {
                    name: "focused"
                    when: modelData.focused
                    PropertyChanges {
                        icon {
                            rotation: 180
                            color: clickable.hovered ? Theme.palette.basecontent : Theme.palette.primary
                        }
                    }
                },
                State {
                    name: "active"
                    when: modelData.active
                    PropertyChanges {
                        icon {
                            text: Icons.triangleDashed
                            rotation: 180
                            color: clickable.hovered ? Theme.palette.basecontent : Theme.palette.primary
                        }
                    }
                }
            ]

            transitions: Transition {
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
