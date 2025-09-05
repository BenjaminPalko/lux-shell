import qs.components
import qs.config
import QtQuick
import Quickshell.Hyprland

StyledIconButton {
    id: root

    required property HyprlandWorkspace workspace

    text: Styling.lucide.icons.triangle
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
                }
            }
        },
        State {
            name: "active"
            when: root.workspace.active
            PropertyChanges {
                root {
                    text: Styling.lucide.icons.triangleDashed
                    rotation: 180
                    color: root.hovered ? Theme.palette.basecontent : Theme.palette.primary
                }
            }
        }
    ]
}
