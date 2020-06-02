#include "pl.h"

Pl::Pl()
{
    pos.clear();
}

QString Pl::getNom(){
    return nom;
}

int Pl::getNum(){
    return num;
}

void Pl::setNom(QString &nom){
    this->nom=nom;
}

void Pl::setNum(int num){
    this->num=num;
}
