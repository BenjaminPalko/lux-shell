import QtQuick

ListView {
    id: root

    maximumFlickVelocity: 3000

    rebound: Transition {
        NumberAnimation {
            properties: "x,y"
            duration: 400
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.2, 0, 0, 1, 1, 1]
        }
    }
}
