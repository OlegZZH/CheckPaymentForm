import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 640
    height: 480
    radius: 20
    border.width: 3
    implicitWidth: 640
    implicitHeight: 480

    Button {
        id: addButton
        y: 375
        text: qsTr("Add")
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.leftMargin: 19
        anchors.rightMargin: 11
        anchors.bottomMargin: 65
        enabled: priceField.length && itemNameField.length
        onClicked: {
            appController.addItem(itemNameField.text, quantitySpinBox.value, priceField.text)
            newItemDialog.close()
        }
    }

    Button {
        id: closeButton
        text: qsTr("Close")
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 20
        anchors.bottomMargin: 65
        onClicked: {
            newItemDialog.close()
        }
    }

    Text {
        id: itemName
        text: qsTr("Item Name")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 60
        anchors.topMargin: 60
        font.pixelSize: 20
        color: itemNameField.length == 0 ? "#ff0000" : "#000000"
    }

    TextField {
        id: itemNameField
        anchors.left: parent.left
        anchors.top: itemName.bottom
        anchors.leftMargin: 60
        anchors.topMargin: 10
        placeholderText: qsTr("Name")
    }

    Text {
        id: quantity
        text: qsTr("Quantity")
        anchors.left: parent.left
        anchors.top: itemNameField.bottom
        anchors.leftMargin: 60
        anchors.topMargin: 25
        font.pixelSize: 20
    }

    SpinBox {
        id: quantitySpinBox
        anchors.left: parent.left
        anchors.top: quantity.bottom
        anchors.leftMargin: 60
        anchors.topMargin: 10
        to: 1000
        from: 1
    }

    Text {
        id: price
        x: 60
        text: qsTr("Price")
        anchors.top: quantitySpinBox.bottom
        anchors.topMargin: 25
        font.pixelSize: 20
        color: priceField.length == 0 ? "#ff0000" : "#000000"
    }

    TextField {
        id: priceField
        text: "1"
        anchors.left: parent.left
        anchors.top: price.bottom
        anchors.leftMargin: 60
        anchors.topMargin: 10
        placeholderText: qsTr("Price")
        validator: RegularExpressionValidator {
            regularExpression: /^[0-9]+([.,][0-9]{1,2})?$/
        }

        onAccepted: {
            text = text.replace(",", ".")
        }
    }

    Text {
        id: text4
        text: qsTr("Total:") + (quantitySpinBox.value * priceField.text).toFixed(2)
        anchors.top: priceField.bottom
        anchors.topMargin: 0
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: closeButton.horizontalCenter
    }
    onVisibleChanged: {
        itemNameField.text = ""
        quantitySpinBox.value = 1
        priceField.text = 1
    }
}
