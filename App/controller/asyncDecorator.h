#ifndef ASYNCDECORATOR_H
#define ASYNCDECORATOR_H

#include "taskResult.h"
#include <QtConcurrent/QtConcurrentRun>

#include "controller.h"


class AsyncDecorator : public Controller {
    Q_OBJECT

public:
    explicit AsyncDecorator(Model *model) : Controller(model) {
    };

public slots:

    TaskResult *addItem(const QString& name, int quantity, double price) {
    auto result = new TaskResult();
    auto future = QtConcurrent::run([this, result,name,quantity,price]() {
        Controller::addItem(name, quantity, price);
        result->set_status(true);
    });
    return result;
}
    TaskResult *printCheck() {
        auto result = new TaskResult();
        auto future = QtConcurrent::run([this, result]() {
            Controller::printCheck();
            result->set_status(true);
        });
        return result;
    }
};


#endif //ASYNCDECORATOR_H
