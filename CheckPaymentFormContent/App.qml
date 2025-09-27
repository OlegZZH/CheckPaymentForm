import QtQuick
import CheckPaymentForm
import "widgets"
import "modals"
import QtQuick.Controls 6.8

Window {
    id: mainWindow
    width: Constants.width
    height: Constants.height

    visible: true
    title: "CheckPaymentForm"

    Text {
        id: productName
        text: qsTr("Name")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 90
        anchors.topMargin: 80
        font.pixelSize: 24
    }

    Text {
        id: quantity
        text: qsTr("Quantity")
        anchors.right: price.left
        anchors.top: parent.top
        anchors.rightMargin: 50
        anchors.topMargin: 80
        font.pixelSize: 24
    }

    Text {
        id: price
        text: qsTr("Price")
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 90
        anchors.topMargin: 80
        font.pixelSize: 24
    }

    Rectangle {
        id: rectangle
        height: 2
        color: "#767676"
        radius: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: productName.bottom
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        anchors.topMargin: 20
    }

    AddButton {
        id: addButton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectangle.bottom
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        anchors.topMargin: 20
    }

    ListView {
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: addButton.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        anchors.topMargin: 10
        anchors.bottomMargin: 200
        spacing: 10

        model: appModel.itemsListModel
        delegate: ItemListDelegate {

            itemNameText: itemName
            itemNumberText: itemQuantity
            itemPriceText: itemPrice
        }
    }

    Text {
        id: totalText
        text: qsTr("Total:") + appModel.itemsListModel.totalPrice
        anchors.left: parent.horizontalCenter
        anchors.top: listView.bottom
        anchors.leftMargin: 150
        anchors.topMargin: 20
        font.pixelSize: 30
    }

    Button {
        id: button
        text: qsTr("Print")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: totalText.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        font.pointSize: 30
        enabled: listView.count !== 0
        onClicked: {
            waitDialog.fillAndOpen()
            let taskResult = appController.printCheck()
            taskResult.statusChanged.connect(function (status) {
                if (status) {
                    waitDialog.close()
                    appController.clearList()
                }
            })
        }
    }
    CustomModal {
        id: newItemDialog
        contentItem: NewItemModal {
            id: newItemContent
        }
        function fillAndOpen() {
            newItemDialog.open()
        }
    }
    CustomModal {
        id: waitDialog
        contentItem: WaitModal {
            id: waitContent
        }
        function fillAndOpen() {
            waitDialog.open()
        }
    }
}
