import qs.components
import qs.config

StyledIconButton {
    id: root

    text: Styling.lucide.icons.bluetooth

    onClicked: popup.toggle()

    BluetoothMenu {
        id: popup

        anchor.item: root
        anchor.rect.x: root.width / 2 - width / 2
        anchor.rect.y: root.height + 8
    }
}
