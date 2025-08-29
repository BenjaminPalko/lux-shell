import qs.components
import qs.widgets
import Quickshell

StyledButton {
    id: root
    property QsMenuEntry menuEntry
    onClicked: menuEntry.triggered()
    content: StyledText {
        font.pixelSize: 14
        text: root.menuEntry.text
    }
}
