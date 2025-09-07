import qs.components
import qs.services
import QtQuick
import QtQuick.Controls

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 800
    implicitHeight: 800

    ScrollView {
        id: view

        anchors.fill: parent
        background: Item {}
    }

    component Menus: QtObject {
        property Component theme
    }
}
