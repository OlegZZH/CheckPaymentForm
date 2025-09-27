#include "controller.h"
#include "QThread"

Controller::Controller(Model *model, QObject *parent) : QObject(parent), m_model(model) {
}

void Controller::addItem(const QString &name, int quantity, double price) {
    qDebug() << "addItem" << name << ":" << quantity << ":" << price;
    m_model->itemsListModel->addItem(name, quantity, price);
}

void Controller::printCheck() {
    qDebug() << "printCheck started";
    QThread::sleep(2);
    qDebug() << "printCheck finished";

}

void Controller::clearList() {
    qDebug() << "Clear List Model";
    m_model->itemsListModel->clear();
}

