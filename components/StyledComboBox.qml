pragma ComponentBehavior: Bound

import qs.config
import QtQuick
import QtQuick.Controls

ComboBox {
    id: control

    palette.button: Styling.theme.base200
    palette.buttonText: Styling.theme.basecontent
    palette.highlight: Styling.theme.primary
    palette.highlightedText: Styling.theme.primarycontent
    palette.text: Styling.theme.basecontent
    palette.window: Styling.theme.base200

    implicitHeight: 40

    delegate: ItemDelegate {
        id: delegate

        required property var model
        required property int index

        width: control.width
        contentItem: StyledText {
            text: delegate.model[control.textRole]
            color: delegate.highlighted ? palette.highlightedText : palette.buttonText
            Behavior on color {
                ColorAnimation {
                    duration: Styling.animations.speed.fast
                }
            }
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
            color: delegate.highlighted ? palette.highlight : palette.button
            Behavior on color {
                ColorAnimation {
                    duration: Styling.animations.speed.fast
                }
            }
            radius: Styling.theme.radiusSelector
        }
        highlighted: control.highlightedIndex === index
    }

    contentItem: StyledText {
        leftPadding: 12

        text: control.displayText
        color: control.hovered || control.down ? palette.highlightedText : palette.buttonText
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: control.hovered || control.down ? palette.highlight : palette.button
        Behavior on color {
            ColorAnimation {
                duration: Styling.animations.speed.fast
            }
        }
        border.color: Styling.theme.base100
        border.width: control.visualFocus ? 2 : 1
        radius: Styling.theme.radiusSelector
    }

    popup: Popup {
        palette: control.palette
        y: control.height - 1
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight + 2
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            color: palette.window
            Behavior on color {
                ColorAnimation {
                    duration: Styling.animations.speed.fast
                }
            }
            bottomLeftRadius: Styling.theme.radiusField
            bottomRightRadius: Styling.theme.radiusField
        }
    }
}
