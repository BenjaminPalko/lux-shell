pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property alias running: properties.running
    readonly property alias initialTime: properties.initialTime
    readonly property alias remainingTime: properties.remainingTime
    readonly property alias state: properties.state

    function toggle() {
        properties.running = !properties.running;
    }

    function reset() {
        properties.running = false;
        properties.setTimer();
    }

    Timer {
        id: timer

        interval: 10
        repeat: true
        running: properties.running
        onTriggered: {
            if (properties.remainingTime <= 0) {
              properties.state == "timer" ? properties.setRest() : properties.setTimer();

            }
            properties.remainingTime -= interval;
        }
    }

    PersistentProperties {
        id: properties
        reloadableId: "Pomodoro"

        readonly property int timerAmount: 25 * 60 * 1000
        readonly property int restAmount: 10 * 60 * 1000

        property bool running: false
        property string state: "timer"
        property int initialTime: 0
        property int remainingTime: 0

        function setTimer() {
            properties.state = "timer";
            properties.initialTime = timerAmount;
            properties.remainingTime = timerAmount;
        }

        function setRest() {
            properties.state = "rest";
            properties.initialTime = restAmount;
            properties.remainingTime = restAmount;
        }
    }
}
