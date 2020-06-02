#include "client.h"

Client::Client(QObject *parent)
    : QMqttClient(parent)
{
}

int Client::publish(const QString &topic, const QString &message, int qos, bool retain)
{
    auto result = QMqttClient::publish(QMqttTopicName(topic), message.toUtf8(), qos, retain);
    return result;
}

Subscripcio* Client::subscribe(const QString &topic)
{
    auto sub = QMqttClient::subscribe(topic);
    auto result = new Subscripcio(sub, this);
    return result;
}

Subscripcio::Subscripcio(QMqttSubscription *s, Client *c)
    : sub(s)
    , client(c)
{
    connect(sub, &QMqttSubscription::messageReceived, this, &Subscripcio::handleMessage);
    m_topic = sub->topic();
}

Subscripcio::~Subscripcio()
{
}

void Subscripcio::handleMessage(const QMqttMessage &qmsg)
{
    emit messageReceived(qmsg.payload());
}
