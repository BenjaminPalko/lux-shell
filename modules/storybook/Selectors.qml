import qs.components
import qs.config
import QtQuick
import QtQuick.Layouts

GridLayout {
    flow: GridLayout.TopToBottom
    columns: 2
    rows: 10

    ColumnLayout {
        StyledText {
            text: "Switch"
            font.pixelSize: 18
        }

        StyledSwitch {
            text: "Enable"
        }
    }
}
