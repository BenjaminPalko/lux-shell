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
        anchors.fill: parent
        color: Theme.palette.base100
        radius: Dimensions.radius
        states: State {
            name: "hovered"
            when: button.hovered
            PropertyChanges {
                rectangle {
                    color: Theme.palette.primary
                }
            }
        }
        transitions: Transition {
            from: ""
            to: "hovered"
            reversible: true
            ColorAnimation {
                properties: "color"
                duration: 300
                easing.type: Easing.InOutCubic
            }
        }
    }

    Button {
        id: button
        anchors.centerIn: parent

        verticalPadding: Dimensions.workspace.verticalPadding
        horizontalPadding: Dimensions.workspace.horizontalPadding

        background: undefined

        icon.source: "/home/baobeld/dotfiles/quickshell/assets/triangle.svg"
        icon.color: Theme.palette.basecontent

        states: State {
            name: "active"
            when: workspace.modelData.active
            PropertyChanges {
                button {
                    rotation: 180
                    icon.color: button.hovered ? Theme.palette.basecontent : Theme.palette.primary
                }
            }
        }

        transitions: Transition {
            from: ""
            to: "active"
            reversible: true
            ParallelAnimation {
                RotationAnimation {
                    duration: 300
                    easing.type: Easing.InOutCubic
                }
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.OutCubic
                }
            }
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: workspace.modelData.activate()
    }
}
