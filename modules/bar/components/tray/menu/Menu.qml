import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../config/"
import "../../../../../styled/"

ColumnLayout {
    id: menu
    property QsMenuOpener menuOpener

    anchors.margins: 8

    Repeater {
        model: menuOpener.children
        delegate: Loader {
            required property QsMenuEntry modelData
            active: true

            sourceComponent: modelData.isSeparator ? menuSeperator : menuItem
            property Component menuSeperator: Rectangle {
                implicitHeight: 1
                implicitWidth: menu.width
                color: Theme.palette.basecontent
            }
            property Component menuItem: MenuItem {
                menuEntry: modelData
            }
        }
    }
}
