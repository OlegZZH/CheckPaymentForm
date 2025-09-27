#include "model.h"

Model::Model(QObject *parent) : QObject(parent), itemsListModel(new ItemsListModel) {
}

PROPERTY_IMPLEMENTATION(Model, itemsListModel, ItemsListModel*)
