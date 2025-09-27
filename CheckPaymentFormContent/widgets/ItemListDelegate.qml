import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 720 - 100
    height: 80
    color: "#d8d8d8"
    radius: 16
    border.color: "#4c4c4c"
    border.width: 2
    property alias itemNumberText: itemNumber.text
    property alias itemPriceText: itemPrice.text
    property alias itemNameText: itemName.text

    Text {
        id: itemName
        text: qsTr("Text")
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 45
        font.pixelSize: 20
    }

    Text {
        id: itemPrice
        text: qsTr("Text")
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 45
        font.pixelSize: 18
    }

    Text {
        id: itemNumber
        text: qsTr("Text")
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 180
        font.pixelSize: 14
    }
}
