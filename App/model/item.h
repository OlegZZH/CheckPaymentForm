#ifndef CHECKPAYMENTFORMAPP_ITEM_H
#define CHECKPAYMENTFORMAPP_ITEM_H
#include <QObject>

#include "App/controller/macros.h"


class Item : public QObject {
    Q_OBJECT

public:
    explicit Item(QObject *parent = nullptr);

    PROPERTY_DEFINITION(name, QString)

    PROPERTY_DEFINITION(quantity, int)

    PROPERTY_DEFINITION(price, double)
};


#endif //CHECKPAYMENTFORMAPP_ITEM_H
