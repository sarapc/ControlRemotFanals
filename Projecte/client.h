#ifndef CLIENTPUBLICA_H
#define CLIENTPUBLICA_H

#include <QtCore/QMap>
#include <QMqttClient>
#include <QMqttSubscription>
#include <QSslConfiguration>
#include <QMqttTopicName>

class Client;

class Subscripcio : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QMqttTopicFilter topic MEMBER m_topic NOTIFY topicChanged)
public:
    Subscripcio(QMqttSubscription *s, Client *c);
    ~Subscripcio();

Q_SIGNALS:
    void topicChanged(QString);
    void messageReceived(const QString &msg);

public slots:
    void handleMessage(const QMqttMessage &qmsg);

private:
    Q_DISABLE_COPY(Subscripcio)
    QMqttSubscription *sub;
    Client *client;
    QMqttTopicFilter m_topic;
};

class Client: public QMqttClient
{
    Q_OBJECT
public:
    Client(QObject *parent = nullptr);

    Q_INVOKABLE int publish(const QString &topic, const QString &message, int qos = 0, bool retain = false);
    Q_INVOKABLE Subscripcio *subscribe(const QString &topic);
//private:
   // Q_DISABLE_COPY(Client)
};

#endif // CLIENTPUBLICA_H
