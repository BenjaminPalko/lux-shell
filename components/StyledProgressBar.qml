import qs.config
import QtQuick
import QtQuick.Controls

ProgressBar {
    id: control
    value: 0.5
    padding: 2

    HoverHandler {
        enabled: !control.indeterminate
        cursorShape: Qt.PointingHandCursor
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 6
        color: Theme.palette.base100
        radius: 8
    }

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 4

        // Progress indicator for determinate state.
        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 8
            color: Theme.palette.primary
            visible: !control.indeterminate
        }

        // Scrolling animation for indeterminate state.
        Item {
            anchors.fill: parent
            visible: control.indeterminate
            clip: true

            Row {
                Rectangle {
                    id: rect
                    color: Theme.palette.primary
                    width: 40
                    height: control.height
                }
                XAnimator on x {
                    from: control.width + rect.width
                    to: -rect.width
                    duration: Styling.animations.speed.verySlow
                    loops: Animation.Infinite
                    running: control.indeterminate
                }
            }
        }
    }
}
