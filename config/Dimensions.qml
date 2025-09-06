pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property int radius: 8

    property Bar bar: Bar {}

    component Bar: QtObject {
        property int spacing: 8
        property int border: 2
        property int height: 50
        property int verticalMargins: 4
        property int horizontalMargins: 8
        property int verticalPadding: 2
        property int horizontalPadding: 8
    }
}
