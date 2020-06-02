#ifndef GRUP_H
#define GRUP_H

#include <QList>
#include "fanal.h"

class Grup
{

public:
    Grup();
    Grup(QString nom);
    QString getNom();
    void setNom(QString nom);
    QList<Fanal> Gfanals;

private:
    QString nom;

};

#endif // GRUP_H
