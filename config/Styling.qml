pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    readonly property Animations animations: Animations {}
    readonly property Typography typography: Typography {}
    readonly property Layout layout: Layout {}
    readonly property alias theme: theme
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

    component Layout: QtObject {
        readonly property LayoutSpacing spacing: LayoutSpacing {}
    }
    component LayoutSpacing: QtObject {
        readonly property int sm: 2
        readonly property int base: 4
        readonly property int lg: 8
        readonly property int xl: 12
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
        readonly property string activity: "\u{E038}"
        readonly property string audioLines: "\u{E55F}"
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
        readonly property string layoutDashboard: "\u{E1C1}"
        readonly property string memoryStick: "\u{E44a}"
        readonly property string pause: "\u{E132}"
        readonly property string play: "\u{E140}"
        readonly property string search: "\u{E155}"
        readonly property string skipBack: "\u{E163}"
        readonly property string skipForward: "\u{E164}"
        readonly property string square: "\u{E16B}"
        readonly property string stop: "\u{E132}"
        readonly property string swatchBook: "\u{E5A4}"
        readonly property string wifiOff: "\u{E1af}"
        readonly property string wifiLow: "\u{E5fd}"
        readonly property string wifiHigh: "\u{E5fc}"
        readonly property string wifi: "\u{E1ae}"
        readonly property string triangle: "\u{E192}"
        readonly property string triangleDashed: "\u{E642}"
    }

    FileView {
        path: `${Paths.config}/themes/${Theme.currentTheme}.json`
        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: theme
            property color primary: "#605dff"
            property color primarycontent: "#edf1fe"
            property color secondary: "#f43098"
            property color secondarycontent: "#f9e4f0"
            property color accent: "#00d3bb"
            property color accentcontent: "#084d49"
            property color neutral: "#09090b"
            property color neutralcontent: "#e4e4e7"
            property color base100: "#1d232a"
            property color base200: "#191e24"
            property color base300: "#15191e"
            property color basecontent: "#ecf9ff"
            property color info: "#00bafe"
            property color infocontent: "#042e49"
            property color success: "#00d390"
            property color successcontent: "#004c39"
            property color warning: "#fcb700"
            property color warningcontent: "#793205"
            property color error: "#ff627d"
            property color errorcontent: "#4d0218"

            property int radiusSelector: 8
            property int radiusField: 8
            property int radiusBox: 8
            property int border: 2
        }
    }
}
