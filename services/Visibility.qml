pragma Singleton

import qs.widgets
import Quickshell

Singleton {
    property StyledPopupWindow activePopup

    function togglePopup(popup: StyledPopupWindow) {
        if (activePopup && popup != activePopup) {
            activePopup.state = "";
        }
        popup.state = popup.state == "opened" ? "" : "opened";
        activePopup = popup;
    }
}
