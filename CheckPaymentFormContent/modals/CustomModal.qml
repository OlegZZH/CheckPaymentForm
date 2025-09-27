import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Popup {
    id: customModal
    x: (mainWindow.width - width) / 2
    y: (mainWindow.height - height) / 2
    modal: true
    padding: 0
    closePolicy: Popup.NoAutoClose
    background: Rectangle {
        color: "#00ffffff"
        border.width: 0
    }
}
