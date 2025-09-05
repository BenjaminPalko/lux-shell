import qs.config
import QtQuick
import QtQuick.Shapes

Item {
    id: root

    property int radius: 0
    property double percentage: 0
    property alias borderColor: fill.strokeColor
    property alias strokeColor: path.strokeColor
    property alias strokeWidth: path.strokeWidth
    property alias fillColor: fill.fillColor

    implicitWidth: radius * 2
    implicitHeight: radius * 2

    Shape {

        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            id: fill

            fillColor: Styling.theme.base100
            strokeColor: Styling.theme.base200
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
            strokeWidth: 0
            strokeColor: "transparent"
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
