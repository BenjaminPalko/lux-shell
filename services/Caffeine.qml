pragma Singleton

import Quickshell
import Quickshell.Wayland

Singleton {

    property alias enabled: properties.enabled

    PersistentProperties {
        id: properties
        reloadableId: "Caffeine"

        property bool enabled: false
    }

    function toggle() {
        if (properties.enabled) {
            properties.enabled = false;
        } else {
            properties.enabled = true;
        }
    }

    IdleInhibitor {
        id: inhibitor
        enabled: properties.enabled
    }
}
