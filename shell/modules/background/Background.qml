import QtQuick
import Quickshell
import Quickshell.Wayland
import "../../widgets"

Variants {
    model: Quickshell.screens

    StyledWindow {
        id: background

        required property ShellScreen modelData

        screen: modelData
        name: "background"
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Background
        color: "black"

        anchors.top: true
        anchors.bottom: true
        anchors.left: true
        anchors.right: true

        Image {
            id: wallpaper

            anchors.fill: parent

            opacity: 1

            source: "/home/baobeld/Wallpapers/bailey-zindel-NRQV-hBF10M-unsplash.jpg"
        }
    }
}
