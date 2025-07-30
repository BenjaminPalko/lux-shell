import qs.config
import qs.constants
import qs.widgets
import QtQuick
import Quickshell.Hyprland

Loader {
    required property HyprlandWorkspace modelData

    active: modelData.id > 0

    sourceComponent: workspace
    property Component workspace: StyledButton {
        id: clickable

        onClicked: modelData.activate()

        content: Text {
            id: icon

            font.family: Theme.lucide.font.family
            font.pixelSize: Dimensions.workspace.iconSize
            font.bold: true
            text: Icons.triangle

            color: Theme.palette.basecontent

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
