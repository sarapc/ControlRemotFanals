#include "fanal.h"

Fanal::Fanal(){};

Fanal::Fanal(QString &szMac, QString &szTema, QString &szAlias)
{
    mac=szMac;
    tema=szTema;
    alias=szAlias;
}

QString Fanal::getMac(){
    return mac;
}

void Fanal::setMac(QString &szMac){
    mac=szMac;
}

QString Fanal::getTema(){
    return tema;
}

void Fanal::setTema(QString &szTema){
    tema=szTema;
}

QString Fanal::getAlias(){
    return alias;
}

void Fanal::setAlias(QString &szAlias){
    alias=szAlias;
}
