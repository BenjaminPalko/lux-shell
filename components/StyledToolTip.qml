import qs.config
import QtQuick
import QtQuick.Controls

ToolTip {
    id: control
    text: qsTr("A descriptive tool tip of what the button does")

    contentItem: Text {
        text: control.text
        font: control.font
        color: Theme.palette.basecontent
    }

    background: Rectangle {
        radius: 8
        color: Theme.palette.base200
    }
}
