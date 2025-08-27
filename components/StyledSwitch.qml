import qs.config
import QtQuick
import QtQuick.Controls

Switch {
    id: control
    indicator: Item {
        implicitWidth: 48
        implicitHeight: 22
        Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height - 4
            x: control.leftPadding
            y: parent.height / 2 - height / 2
            radius: 6
            color: control.checked ? Theme.palette.primary : Theme.palette.base100
            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        Rectangle {
            x: control.checked ? parent.width - 3 * width / 4 : width / 4
            y: parent.height / 2 - height / 2
            Behavior on x {
                NumberAnimation {
                    duration: 150
                }
            }
            width: 22
            height: 22
            radius: 6
            color: Theme.palette.basecontent
        }
    }
}
