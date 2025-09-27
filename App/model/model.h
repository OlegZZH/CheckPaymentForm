#ifndef CHECKPAYMENTFORMAPP_MODEL_H
#define CHECKPAYMENTFORMAPP_MODEL_H
#include <QObject>

#include "itemListModel.h"
#include "App/controller/macros.h"


class Model : public QObject {
    Q_OBJECT

public:
    explicit Model(QObject *parent = nullptr);

    PROPERTY_DEFINITION(itemsListModel, ItemsListModel*)

};


#endif //CHECKPAYMENTFORMAPP_MODEL_H