import qs.components
import qs.config
import qs.constants
import QtQuick
import Quickshell.Hyprland

StyledIconButton {
    id: root

    required property HyprlandWorkspace workspace

    text: Icons.triangle
    font.bold: true
    font.pixelSize: 17
    padding: 8

    onClicked: root.workspace.activate()

    states: [
        State {
            name: "focused"
            when: root.workspace.focused
            PropertyChanges {
                root {
                    rotation: 180
                    color: root.hovered ? Theme.palette.basecontent : Theme.palette.primary
                    border.color: Theme.palette.secondary
                }
            }
        },
        State {
            name: "active"
            when: root.workspace.active
            PropertyChanges {
                root {
                    text: Icons.triangleDashed
                    rotation: 180
                    color: root.hovered ? Theme.palette.basecontent : Theme.palette.primary
                }
            }
        }
    ]
}
