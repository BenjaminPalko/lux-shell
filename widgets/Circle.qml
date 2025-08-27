import qs.config
import QtQuick
import QtQuick.Shapes

Item {
    id: root

    property int radius: 0
    property double percentage: 0
    property alias color: path.strokeColor

    implicitWidth: radius * 2
    implicitHeight: radius * 2

    Shape {

        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: Theme.palette.base100
            strokeColor: Theme.palette.base200
            strokeWidth: 8

            PathAngleArc {
                centerX: root.radius
                centerY: root.radius
                radiusX: root.radius
                radiusY: root.radius
                sweepAngle: 360
            }
        }

        ShapePath {
            id: path

            fillColor: "transparent"
            strokeWidth: 8
            strokeColor: "white"
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: root.radius
                centerY: root.radius
                radiusX: root.radius
                radiusY: root.radius
                startAngle: -90
                sweepAngle: 360 * root.percentage
            }
        }
    }
}
