import qs.config
import QtQuick

Text {
    font.family: Theme.fontFamily
    color: Theme.palette.basecontent
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
}
