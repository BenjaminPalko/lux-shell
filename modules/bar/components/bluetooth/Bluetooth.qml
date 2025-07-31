import qs.config
import qs.constants
import qs.widgets

StyledButton {
    id: root

    onClicked: popup.toggle()

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.bluetooth.fontSize
        font.bold: true
        text: Icons.bluetooth

        color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
    }

    BluetoothMenu {
        id: popup

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8
    }
}
