pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../config/"
import "../../../../../styled/"

StyledPopupWindow {
    id: window

    backgroundColor: Theme.palette.base300
    margins: 14
    radius: 8

    property QsMenuOpener menuOpener

    content: ColumnLayout {
        spacing: 8
        Repeater {
            model: window.menuOpener.children
            delegate: Loader {
                required property QsMenuEntry modelData

                active: true

                Layout.fillWidth: true
                Layout.minimumWidth: 160

                sourceComponent: modelData.isSeparator ? menuSeperator : menuItem
                property Component menuSeperator: Rectangle {
                    implicitHeight: 2

                    color: Theme.palette.base100
                }
                property Component menuItem: MenuItem {
                    menuEntry: modelData
                }
            }
        }
    }
}
