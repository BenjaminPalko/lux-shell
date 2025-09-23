pragma ComponentBehavior: Bound

import qs.components
import qs.components.composite
import qs.config
import qs.services
import QtQuick
import QtQuick.Layouts
import Qt.labs.folderlistmodel 2.9
import Quickshell.Widgets

ColumnLayout {
    StyledPane {
        GridLayout {

            columnSpacing: Styling.layout.spacing.xl

            StyledText {
                text: "Theme"
                font.pixelSize: Styling.typography.textSize.lg
            }

            ThemeComboBox {}
        }
    }
    // StyledPane {
    //     WallpaperList {}
    // }

    StyledPane {
        padding: 2
        ClippingWrapperRectangle {

            radius: Styling.theme.radiusBox
            color: "transparent"

            WallpaperList {}
        }
    }
}
