pragma Singleton

import qs.utils
import Quickshell
import QtQuick

FuzzySearch {
    list: DesktopEntries.applications.values.filter(a => !a.noDisplay).sort((a, b) => a.name.localeCompare(b.name))

    function launch(entry: DesktopEntry): void {
        if (entry.runInTerminal)
            Quickshell.execDetached({
                command: ["kitty", "exec", ...entry.command],
                workingDirectory: entry.workingDirectory
            });
        else
            Quickshell.execDetached({
                command: [...entry.command],
                workingDirectory: entry.workingDirectory
            });
    }
}
