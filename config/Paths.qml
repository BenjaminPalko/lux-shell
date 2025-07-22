import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property url cache: `${StandardPaths.standardLocations(StandardPaths.GenericCacheLocation)[0]}/lux`
    readonly property url config: `${StandardPaths.standardLocations(StandardPaths.GenericConfigLocation)[0]}/quickshell`
    readonly property url data: `${StandardPaths.standardLocations(StandardPaths.GenericDataLocation)[0]}/lux`
    readonly property url home: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]
    readonly property url state: `${StandardPaths.standardLocations(StandardPaths.GenericStateLocation)[0]}/lux`
    readonly property url wallpapers: `${StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]}/Wallpapers`
}
