import qs.components
import qs.config
import qs.constants
import qs.services

StyledIconButton {
    id: root

    border.color: Caffeine.enabled ? Theme.palette.secondary : root.hovered ? Theme.palette.primary : Theme.palette.base100
    text: Icons.coffee

    onClicked: {
        Caffeine.toggle();
    }
}
