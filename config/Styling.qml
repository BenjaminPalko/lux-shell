pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property Animations animations: Animations {}
    readonly property Typography typography: Typography {}
    readonly property var theme: Theme.palette
    readonly property Lucide lucide: Lucide {}

    component Animations: QtObject {
        readonly property AnimationSpeed speed: AnimationSpeed {}
    }
    component AnimationSpeed: QtObject {
        readonly property int veryFast: 50
        readonly property int fast: 100
        readonly property int normal: 200
        readonly property int slow: 400
        readonly property int verySlow: 1000
    }

    component Typography: QtObject {
        readonly property string fontFamily: "JetBrainsMono Nerd Font"
        readonly property FontSize textSize: FontSize {}
    }
    component FontSize: QtObject {
        readonly property int sm: 12
        readonly property int base: 14
        readonly property int lg: 18
        readonly property int xl: 24
    }

    component Lucide: Item {

        readonly property alias font: loader.font
        readonly property LucideIcons icons: LucideIcons {}

        FontLoader {
            id: loader
            source: "../assets/lucide.woff"
        }
    }
    component LucideIcons: QtObject {
        readonly property string batteryCharging: "\u{E058}"
        readonly property string batteryFull: "\u{E059}"
        readonly property string batteryMedium: "\u{E05b}"
        readonly property string batteryLow: "\u{E05a}"
        readonly property string batteryWarning: "\u{E3b0}"
        readonly property string bell: "\u{E05d}"
        readonly property string bellRing: "\u{E224}"
        readonly property string bluetooth: "\u{E060}"
        readonly property string bluetoothConnected: "\u{E1b8}"
        readonly property string brickWall: "\u{E586}"
        readonly property string coffee: "\u{E09a}"
        readonly property string chevronLeft: "\u{E072}"
        readonly property string chevronRight: "\u{E073}"
        readonly property string cpu: "\u{E0ad}"
        readonly property string gpu: "\u{E66f}"
        readonly property string hardDrive: "\u{E0f1}"
        readonly property string memoryStick: "\u{E44a}"
        readonly property string pause: "\u{E132}"
        readonly property string play: "\u{E140}"
        readonly property string search: "\u{E155}"
        readonly property string skipBack: "\u{E163}"
        readonly property string skipForward: "\u{E164}"
        readonly property string stop: "\u{E132}"
        readonly property string square: "\u{E16B}"
        readonly property string wifiOff: "\u{E1af}"
        readonly property string wifiLow: "\u{E5fd}"
        readonly property string wifiHigh: "\u{E5fc}"
        readonly property string wifi: "\u{E1ae}"
        readonly property string triangle: "\u{E192}"
        readonly property string triangleDashed: "\u{E642}"
    }
}
