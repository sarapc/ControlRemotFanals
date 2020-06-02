#include "utilitat.h"

Utilitat::Utilitat()
{
    pl = Pl();
    connect(&d, SIGNAL(plCompleta()), this, SLOT(assignaPl()));
    connect(&d, SIGNAL(fanalsComplets()), this, SLOT(assignaFanals()));
    connect(&d, SIGNAL(grupsComplets()), this, SLOT(assignaGrups()));
}

void Utilitat::crearPl(QString nom, int num){
    pl = Pl();
    fanals.clear();
    pl.setNom(nom);
    pl.setNum(num);
}

void Utilitat::afegirPos(QString nomF, QString x, QString y){
   PosicioFanal pf = PosicioFanal(nomF, x, y);
   pl.pos.append(pf);
}

QString Utilitat::getNomF(int i){
    PosicioFanal pf = pl.pos.at(i);
    return pf.getNomF();
}

QString Utilitat::getX(int i){
    PosicioFanal pf = pl.pos.at(i);
    return pf.getX();
}

QString Utilitat::getY(int i){
    PosicioFanal pf = pl.pos.at(i);
    return pf.getY();
}

QString Utilitat::getNomPl(){
    return pl.getNom();
}

int Utilitat::getNumPl(){
    return pl.getNum();
}

QString Utilitat::getAliasF(int i){
    Fanal f = fanals.at(i);

    return f.getAlias();
}

void Utilitat::crearFanals(QString mac, QString alias){
    QString tema = QString("/").append(mac);
    Fanal f(mac, tema, alias);
    fanals.append(f);
}

void Utilitat::crearGrup(QString nom){
    Grup gr = Grup(nom);
    grups.append(gr);
}

void Utilitat::afegirFanal(QString nomGr, QString nomF){
    for(int i = 0; i<fanals.count(); i++){
        if(fanals[i].getAlias()==nomF){
            for(int j=0; j<grups.count(); j++){
                if(grups[j].getNom()==nomGr){
                    grups[j].Gfanals.append(fanals[i]);
                }
            }
        }
    }
}

QString Utilitat::getNomG(int i){
    Grup g = grups.at(i);
    return g.getNom();
}

void Utilitat::esborrarGrEmpty(){
    QList<int> index;
    for(int i = 0; i<grups.count(); i++){
        if(grups[i].Gfanals.isEmpty()){
            index.append(i);
        }
    }
    for(int i = index.count() -1 ; i>=0; i--){
        grups.removeAt(index[i]);
    }
}

int Utilitat::getNumG(){
    return grups.count();
}

void Utilitat::grupSeleccionat(QString nomGr){
    //d.refreshLlistaGrups();
    grSel = nomGr;
    //carregaGrup(nomConfActual);
}

int Utilitat::getNumF(){
    for(int i = 0; i<grups.count(); i++){
        Grup gr = grups.at(i);
        if(gr.getNom()==grSel){
            return gr.Gfanals.count();
        }
    }
    return 0;
}

QString Utilitat::getTemaFG(int j){
    Grup gr;
    for(int i = 0; i<grups.size(); i++){
        gr = grups.at(i);
        QString nomGr = gr.getNom();
        if(nomGr==grSel){
            QList<Fanal> llistaF = gr.Gfanals;
            Fanal f = llistaF.at(j);
            QString temaF = f.getTema();
            return temaF;
        }
    }
    return "";
}

QString Utilitat::getTemaF(int j){
    Fanal f = fanals.at(j);
    return f.getTema();
}

void Utilitat::esborrarGr(){
    grups.clear();
}

void Utilitat::desaConnection(QString broker, QString port){
    d.desaConnection(broker,port);
}

void Utilitat::desaConf(QString tema, QString mis){
    d.desaConf(tema,mis);
}

void Utilitat::desaPl(){
    d.desaPl(pl.getNom(), pl.getNum());
    for(int i = 0; i< pl.pos.count(); i++){
        d.desaPosicio(pl.pos[i].getNomF(),pl.pos[i].getX(),pl.pos[i].getY(), pl.getNom());
    }
}

void Utilitat::desaFanals(){
    for(int i = 0; i<fanals.count(); i++){
        d.desaFanal(fanals[i].getAlias(), fanals[i].getTema(), fanals[i].getMac(),pl.getNom());
    }
}

void Utilitat::desaGrups(){
    for(int i = 0; i<grups.count(); i++){
        for(int j = 0; j<grups[i].Gfanals.count(); j++){
            d.desaGrup(nomConfGr, grups[i].getNom(), grups[i].Gfanals[j].getAlias(), pl.getNom());
        }
    }
}

void Utilitat::setNomConf(QString nomConfGr){
    this->nomConfGr = nomConfGr;
}

QString Utilitat::getBroker(){
    return d.getBroker();
}

QString Utilitat::getPort(){
    return d.getPort();
}

QString Utilitat::getTema(){
    return d.getTema();
}

QString Utilitat::getMis(){
    return d.getMis();
}

QString Utilitat::getLlistaPl(int i){
    return d.getLlistaPl().at(i);
}

QString Utilitat::getLlistaGr(int i){
    return d.getLlistaGr().at(i);
}

int Utilitat::getNumLlistaPl(){
    return d.getLlistaPl().count();
}

QString Utilitat::getLlistaConf(int i){
    return d.getLlistaConf().at(i);
}

int Utilitat::getNumConf(){
    return d.getLlistaConf().count();
}

int Utilitat::getNumLlistaGr(){
    return d.getLlistaPl().count();
}

void Utilitat::carregaPl(QString nomPl){
    d.refreshLlistaConf();
    QMqttTopicName nom = {"/configuracio/carregaPl"};
    QString prepara = "{\"nomPl\":\"" + nomPl + "\"}";
    QByteArray message = prepara.toUtf8();
    d.c.publish(nom, message);
}

void Utilitat::carregaGr(QString nomConf){
    d.refreshLlistaGrups();
    nomConfActual = nomConf;
    QMqttTopicName nom = {"/configuracio/carregaGr"};
    QString prepara = "{\"nomConf\":\"" + nomConf + "\",\"nomPl\":\"" + pl.getNom() + "\"}";
    QByteArray message = prepara.toUtf8();
    d.c.publish(nom, message);
}

void Utilitat::assignaPl(){
    pl = d.getPl();
}

void Utilitat::assignaFanals(){
    fanals = d.getFanals();
    for(int i = 0; i<fanals.size(); i++){
        Fanal f = fanals.at(i);
    }
}

void Utilitat::assignaGrups(){
    grups = d.getGrups();
}
