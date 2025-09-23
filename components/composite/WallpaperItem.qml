import QtQuick

Image {
    asynchronous: true
    fillMode: Image.PreserveAspectCrop
    sourceSize.width: parent.width
    sourceSize.height: parent.height

    Behavior on scale {
        NumberAnimation {
            duration: 200
        }
    }
}
