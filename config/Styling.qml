pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property Animations animations: Animations {}

    component Animations: QtObject {
        property AnimationSpeed speed: AnimationSpeed {}
    }
    component AnimationSpeed: QtObject {
        property int veryFast: 50
        property int fast: 100
        property int normal: 200
        property int slow: 400
        property int verySlow: 1000
    }
}
