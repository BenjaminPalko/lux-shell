import qs.config
import qs.services
import QtQuick
import QtQuick.Controls

Menu {
    id: root

    palette.window: Theme.palette.base100
    palette.base: Theme.palette.base100

    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    popupType: Popup.Window

    function toggle() {
        visible ? close() : open();
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0.0
            to: 1.0
        }
    }
    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1.0
            to: 0.0
        }
    }
}
