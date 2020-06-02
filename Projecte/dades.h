#ifndef DADES_H
#define DADES_H

#include <QJsonObject>
#include <QJsonDocument>
#include <QMqttClient>
#include "pl.h"
#include "fanal.h"
#include "grup.h"

class Dades: public QObject
{
    Q_OBJECT
public:
    Dades();
    void desaConnection(QString broker, QString port);
    void desaConf(QString tema, QString mis);
    void desaPl(QString nomPl, int numPl);
    void desaPosicio(QString nomPos, QString posX, QString posY, QString nomPl);
    void desaFanal(QString alias, QString tema, QString mac, QString nomPl);
    void desaGrup(QString nomConf, QString nomGr, QString alias, QString nomPl);
    void carregaCon(QString missatge);
    void carregaConfF(QString missatge);
    void carregaLlistaPl(QString missatge);
    void carregaLlistaConf(QString missatge);
    void carregaLlistaGr(QString missatge);
    void carregaPl(QString missatge);
    void carregaPosicio(QString missatge);
    void carregaFanal(QString missatge);
    void carregaConf(QString missatge);
    void carregaGr(QString missatge);
    void carregaGrup(QString missatge);
    void gestio(const QString missatge, const QMqttTopicName topic);
    void clearLlistaPl();
    void refreshLlistaGrups();
    void refreshLlistaConf();
    QString getBroker();
    QString getPort();
    QString getTema();
    QString getMis();
    QList<QString> getLlistaPl();
    QList<QString> getLlistaGr();
    QList<QString> getLlistaConf();
    Pl getPl();
    QList<Fanal> getFanals();
    QList<Grup> getGrups();
    QMqttClient c;
signals:
    void plCompleta();
    void fanalsComplets();
    void grupsComplets();
private:
    QString broker;
    QString port;
    QString tema;
    QString mis;
    QList<QString> llistaPl;
    QList<QString> llistaGr;
    QList<QString> llistaConf;
    Pl pl;
    QList<Fanal> fanals;
    QList<Grup> grups;
};

#endif // DADES_H
