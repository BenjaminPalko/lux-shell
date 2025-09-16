pragma Singleton
pragma ComponentBehavior: Bound

import "theme"
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var palette: theme

    property alias themes: cache.themes
    property alias currentTheme: cache.current
    property int currentThemeIndex: themes.indexOf(currentTheme)

    Process {
        running: true
        command: ["bash", "-c", `inotifywait -m -r ~/.config/lux/themes/ -e modify,move,create,delete | while read dir action; do ls -m "$dir"; done`]
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
        path: `${Paths.cache}/theme.json`

        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: cache

            property string current: "dark"
            property list<string> themes: ["dark"]
            onThemesChanged: {
                if (!themes.includes(current)) {
                    current = themes[0];
                }
            }
        }
    }

    FileView {
        path: `${Paths.config}/themes/${root.currentTheme}.json`
        watchChanges: true
        onFileChanged: reload()

        // when changes are made to properties in the adapter, save them
        onAdapterUpdated: writeAdapter()

        Theme {
            id: theme
        }
    }
}
