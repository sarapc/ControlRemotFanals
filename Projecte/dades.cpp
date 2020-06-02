#include "dades.h"

Dades::Dades()
{
    c.setClientId("Dades");
    c.setHostname("test.mosquitto.org");
    c.setPort(1883);
    c.connectToHost();
    connect(&c, &QMqttClient::connected, this, [this]{
        QString nom = "/configuracio/#";
        c.subscribe(nom);
        QMqttTopicName name = {"/configuracio/carrega"};
        c.publish(name, "Con");
        c.publish(name, "Conf");
        c.publish(name, "LlistaPl");
    });
    connect(&c, &QMqttClient::messageReceived, this, [this](const QString &message, const QMqttTopicName &topic){
        gestio(message, topic);
    });
}

void Dades::desaConnection(QString broker, QString port){
    QJsonObject obj;
    obj.insert("broker", broker);
    obj.insert("port", port);
    QJsonDocument doc(obj);
    QMqttTopicName nom = {"/configuracio/desaCon"};
    c.publish(nom, doc.toJson());
}

void Dades::desaConf(QString tema, QString mis){
    QJsonObject obj;
    obj.insert("tema", tema);
    obj.insert("mis", mis);
    QJsonDocument doc(obj);
    QMqttTopicName nom = {"/configuracio/desaConfF"};
    c.publish(nom, doc.toJson());
}

void Dades::desaPl(QString nomPl, int numPl){
    QJsonObject obj;
    obj.insert("nomPl", nomPl);
    obj.insert("numPl", QString::number(numPl));
    QJsonDocument doc(obj);
    QMqttTopicName nom = {"/configuracio/desaPl"};
    c.publish(nom, doc.toJson());
    QMqttTopicName name = {"/configuracio/carrega"};
    c.publish(name, "LlistaPl");
}

void Dades::desaPosicio(QString nomPos, QString posX, QString posY, QString nomPl){
    QJsonObject obj;
    obj.insert("nomPos", nomPos);
    obj.insert("posX", posX);
    obj.insert("posY", posY);
    obj.insert("nomPl", nomPl);
    QJsonDocument doc(obj);
    QMqttTopicName nom ={"/configuracio/desaPos"};
    c.publish(nom, doc.toJson());
}

void Dades::desaFanal(QString alias, QString tema, QString mac, QString nomPl){
    QJsonObject obj;
    obj.insert("alias", alias);
    obj.insert("mac", mac);
    obj.insert("nomPl", nomPl);
    obj.insert("tema", tema);
    QJsonDocument doc(obj);
    QMqttTopicName nom ={"/configuracio/desaFan"};
    c.publish(nom, doc.toJson());
}

void Dades::desaGrup(QString nomConf, QString nomGr, QString alias, QString nomPl){
    QJsonObject obj;
    obj.insert("alias", alias);
    obj.insert("nomConf", nomConf);
    obj.insert("nomGr", nomGr);
    obj.insert("nomPl", nomPl);
    QJsonDocument doc(obj);
    QMqttTopicName nom ={"/configuracio/desaGr"};
    c.publish(nom, doc.toJson());
    QMqttTopicName name = {"/configuracio/carregaLlistaGr"};
    QString auxStr = nomPl;
    QByteArray aux = auxStr.toUtf8();
    c.publish(name, aux);
}

void Dades::carregaCon(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    broker = obj["broker"].toString();
    port = obj["port"].toString();
}

void Dades::carregaConfF(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    tema = obj["tema"].toString();
    mis = obj["mis"].toString();
}

void Dades::carregaLlistaPl(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomPl = obj["nomPl"].toString();
    llistaPl.append(nomPl);
}

void Dades::carregaLlistaConf(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomConf = obj["nomConf"].toString();
    llistaConf.append(nomConf);
}

void Dades::carregaLlistaGr(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomGr = obj["nomGr"].toString();
    llistaGr.append(nomGr);
}

void Dades::carregaPl(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomPl = obj["nomPl"].toString();
    int numPl = obj["numPl"].toString().toInt();
    pl.setNom(nomPl);
    pl.setNum(numPl);
}

