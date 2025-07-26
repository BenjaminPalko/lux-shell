import "../../../config/"
import "../../../constants/"
import "../../../styled/"

Clickable {
    id: clickable

    implicitWidth: text.width
    implicitHeight: Dimensions.bluetooth.height

    onClicked: {}

    StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.bluetooth.fontSize
        font.bold: true
        text: Icons.bluetooth

        color: clickable.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.bluetooth.verticalPadding
        bottomPadding: Dimensions.bluetooth.verticalPadding
        leftPadding: Dimensions.bluetooth.horizontalPadding
        rightPadding: Dimensions.bluetooth.horizontalPadding
    }
}
