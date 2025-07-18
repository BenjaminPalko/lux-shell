import QtQuick
import Quickshell
import "components"
import "../../config/"

Scope {
    PanelWindow {
        id: root

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 40

        color: 'transparent'

        Rectangle {
            id: background
            anchors.fill: parent
            color: Theme.palette.base300
        }

        Row {
            id: leftbar

            spacing: 6
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 2

            Workspaces {
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row {
            id: centerbar

            spacing: 6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Clock {}
        }

        Row {
            id: rightbar

            anchors.top: parent.top
            anchors.right: parent.left
            anchors.bottom: parent.bottom
        }
    }
}
