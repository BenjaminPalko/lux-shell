pragma Singleton

import qs.widgets
import Quickshell

Singleton {
    property alias dashboard: properties.dashboard
    property alias launcher: properties.launcher
    property alias pomodoro: properties.pomodoro
    property alias powermenu: properties.powermenu
    property alias storybook: properties.storybook
    property StyledPopupWindow activePopup

    function togglePopup(popup: StyledPopupWindow) {
        if (activePopup && popup != activePopup) {
            activePopup.state = "";
        }
        popup.state = popup.state == "opened" ? "" : "opened";
        activePopup = popup;
    }

    PersistentProperties {
        id: properties

        property bool dashboard
        property bool launcher
        property bool pomodoro
        property bool powermenu
        property bool storybook
    }
}
