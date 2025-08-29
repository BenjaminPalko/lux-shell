import qs.components
import Quickshell

StyledButton {
    id: root

    property QsMenuEntry menuEntry

    text: root.menuEntry.text

    onClicked: menuEntry.triggered()
}
