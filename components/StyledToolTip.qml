import qs.config
import QtQuick
import QtQuick.Controls

ToolTip {
    id: control
    text: qsTr("A descriptive tool tip of what the button does")

    contentItem: Text {
        text: control.text
        font: control.font
        color: Styling.theme.basecontent
    }

    background: Rectangle {
        radius: 8
        color: Styling.theme.base100
        border.color: Styling.theme.base200
        border.width: 2
    }
}
