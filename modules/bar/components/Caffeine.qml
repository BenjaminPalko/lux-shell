import qs.config
import qs.constants
import qs.services
import qs.widgets

StyledButton {
    id: root

    border.color: Caffeine.enabled ? Theme.palette.secondary : 'transparent'
    border.width: 2

    onClicked: {
        Caffeine.toggle();
    }

    content: StyledText {
        id: text

        font.family: Theme.lucide.font.family
        font.pixelSize: Dimensions.caffeine.fontSize
        font.bold: true
        text: Icons.coffee

        color: root.containsMouse ? Theme.palette.base300 : Theme.palette.basecontent
    }
}
