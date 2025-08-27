import qs.config
import QtQuick
import QtQuick.Controls

Drawer {
    id: control
    dim: false
    background: Rectangle {
        Component.onCompleted: {
            if (control.edge == Qt.TopEdge) {
                bottomLeftRadius = 8;
                bottomRightRadius = 8;
            } else if (control.edge == Qt.LeftEdge) {
                topRightRadius = 8;
                bottomRightRadius = 8;
            } else if (control.edge == Qt.RightEdge) {
                topLeftRadius = 8;
                bottomLeftRadius = 8;
            } else if (control.edge == Qt.BottomEdge) {
                topLeftRadius = 8;
                topRightRadius = 8;
            }
        }
        color: Theme.palette.base200
    }
}
