// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqmlcontext.h>

#include "autogen/environment.h"
#include "controller/asyncDecorator.h"
#include "model/itemListModel.h"

int main(int argc, char *argv[])
{
    set_qt_environment();
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Model model;
    AsyncDecorator controller (&model);
    const QUrl url(mainQmlFile);

    engine.rootContext()->setContextProperty("appModel", &model);
    engine.rootContext()->setContextProperty("appController", &controller);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
