import QtQuick
import "../config/"

Item {
    id: root
    property bool disabled: false
    property alias hovered: mouseArea.containsMouse
    signal clicked
    signal scrolledUp
    signal scrolledDown

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

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        hoverEnabled: !disabled
        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()

        onWheel: event => {
            if (event.angleDelta.y > 0) {
                root.scrolledUp();
            } else if (event.angleDelta.y < 0) {
                root.scrolledDown();
            }
        }
    }
}
