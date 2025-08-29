import qs.components
import qs.constants

StyledIconButton {
    id: root

    text: Icons.bluetooth

    onClicked: popup.toggle()

    BluetoothMenu {
        id: popup

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8
    }
}
