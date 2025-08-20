import "bar"
import "launcher"
import "powermenu"
import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        Bar {}
        Launcher {}
        PowerMenu {}
    }
}
