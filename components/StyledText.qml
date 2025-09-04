import qs.config
import QtQuick

Text {
    font.family: Theme.fontFamily
    color: Theme.palette.basecontent
    ColorAnimation on color {
        duration: 100
    }
}
