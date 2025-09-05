pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var lucide: FontLoader {
        source: "../assets/lucide.woff"
    }
    property string fontFamily: "JetBrainsMono Nerd Font"
    property var palette: theme.palette

    property list<string> themes: []
    onThemesChanged: {
        if (!themes.includes(currentTheme)) {
            currentTheme = "dark";
        }
    }
    property string currentTheme: "dark"

    Process {
        running: true
        command: ["bash", "-c", `inotifywait -m -r ~/.config/lux -e modify,move,create,delete | while read dir action; do ls -m "$dir"; done`]
        stderr: StdioCollector {
            onStreamFinished: console.log(`line read: ${this.text}`)
        }
        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                const themes = data.split(", ").filter(item => item.endsWith(".json")).map(item => item.replace(".json", ""));
                if (themes.length == 0) {
                    return;
                }
                root.themes = themes;
            }
        }
    }

    FileView {
        id: jsonFile
        path: `${Paths.config}/themes/${root.currentTheme}.json`
        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: theme

            property JsonObject palette: JsonObject {
                property color primary: "#605dff"
                property color primarycontent: "#edf1fe"
                property color secondary: "#f43098"
                property color secondarycontent: "#f9e4f0"
                property color accent: "#00d3bb"
                property color accentcontent: "#084d49"
                property color neutral: "#09090b"
                property color neutralcontent: "#e4e4e7"
                property color base100: "#1d232a"
                property color base200: "#191e24"
                property color base300: "#15191e"
                property color basecontent: "#ecf9ff"
                property color info: "#00bafe"
                property color infocontent: "#042e49"
                property color success: "#00d390"
                property color successcontent: "#004c39"
                property color warning: "#fcb700"
                property color warningcontent: "#793205"
                property color error: "#ff627d"
                property color errorcontent: "#4d0218"
            }
        }
    }
}
