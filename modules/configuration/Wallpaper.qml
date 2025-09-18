import qs.services
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    Repeater {
        model: WallpaperService.files
        delegate: Text {
            required property string dataModel
            text: dataModel
        }
    }
}
