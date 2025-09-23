import qs.services
import QtQuick
import QtQuick.Controls

StackView {
    id: stack
    property url wallpaper: WallpaperService.currentWallpaper

    anchors.fill: parent

    replaceEnter: Transition {
        OpacityAnimator {
            from: 0.0
            to: 1.0
            duration: 1000
        }
    }
    replaceExit: Transition {
        PauseAnimation {
            duration: 1100
        }
    }

    Component {
        id: img
        Image {}
    }

    onWallpaperChanged: stack.replace(img, {
        "source": stack.wallpaper
    })
}
