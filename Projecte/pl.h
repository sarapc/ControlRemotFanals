#ifndef PL_H
#define PL_H

#include <QString>
#include <QList>
#include "posiciofanal.h"

class Pl
{
public:
    Pl();
    QString getNom();
    int getNum();
    void setNom(QString &nom);
    void setNum(int num);
    QList<PosicioFanal> pos;

private:
    QString nom;
    int num;
};

#endif // PL_H
