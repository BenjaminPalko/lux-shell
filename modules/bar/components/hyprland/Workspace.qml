import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import Quickshell.Hyprland
import "../../../../config"
import "../../../../styled/"

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
            when: mouseArea.containsMouse
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
                duration: 200
                easing.type: Easing.InOutCubic
            }
        }
    }

    Icon {
        id: icon

        source: "/home/baobeld/dotfiles/quickshell/assets/triangle.svg"

        anchors.centerIn: parent
        size: Dimensions.workspace.iconSize

        states: State {
            name: "active"
            when: workspace.modelData.active
            PropertyChanges {
                icon {
                    rotation: 180
                    color: mouseArea.containsMouse ? Theme.palette.basecontent : Theme.palette.primary
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

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        hoverEnabled: true
        onClicked: workspace.modelData.activate()
    }
}
