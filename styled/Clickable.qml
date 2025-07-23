import QtQuick
import "../config/"

MouseArea {
    id: mouseArea

    property bool disabled: false

    hoverEnabled: !disabled
    cursorShape: Qt.PointingHandCursor

    StyledLabel {
        id: background
        anchors.fill: parent
        states: State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges {
                background {
                    color: Theme.palette.primary
                }
            }
        }
        transitions: Transition {
            from: ""
            to: "hovered"
            reversible: true
            ColorAnimation {
                properties: "color"
                duration: 200
                easing.type: Easing.InOutCubic
            }
        }
    }
}
