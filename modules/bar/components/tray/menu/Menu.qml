import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../styled/"

ColumnLayout {
    property QsMenuOpener menu

    Repeater {
        model: modelData.children

        Loader {
            id: loader
            required property QsMenuEntry modelData

            active: modelData.enabled

            sourceComponent: menuItem
            property Component menuItem: MenuItem {
                menuEntry: loader.modelData
            }
        }
    }
}
