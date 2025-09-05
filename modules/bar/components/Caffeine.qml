import qs.components
import qs.config
import qs.services

StyledIconButton {
    id: root

    border.width: 2
    border.color: Caffeine.enabled ? Styling.theme.secondary : root.hovered ? Styling.theme.primary : Styling.theme.base300
    text: Styling.lucide.icons.coffee

    onClicked: {
        Caffeine.toggle();
    }
}
