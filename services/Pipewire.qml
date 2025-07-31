pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource

    readonly property bool muted: sink?.audio?.muted ?? false
    readonly property real volume: sink?.audio?.volume ?? 0

    function setVolume(volume: real): void {
        if (sink?.ready && sink?.audio) {
            sink.audio.muted = false;
            sink.audio.volume = volume;
        }
    }

    function incrementVolume() {
        if (!sink?.ready || !sink?.audio) {
            return;
        }
        sink.audio.muted = false;
        sink.audio.volume = Math.min(sink.audio.volume + 0.02, 1.0);
    }

    function decrementVolume() {
        if (!sink?.ready || !sink?.audio) {
            return;
        }
        sink.audio.volume -= 0.02;
    }

    function toggleMute() {
        if (!sink?.ready || !sink?.audio) {
            return;
        }
        sink.audio.muted = !sink.audio.muted;
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
