pragma ComponentBehavior: Bound

import "services"
import qs.config
import qs.constants
import qs.services
import qs.widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

StyledWindow {
    id: root
    name: "launcher"

    visible: Visibility.launcher
    implicitWidth: rect.width
    implicitHeight: rect.height

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    HyprlandFocusGrab {
        active: root.visible
        windows: [search]
        onCleared: {
            root.reset();
        }
    }

    function reset() {
        Visibility.launcher = false;
        list.currentIndex = 0;
        search.clear();
    }

    WrapperRectangle {
        id: rect

        color: Theme.palette.base300
        margin: 18
        radius: 8

        ColumnLayout {
            WrapperRectangle {
                id: searchWrapper

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                color: Theme.palette.base200
                margin: 4
                radius: 8

                RowLayout {
                    LucideIcon {
                        id: icon
                        Layout.leftMargin: 8
                        text: Icons.search
                    }

                    StyledTextField {
                        id: search

                        Layout.fillWidth: true
                        implicitHeight: 40
                        cursorVisible: true
                        focus: root.visible

                        placeholderText: "Applications"
                        placeholderTextColor: "grey"

                        Keys.onEscapePressed: event => {
                            event.accepted = true;
                            root.reset();
                        }
                        Keys.onReturnPressed: event => {
                            event.accepted = true;
                            Apps.launch(list.currentItem.modelData);
                            root.reset();
                        }
                        Keys.onUpPressed: event => {
                            event.accepted = true;
                            list.decrementCurrentIndex();
                        }
                        Keys.onDownPressed: event => {
                            event.accepted = true;
                            list.incrementCurrentIndex();
                        }
                    }
                }
            }

            Item {
                implicitWidth: list.width
                implicitHeight: list.height
                AppList {
                    id: list
                    search: search
                }
            }
        }
    }
}
