import qs.config
import QtQuick
import QtQuick.Controls

ListView {
    id: root

    clip: true
    maximumFlickVelocity: 3000

    ScrollBar {
        orientation: root.orientation == ListView.Vertical ? Qt.Vertical : Qt.Horizontal
    }

    rebound: Transition {
        NumberAnimation {
            properties: "x,y"
            duration: Styling.animations.speed.slow
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.2, 0, 0, 1, 1, 1]
        }
    }
}
