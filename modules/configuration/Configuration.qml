pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 1000
    implicitHeight: 600
    background.color: Styling.theme.base200

    onFocusedChanged: {
        Visibility.configuration = focused;
    }

    RowLayout {

        anchors.fill: parent

        StyledTabBar {
            id: tabs

            Layout.preferredWidth: 150
            Layout.fillHeight: true
            Layout.margins: 2
            orientation: ListView.Vertical
            spacing: 12

            Repeater {
                model: views.data
                delegate: StyledTabButton {
                    id: tabButton
                    required property ConfigurationView modelData
                    anchors.left: parent.left
                    anchors.right: parent.right
                    required property int index

                    contentItem: RowLayout {
                        states: [
                            State {
                                when: tabButton.hovered
                                PropertyChanges {
                                    tabIcon.color: Styling.theme.primarycontent
                                    tabText.color: Styling.theme.primarycontent
                                }
                            }
                        ]
                        LucideIcon {
                            id: tabIcon
                            text: tabButton.modelData.icon
                            font.pixelSize: Styling.typography.textSize.lg
                        }
                        StyledText {
                            id: tabText
                            text: tabButton.modelData.title
                            font.pixelSize: Styling.typography.textSize.lg
                        }
                    }
                    text: tabButton.modelData.title

                    onClicked: tabs.setCurrentIndex(index)
                }
            }
        }

        SwipeView {
            id: view

            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true
            orientation: Qt.Vertical

            currentIndex: tabs.currentIndex

            background: Rectangle {
                color: Styling.theme.base100
                radius: Styling.theme.radiusBox
            }

            Repeater {
                model: views.data
                delegate: ScrollView {
                    id: scrollView
                    required property ConfigurationView modelData
                    padding: 24
                    Loader {
                        anchors.fill: parent
                        active: scrollView.modelData.view
                        sourceComponent: scrollView.modelData.view
                    }
                }
            }
        }
    }

    Item {
        id: views

        ConfigurationView {
            icon: Styling.lucide.icons.audioLines
            title: "Audio"
            view: AudioView {}
        }

        ConfigurationView {
            icon: Styling.lucide.icons.swatchBook
            title: "Styling"
            view: StylingView {}
        }

        ConfigurationView {
            icon: Styling.lucide.icons.swatchBook
            title: "Wallpapers"
            view: Wallpaper {}
        }
    }

    component ConfigurationView: QtObject {
        property string icon
        property string title
        property Component view
    }
}
