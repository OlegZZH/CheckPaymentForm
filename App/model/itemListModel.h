#ifndef CHECKPAYMENTFORMAPP_ITEMLISTMODEL_H
#define CHECKPAYMENTFORMAPP_ITEMLISTMODEL_H


#include <QAbstractListModel>


#include "item.h"


class ItemsListModel : public QAbstractListModel {
    Q_OBJECT

public:
    PROPERTY_DEFINITION(totalPrice, double)

    enum ItemsRoles {
        NameRole = Qt::UserRole + 1,
        QuantityRole,
        PriceRole,
    };

    explicit ItemsListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;


    void addItem(const QString &name, int quantity, double price);

    void clear();

private:
    QList<Item *> m_items;

    void recalcTotal();
};


#endif //CHECKPAYMENTFORMAPP_ITEMLISTMODEL_H
