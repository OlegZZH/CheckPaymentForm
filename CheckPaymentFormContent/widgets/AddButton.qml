import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: mainWindow.width - 100
    height: 80
    color: "#d8d8d8"
    radius: 16
    border.color: "#4c4c4c"
    border.width: 2
    opacity: mouseArea.containsMouse ? 1 : 0.5

    Text {
        id: plusText
        text: qsTr("+")
        font.pixelSize: 40
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            newItemDialog.fillAndOpen()
        }
    }
}
