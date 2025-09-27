import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 300
    height: 300
    implicitWidth: 300
    implicitHeight: 300
    radius: 20
    border.width: 3

    BusyIndicator {
        id: busyIndicator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 20
        anchors.bottomMargin: 60
    }

    Text {
        id: text1
        text: qsTr("Please wait...")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
