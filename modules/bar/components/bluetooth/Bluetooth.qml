import qs.config
import qs.constants
import qs.styled

Clickable {
    id: root

    implicitWidth: text.width
    implicitHeight: Dimensions.bluetooth.height

    onClicked: {
        popup.opened = !popup.opened;
    }

    StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.bluetooth.fontSize
        font.bold: true
        text: Icons.bluetooth

        color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent

        anchors.verticalCenter: parent.verticalCenter
        topPadding: Dimensions.bluetooth.verticalPadding
        bottomPadding: Dimensions.bluetooth.verticalPadding
        leftPadding: Dimensions.bluetooth.horizontalPadding
        rightPadding: Dimensions.bluetooth.horizontalPadding
    }

    BluetoothMenu {
        id: popup

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8
    }
}
