pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property int radius: 8

    property Bar bar: Bar {}
    property Mpris mpris: Mpris {}
    property Clock clock: Clock {}
    property Pipewire pipewire: Pipewire {}
    property Storage storage: Storage {}
    property Memory memory: Memory {}
    property Cpu cpu: Cpu {}
    property Gpu gpu: Gpu {}
    property Caffeine caffeine: Caffeine {}
    property Workspace workspace: Workspace {}
    property Tray tray: Tray {}
    property TrayMenu trayMenu: TrayMenu {}

    component Bar: QtObject {
        property int spacing: 8
        property int border: 2
        property int height: 50
        property int verticalMargins: 4
        property int horizontalMargins: 8
        property int verticalPadding: 2
        property int horizontalPadding: 8
    }

    component Mpris: QtObject {
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Clock: QtObject {
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Pipewire: QtObject {
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Storage: QtObject {
        property int iconSize: 14
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Memory: QtObject {
        property int iconSize: 14
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Cpu: QtObject {
        property int iconSize: 14
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
      }

      component Gpu: QtObject {
        property int iconSize: 14
        property int fontSize: 14
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Caffeine: QtObject {
        property int fontSize: 16
        property int height: 30
        property int horizontalPadding: 8
        property int verticalPadding: 6
    }

    component Workspace: QtObject {
        property int spacing: 5
        property int iconSize: 16
        property int width: 30
        property int height: 30
        property int verticalPadding: 6
        property int horizontalPadding: 7
    }

    component Tray: QtObject {
        property int spacing: 5
        property int iconSize: 18
        property int width: 30
        property int height: 30
        property int verticalPadding: 6
        property int horizontalPadding: 7
    }

    component TrayMenu: QtObject {
        property int fontSize: 10
        property int width: 30
        property int height: 30
        property int verticalPadding: 6
        property int horizontalPadding: 7
    }
}
