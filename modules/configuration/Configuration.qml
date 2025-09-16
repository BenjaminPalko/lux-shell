import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StyledPanelWindow {
    id: window

    name: "configuration"

    visible: Visibility.configuration
    implicitWidth: 800
    implicitHeight: 400
    background.color: Styling.theme.base200

    onFocusedChanged: {
        Visibility.configuration = focused;
    }

    StyledTabBar {
        id: tabs
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: view.left

        implicitWidth: 150
        orientation: ListView.Vertical

        Repeater {
            model: views.data
            delegate: StyledTabButton {
                id: tabButton
                required property ConfigurationView modelData
                anchors.left: parent.left
                anchors.right: parent.right
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
            }
        }
    }

    SwipeView {
        id: view

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: tabs.right
        anchors.topMargin: 4
        anchors.rightMargin: 4
        anchors.bottomMargin: 4

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
    }

    component ConfigurationView: QtObject {
        property string icon
        property string title
        property Component view
    }
}
