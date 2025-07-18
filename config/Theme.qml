pragma Singleton

import QtQml
import QtQuick
import Quickshell

Singleton {
    id: root

    property string fontFamily: "JetBrainsMono Nerd Font"
    property Palette palette: Palette {}

    component Palette: QtObject {
        id: palette

        property color primary: "#1fb854"
        property color secondary: "#1eb88e"
        property color accent: "#1fb8ab"
        property color neutral: "#19362d"
        property color base100: "#1b1717"
        property color base200: "#161212"
        property color base300: "#110d0d"
        property color basecontent: "#cac9c9"
        property color info: "#00b5ff"
        property color success: "#00a96e"
        property color warning: "#ffbe00"
        property color error: "#ff5861"
    }
}
