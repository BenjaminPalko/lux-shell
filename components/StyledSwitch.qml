import qs.config
import QtQuick
import QtQuick.Controls

Switch {
    id: control

    contentItem: Text {
        id: text
        rightPadding: control.indicator.width + control.spacing
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: Theme.palette.basecontent
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    indicator: Rectangle {
        id: indicator

        property int padding: 8

        implicitWidth: 48
        implicitHeight: 24
        x: control.width - width - control.rightPadding
        y: parent.height / 2 - height / 2
        radius: 16
        color: "transparent"
        border.color: control.checked ? Theme.palette.primary : Theme.palette.basecontent
        border.width: 2

        Rectangle {
            anchors.margins: 4
            x: control.checked ? parent.width - width - indicator.padding / 2 : indicator.padding / 2
            y: parent.height / 2 - height / 2
            Behavior on x {
                NumberAnimation {
                    duration: Styling.animations.speed.fast
                }
            }
            width: parent.width / 2 - indicator.padding
            height: parent.height - indicator.padding
            radius: 16
            color: control.checked ? Theme.palette.primary : Theme.palette.basecontent
        }
    }

    background: Item {}
}
