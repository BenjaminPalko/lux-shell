import Quickshell.Io
import QtQuick
import "root:styled"
import "../../../config/"

Item {
    id: clock

    implicitWidth: Dimensions.clock.width
    implicitHeight: Dimensions.clock.height

    StyledLabel {
      anchors.fill: text
    }

    StyledText {
        id: text
        anchors.centerIn: parent

        font.pixelSize: Dimensions.clock.fontSize

        Process {
            id: dateProc

            command: ["date"]
            running: true

            stdout: StdioCollector {
                onStreamFinished: text.text = ` ${this.text}`
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
        }
    }
}
