#include "posiciofanal.h"

PosicioFanal::PosicioFanal(QString nomF, QString x, QString y)
{
    this->nomF=nomF;
    this->x=x;
    this->y=y;
}

QString PosicioFanal::getNomF(){
    return nomF;
}

QString PosicioFanal::getX(){
    return x;
}

QString PosicioFanal::getY(){
    return y;
}

void PosicioFanal::setNomF(QString nomF){
    this->nomF=nomF;
}

void PosicioFanal::setX(QString x){
    this->x=x;
}

void PosicioFanal::setY(QString y){
    this->y=y;
}
