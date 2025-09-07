pragma ComponentBehavior: Bound

import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts
import Quickshell

StyledPopupWindow {
    id: window

    property QsMenuOpener menuOpener

    content: ColumnLayout {
        spacing: 8
        Repeater {
            model: window.menuOpener.children
            delegate: Loader {
                id: loader
                required property QsMenuEntry modelData

                active: true

                Layout.fillWidth: true
                Layout.minimumWidth: 160

                sourceComponent: modelData.isSeparator ? menuSeperator : menuItem
                property Component menuSeperator: Rectangle {
                    implicitHeight: 2

                    color: Styling.theme.base100
                }
                property Component menuItem: MenuItem {
                    menuEntry: loader.modelData
                }
            }
        }
    }
}
