pragma Singleton

import QtQuick
import Qt.labs.folderlistmodel 2.9
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias themes: cache.themes
    property alias currentTheme: cache.current
    property int currentThemeIndex: themes.indexOf(currentTheme)

    FolderListModel {
        id: model
        nameFilters: ["*.json"]
        folder: `${Paths.config}/themes/`
        showDirs: false
        onCountChanged: {
            const arr = [];
            for (let i = 0; i < count; i++) {
                arr.push(get(i, "fileName").replace(".json", ""));
            }
            root.themes = arr;
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
}
