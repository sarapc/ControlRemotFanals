#ifndef POSICIOFANAL_H
#define POSICIOFANAL_H

#include <QString>

class PosicioFanal
{
public:
    PosicioFanal(QString nomF, QString x, QString y);
    void setNomF(QString nomF);
    void setX(QString x);
    void setY(QString y);
    QString getNomF();
    QString getX();
    QString getY();
private:
    QString nomF;
    QString x;
    QString y;
};

#endif // POSICIOFANAL_H
