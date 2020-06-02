#ifndef UTILITAT_H
#define UTILITAT_H

#include <QObject>
#include <QList>
#include <QString>
#include <QJsonObject>
#include <QJsonDocument>
#include "pl.h"
#include "fanal.h"
#include "grup.h"
#include "client.h"
#include "dades.h"

class Utilitat : public QObject
{
    Q_OBJECT
public:
    Utilitat();
    Q_INVOKABLE void crearPl(QString nom, int num);
    Q_INVOKABLE void afegirPos(QString nomF, QString x, QString y);
    Q_INVOKABLE QString getNomF(int i);
    Q_INVOKABLE QString getX(int i);
    Q_INVOKABLE QString getY(int i);
    Q_INVOKABLE QString getNomPl();
    Q_INVOKABLE int getNumPl();
    Q_INVOKABLE QString getAliasF(int i);
    Q_INVOKABLE void crearFanals(QString mac, QString alias);
    Q_INVOKABLE void crearGrup(QString nom);
    Q_INVOKABLE void afegirFanal(QString nomGr, QString nomF);
    Q_INVOKABLE QString getNomG(int t);
    Q_INVOKABLE void esborrarGrEmpty();
    Q_INVOKABLE int getNumG();
    Q_INVOKABLE void grupSeleccionat(QString nomGr);
    Q_INVOKABLE int getNumF();
    Q_INVOKABLE QString getTemaFG(int j);
    Q_INVOKABLE QString getTemaF(int j);
    Q_INVOKABLE void esborrarGr();
    Q_INVOKABLE void desaConnection(QString broker, QString port);
    Q_INVOKABLE void desaConf(QString tema, QString mis);
    Q_INVOKABLE void desaPl();
    Q_INVOKABLE void desaFanals();
    Q_INVOKABLE void desaGrups();
    Q_INVOKABLE void setNomConf(QString nomConfGr);
    Q_INVOKABLE QString getBroker();
    Q_INVOKABLE QString getPort();
    Q_INVOKABLE QString getTema();
    Q_INVOKABLE QString getMis();
    Q_INVOKABLE QString getLlistaPl(int i);
    Q_INVOKABLE QString getLlistaGr(int i);
    Q_INVOKABLE int getNumLlistaPl();
    Q_INVOKABLE QString getLlistaConf(int i);
    Q_INVOKABLE int getNumConf();
    Q_INVOKABLE int getNumLlistaGr();
    Q_INVOKABLE void carregaPl(QString nomPl);
    Q_INVOKABLE void carregaGr(QString nomConf);
public slots:
    void assignaPl();
    void assignaFanals();
    void assignaGrups();
private:
    Dades d;
    Pl pl;
    QList<Fanal> fanals;
    QList<Grup> grups;
    QString grSel;
    QString nomConfGr;
    QString nomConfActual;
};

#endif // UTILITAT_H
