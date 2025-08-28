pragma ComponentBehavior: Bound

import qs.components
import qs.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

StyledLabel {
    id: root

    required property var modelData

    margin: 16
    anchors.left: parent.left
    anchors.right: parent.right

    RowLayout {
        ClippingRectangle {
            implicitWidth: icon.implicitSize
            implicitHeight: icon.implicitSize
            IconImage {
                id: icon
                implicitSize: 20
                source: root.modelData.image == "" ? Quickshell.iconPath(root.modelData.appIcon, "device-support-unknown-symbolic") : root.modelData.image
            }
        }
        ColumnLayout {

            StyledText {
                font.bold: true
                font.pixelSize: 12
                text: root.modelData.summary ?? root.modelData.appName
            }
            StyledText {
                text: root.modelData.body
            }
        }
    }
}
