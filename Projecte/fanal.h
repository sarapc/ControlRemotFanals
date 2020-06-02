#ifndef FANAL_H
#define FANAL_H

#include <QString>

class Fanal
{

public:
    Fanal();
    Fanal (QString &szMac, QString &szTema, QString &szAlias);
    QString getMac();
    QString getTema();
    QString getAlias();
    void setMac(QString &szMac);
    void setTema(QString &szTema);
    void setAlias(QString &szAlias);
private:
    QString mac, tema, alias;
};

#endif // FANAL_H
