pragma ComponentBehavior: Bound

import qs.config
import qs.services
import QtQuick
import Qt.labs.folderlistmodel 2.9
import Quickshell.Widgets

ListView {
    id: list

    orientation: ListView.Horizontal

    clip: true
    spacing: 8
    snapMode: ListView.SnapToItem

    implicitWidth: 160 * 3
    implicitHeight: 90
    model: FolderListModel {
        nameFilters: ["*.jpg"]
        folder: `${Paths.home}/Wallpapers`
        showDirs: false
    }
    delegate: Item {
        id: delegate

        required property url fileUrl
        required property int index
        property bool hovered: ListView.isCurrentItem

        implicitWidth: 160
        implicitHeight: 90

        Rectangle {
            color: Styling.theme.base200
            anchors.fill: parent
            radius: 12
            scale: delegate.hovered ? 1.0 : 0.9
            Behavior on scale {
                NumberAnimation {
                    duration: Styling.animations.veryFast
                }
            }

            Image {
                id: image

                asynchronous: true
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: delegate.fileUrl
            }

            MouseArea {
                anchors.fill: image

                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered: list.currentIndex = delegate.index
                onClicked: WallpaperService.currentWallpaper = delegate.fileUrl
            }
        }
    }
}
