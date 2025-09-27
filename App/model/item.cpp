#include "item.h"

Item::Item(QObject *parent) : QObject(parent), name(""), quantity(0), price(0) {
}

PROPERTY_IMPLEMENTATION(Item, name, QString)
PROPERTY_IMPLEMENTATION(Item, quantity, int)
PROPERTY_IMPLEMENTATION(Item, price, double)
