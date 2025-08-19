pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property var lucide: FontLoader {
        source: "../assets/lucide.woff"
    }
    property string fontFamily: "JetBrainsMono Nerd Font"
    property Palette palette: Palette {}

    component Palette: QtObject {
        id: palette

        property color primary: "#1fb854"
        property color primarycontent: "#000000"
        property color secondary: "#1eb88e"
        property color secondarycontent: "#000c07"
        property color accent: "#1fb8ab"
        property color accentcontent: "#010c0b"
        property color neutral: "#19362d"
        property color neutralcontent: "#cdd3d1"
        property color base100: "#1b1717"
        property color base200: "#161212"
        property color base300: "#110d0d"
        property color basecontent: "#cac9c9"
        property color info: "#00b5ff"
        property color infocontent: "#000000"
        property color success: "#00a96e"
        property color successcontent: "#000000"
        property color warning: "#ffbe00"
        property color warningcontent: "#000000"
        property color error: "#ff5861"
        property color errorcontent: "#000000"
    }
}
