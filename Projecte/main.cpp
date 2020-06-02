#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "utilitat.h"
#include "client.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Utilitat>("Utilitat.backend",1,0,"Utilitat");
    qmlRegisterType<Client>("Client.backend", 1, 0, "Client");
    qmlRegisterUncreatableType<Subscripcio>("Client.backend", 1, 0, "Subscripcio", QLatin1String("Subscripció només lectura"));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
