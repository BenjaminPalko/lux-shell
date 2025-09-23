import "bar"
import "configuration"
import "drawers"
import "launcher"
import "pomodoro"
import "powermenu"
import "storybook"
import "wallpaper"
import QtQuick
import Quickshell
import Quickshell.Wayland

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        PanelWindow {
            id: background

            // visible: false
            anchors.top: true
            anchors.left: true
            anchors.right: true
            anchors.bottom: true

            color: "transparent"

            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background

            Wallpaper {}
        }

        PanelWindow {
            id: exclusionZone

            anchors.top: true
            anchors.left: true
            anchors.right: true

            implicitWidth: bar.width
            implicitHeight: bar.height + bar.anchors.margins

            color: "transparent"
        }

        PanelWindow {
            id: topWindow

            anchors.top: true
            anchors.left: true
            anchors.right: true
            anchors.bottom: true

            color: 'transparent'

            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Top

            mask: Region {
                width: topWindow.width
                height: topWindow.height
                intersection: Intersection.Xor
                regions: regions.instances
            }

            Variants {
                id: regions

                model: panels.children

                Region {
                    required property Item modelData

                    x: modelData.x
                    y: modelData.y
                    width: modelData.width
                    height: modelData.height
                    intersection: Intersection.Subtract
                }
            }

            Item {
                id: panels

                anchors.fill: parent

                Bar {
                    id: bar
                }
            }
        }
        Configuration {}
        Launcher {}
        Pomodoro {}
        PowerMenu {}
        Storybook {}
        Drawers {}
    }
}
