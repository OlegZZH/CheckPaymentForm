#include "itemListModel.h"

ItemsListModel::ItemsListModel(QObject *parent) : QAbstractListModel(parent), totalPrice(0) {
}

PROPERTY_IMPLEMENTATION(ItemsListModel, totalPrice, double)

int ItemsListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_items.size();
}

QVariant ItemsListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() < 0 || index.row() >= m_items.size())
        return {};

    Item *file = m_items[index.row()];
    switch (role) {
        case NameRole: return file->name;
        case QuantityRole: return file->quantity;
        case PriceRole: return file->price;
        default: return {};
    }
}

QHash<int, QByteArray> ItemsListModel::roleNames() const {
    return {
        {NameRole, "itemName"},
        {QuantityRole, "itemQuantity"},
        {PriceRole, "itemPrice"}
    };
}

void ItemsListModel::addItem(const QString &name, int quantity, double price) {
    beginInsertRows(QModelIndex(), 0, 0);
    auto newItem = new Item;
    newItem->set_name(name);
    newItem->set_quantity(quantity);
    newItem->set_price(price);
    m_items.prepend(newItem);
    endInsertRows();
    recalcTotal();
}

void ItemsListModel::clear() {
    beginResetModel();
    // for (Item *item: m_items) {
    //     if (item)
    //         item->deleteLater();
    // }
    m_items.clear();
    set_totalPrice(0);
    endResetModel();
}

void ItemsListModel::recalcTotal() {
    double sum = 0;
    for (auto *item: m_items)
        sum += item->quantity * item->price;
    set_totalPrice(sum);
}
