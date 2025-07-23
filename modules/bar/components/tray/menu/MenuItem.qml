import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../../../config/"
import "../../../../../styled/"

Clickable {
    id: item
    property QsMenuEntry menuEntry

    implicitWidth: text.width
    implicitHeight: 30

    onClicked: menuEntry.triggered()

    StyledText {
        id: text

        font.pixelSize: Dimensions.clock.fontSize
        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.clock.verticalPadding
        bottomPadding: Dimensions.clock.verticalPadding
        leftPadding: Dimensions.clock.horizontalPadding
        rightPadding: Dimensions.clock.horizontalPadding

        text: item.menuEntry.text
    }
}
