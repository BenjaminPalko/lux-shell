import "bar"
import "drawers"
import "launcher"
import "pomodoro"
import "powermenu"
import "storybook"
import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        Bar {}
        Launcher {}
        Pomodoro {}
        PowerMenu {}
        Storybook {}
        Drawers {}
    }
}
