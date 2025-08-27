import "dashboard"
import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: parentWindow

    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true

    color: 'transparent'

    // WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Top

    mask: Region {
        width: parentWindow.width
        height: parentWindow.height
        intersection: Intersection.Xor
        regions: [
            Region {
                x: dashboard.x
                y: dashboard.y
                width: dashboard.width
                height: dashboard.height
                intersection: Intersection.Subtract
            }
        ]
    }

    Dashboard {
        id: dashboard
        x: parentWindow.width / 2 - dashboard.width / 2
        edge: Qt.TopEdge
        padding: 20
        margins: 200
    }
}
