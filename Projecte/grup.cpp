#include "grup.h"

Grup::Grup()
{
    Gfanals = QList<Fanal>();
}

Grup::Grup(QString nom)
{
    this->nom=nom;
    Gfanals = QList<Fanal>();
}

QString Grup::getNom(){
    return nom;
}

void Grup::setNom(QString nom){
    this->nom=nom;
}
