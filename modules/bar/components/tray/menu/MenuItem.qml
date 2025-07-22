import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../styled/"

Clickable {
    id: item
    property QsMenuEntry menuEntry

    implicitWidth: text.width

    Text {
        id: text
        text: item.menuEntry.text

        padding: 8
    }
}
