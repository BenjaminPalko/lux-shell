import qs.components
import qs.config
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property DesktopEntry modelData
    required property int index
    property bool active: false

    anchors.left: parent?.left
    anchors.right: parent?.right
    implicitHeight: grid.height

    GridLayout {
        id: grid

        columnSpacing: 12
        rowSpacing: 1
        columns: 2
        rows: 2

        anchors.left: root?.left
        anchors.right: root?.right

        IconImage {
            Layout.leftMargin: 8
            Layout.topMargin: 8
            Layout.bottomMargin: 8
            Layout.columnSpan: 1
            Layout.rowSpan: 2
            source: Quickshell.iconPath(root.modelData.runInTerminal ? "terminal-app" : root.modelData.icon, "image-missing")
            implicitSize: 32
        }

        StyledText {
            text: root.modelData.name.trim()

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            color: root.active ? Styling.theme.primarycontent : Styling.theme.basecontent
            font.bold: true
        }

        StyledText {
            text: root.modelData.comment != "" ? root.modelData.comment : root.modelData.genericName

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            color: root.active ? Styling.theme.primarycontent : Styling.theme.basecontent
            font.pixelSize: Styling.typography.textSize.sm
            elide: Text.ElideRight
        }
    }
}
