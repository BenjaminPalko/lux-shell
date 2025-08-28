import Quickshell

PersistentProperties {
    property list<var> actions: [
        {
            text: "󰍃 Logout",
            command: "hyprctl dispatch exit"
        },
        {
            text: "󰜉 Reboot",
            command: "systemctl reboot"
        },
        {
            text: " Shutdown",
            command: "systemctl poweroff"
        }
    ]
}
