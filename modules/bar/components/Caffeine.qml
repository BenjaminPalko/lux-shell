import qs.components
import qs.config
import qs.services

StyledIconButton {
    id: root

    border.width: 2
    border.color: Caffeine.enabled ? Theme.palette.secondary : root.hovered ? Theme.palette.primary : Theme.palette.base300
    text: Styling.lucide.icons.coffee

    onClicked: {
        Caffeine.toggle();
    }
}
