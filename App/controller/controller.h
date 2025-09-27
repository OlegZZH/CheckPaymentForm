#ifndef CHECKPAYMENTFORMAPP_CONTROLLER_H
#define CHECKPAYMENTFORMAPP_CONTROLLER_H
#include <qobject.h>

#include "App/model/itemListModel.h"
#include "App/model/model.h"


class Controller : public QObject {
    Q_OBJECT

public:
    explicit Controller(Model *model = nullptr,QObject *parent = nullptr );

public slots:
    void addItem(const QString &name, int quantity, double price);

    void printCheck();
    void clearList();

private:
    Model *m_model;
};


#endif //CHECKPAYMENTFORMAPP_CONTROLLER_H
