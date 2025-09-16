import qs.components
import qs.components.composite
import qs.config
import qs.config
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GridLayout {
    flow: GridLayout.TopToBottom
    columns: 2
    rows: 10

    ColumnLayout {
        StyledText {
            text: "ToolTip"
            font.pixelSize: 18
        }
        StyledPane {
            Button {
                id: toolTipButton
                text: "Hello world!"
                StyledToolTip {
                    visible: toolTipButton.hovered
                    text: qsTr("Save the active project")
                }
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "ProgressBar"
            font.pixelSize: 18
        }
        StyledPane {
            StyledProgressBar {
                id: progressBar
                indeterminate: true
                implicitHeight: 10
                from: 0
                to: 100
                value: 50
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "ListView"
            font.pixelSize: 18
        }
        StyledPane {
            StyledWrapperRectangle {
                border.color: Styling.theme.base100
                border.width: 2
                StyledListView {
                    implicitWidth: 200
                    implicitHeight: 100
                    model: 10
                    delegate: StyledText {
                        text: "Hello world!"
                    }
                }
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "Mpris Player Selector"
            font.pixelSize: 18
        }
        StyledPane {
            MprisPlayerSelector {}
        }
    }

    ColumnLayout {
        StyledText {
            text: "Mpris Controller"
            font.pixelSize: 18
        }
        StyledPane {
            MprisController {
                player: Mpris.active ?? null
            }
        }
    }

    ColumnLayout {
        StyledText {
            text: "Drawer"
            font.pixelSize: 18
        }
        StyledPane {
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