void Dades::carregaPosicio(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomPos = obj["nomPos"].toString();
    QString x = obj["posX"].toString();
    QString y = obj["posY"].toString();
    PosicioFanal pf = PosicioFanal(nomPos, x, y);
    pl.pos.append(pf);
    if(pl.pos.count()==pl.getNum()){
        emit(plCompleta());
    }
}

void Dades::carregaFanal(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString alias = obj["alias"].toString();
    QString mac = obj["mac"].toString();
    QString tema = obj["tema"].toString();
    Fanal f = Fanal(mac, tema, alias);
    fanals.append(f);
    if(fanals.count()==pl.getNum()){
        emit(fanalsComplets());
    }
}

void Dades::carregaConf(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomConf = obj["nomConf"].toString();
    llistaConf.append(nomConf);
}

void Dades::carregaGr(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString nomGr = obj["nomGr"].toString();
    Grup gr = Grup(nomGr);
    grups.append(gr);
    llistaGr.append(gr.getNom());
}

void Dades::carregaGrup(QString missatge){
    QJsonDocument doc = QJsonDocument::fromJson(missatge.toUtf8());
    QJsonObject obj = doc.object();
    QString alias = obj["alias"].toString();
    QString nomGr = obj["nomGr"].toString();
    Fanal f;
    QString nomF;
    Grup gr = Grup();
    QString nomG;

    for(int i = 0; i<fanals.count(); i++){
        f = fanals.at(i);
        nomF = f.getAlias();
        if(nomF==alias){

            for(int j=0; j<grups.count(); j++){
                gr = grups.at(j);
                gr.Gfanals = grups.at(j).Gfanals;
                nomG = gr.getNom();
                if(nomG==nomGr){
                    gr.Gfanals.append(f);
                    grups[j] = gr;
                    break;
                }
            }

        }
    }

    int compt=0;
    for(int i = 0; i<grups.count(); i++){
        compt = compt + grups[i].Gfanals.count();
    }
    if(compt==pl.getNum()){
        emit(grupsComplets());
    }
}

void Dades::gestio(const QString missatge, const QMqttTopicName topic){
    if(topic.name() == "/configuracio/dadesCon"){
        carregaCon(missatge);
    }else if(topic.name() == "/configuracio/dadesConfF"){
        carregaConfF(missatge);
    }else if(topic.name() == "/configuracio/dadesPl"){
        carregaPl(missatge);
    }else if(topic.name() == "/configuracio/dadesConf"){
        carregaConf(missatge);
    }else if(topic.name() == "/configuracio/dadesPos"){
        carregaPosicio(missatge);
    }else if(topic.name() == "/configuracio/dadesFan"){
        carregaFanal(missatge);
    }else if(topic.name() == "/configuracio/Gr"){
        carregaGr(missatge);
    }else if(topic.name() == "/configuracio/dadesGr"){
        carregaGrup(missatge);
    }else if(topic.name() == "/configuracio/dadesLlistaPl"){
        carregaLlistaPl(missatge);
    }else if(topic.name() == "/configuracio/dadesLlistaGr"){
        carregaLlistaGr(missatge);
    }
}

void Dades::clearLlistaPl(){
    llistaPl.clear();
    QMqttTopicName name = {"/configuracio/carrega"};
    c.publish(name, "LlistaPl");
}

void Dades::refreshLlistaGrups(){
    grups.clear();
}

void Dades::refreshLlistaConf(){
    llistaConf.clear();
}

QString Dades::getBroker(){
    return broker;
}

QString Dades::getPort(){
    return port;
}

QString Dades::getTema(){
    return tema;
}

QString Dades::getMis(){
    return mis;
}

QList<QString> Dades::getLlistaPl(){
    return llistaPl;
}

QList<QString> Dades::getLlistaGr(){
    return llistaGr;
}

QList<QString> Dades::getLlistaConf(){
    return llistaConf;
}

Pl Dades::getPl(){
    return pl;
}

QList<Fanal> Dades::getFanals(){
    return fanals;
}

QList<Grup> Dades::getGrups(){
    return grups;
}
