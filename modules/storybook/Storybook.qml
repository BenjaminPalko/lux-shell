pragma ComponentBehavior: Bound

import qs.components
import qs.constants
import qs.services
import qs.widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StyledWindow {
    id: root
    name: "storybook"

    visible: Visibility.storybook
    implicitWidth: rect.width
    implicitHeight: rect.height

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: root.visible ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None

    StyledWrapperRectangle {
        id: rect

        margin: 48

        HyprlandFocusGrab {
            active: Visibility.storybook
            windows: [root]
            onCleared: {
                Visibility.storybook = false;
            }
        }

        ColumnLayout {

            spacing: 12

            StyledText {
                Layout.alignment: Qt.AlignHCenter
                text: "Components"
                font.pixelSize: 24
                font.bold: true
                font.underline: true
                bottomPadding: 24
            }

            ColumnLayout {
                StyledText {
                    text: "Icon Button"
                    font.pixelSize: 18
                }
                StyledIconButton {
                    text: Icons.square
                }
            }

            ColumnLayout {
                StyledText {
                    text: "Switch"
                    font.pixelSize: 18
                }

                StyledSwitch {
                    text: "Enable"
                }
            }

            ColumnLayout {
                StyledText {
                    text: "ToolTip"
                    font.pixelSize: 18
                }
                Button {
                    id: toolTipButton
                    text: "Hello world!"
                    StyledToolTip {
                        visible: toolTipButton.hovered
                        text: qsTr("Save the active project")
                    }
                }
            }

            ColumnLayout {
                StyledText {
                    text: "Slider"
                    font.pixelSize: 18
                }
                StyledSlider {
                    id: slider
                    from: 0
                    to: 100
                    value: 50
                }
            }

            ColumnLayout {
                StyledText {
                    text: "Mpris Controller"
                    font.pixelSize: 18
                }
                MprisController {
                    player: Mpris.active ?? null
                }
            }

            ColumnLayout {
                StyledText {
                    text: "Drawer"
                    font.pixelSize: 18
                }
                RowLayout {
                    Button {
                        text: "Top"
                        onClicked: {
                            drawer.x = root.width / 2 - drawer.width / 2;
                            drawer.y = 0;
                            drawer.edge = Qt.TopEdge;
                            drawer.open();
                        }
                    }
                    Button {
                        text: "Left"
                        onClicked: {
                            drawer.y = root.height / 2 - drawer.height / 2;
                            drawer.x = 0;
                            drawer.edge = Qt.LeftEdge;
                            drawer.open();
                        }
                    }
                    Button {
                        text: "Right"
                        onClicked: {
                            drawer.y = root.height / 2 - drawer.height / 2;
                            drawer.x = 0;
                            drawer.edge = Qt.RightEdge;
                            drawer.open();
                        }
                    }
                    Button {
                        text: "Bottom"
                        onClicked: {
                            drawer.x = root.width / 2 - drawer.width / 2;
                            drawer.y = 0;
                            drawer.edge = Qt.BottomEdge;
                            drawer.open();
                        }
                    }
                }
            }
        }
    }

    StyledDrawer {
        id: drawer
        edge: Qt.TopEdge
        width: 400
        height: 200
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Close"
            onClicked: drawer.close()
        }
    }
}
