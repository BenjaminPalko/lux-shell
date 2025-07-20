pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property int radius: 8

    property Bar bar: Bar {}
    property Clock clock: Clock {}
    property Workspace workspace: Workspace {}

    component Bar: QtObject {
        id: bar

        property int spacing: 8
        property int border: 2
        property int height: 50
        property int verticalMargins: 4
        property int horizontalMargins: 8
        property int verticalPadding: 2
        property int horizontalPadding: 8
    }

    component Clock: QtObject {
        id: clock

        property int fontSize: 14
        property int width: 130
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Workspace: QtObject {
        id: workspace

        property int spacing: 5
        property int width: 30
        property int height: 30
        property int verticalPadding: 6
        property int horizontalPadding: 7
    }
}
