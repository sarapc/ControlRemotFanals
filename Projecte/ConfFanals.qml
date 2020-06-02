import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import Utilitat.backend 1.0

ConfFanalsForm {

    PageIndicator {
        count: sv1.count
        currentIndex: sv1.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    property var tempSubscription: 0

    ListModel {
        id: messageModel
    }

    function addMessage(payload)
    {
        messageModel.insert(0, {"payload" : payload})
        cbMac.model.append({text: payload})
        if (messageModel.count >= 100)
            messageModel.remove(99)
    }


    btPublica{
        onClicked: {
            if (fTema.text.length === 0) {
                return
            }
            client.publish(fTema.text, fMissatge.text, "2", "0")
            tempSubscription = client.subscribe("/configuracio/resposta")
            tempSubscription.messageReceived.connect(addMessage)
            for(var i=1; i<=ut.getNumPl(); i++){
                cbPos.model.append({text: "Fanal"+i})
            }
            cbMac.currentIndex=0
            cbPos.currentIndex=0
        }
    }

    cbPos{
        onCountChanged: {
            if(cbPos.count==0){
                btEncen.enabled = false
                btAssigna.enabled = false
                cbPos.enabled = false
                cbMac.enabled = false
                btDesar.enabled = true
            }
        }
    }

    cbMac{
        onCountChanged: {
            if(cbMac.count!=0){
                gl1.enabled = false
            }
        }
    }

    btAssigna{
        onClicked:{
            ut.crearFanals(cbMac.currentText,cbPos.currentText)
            cbMac.model.remove(cbMac.currentIndex)
            cbPos.model.remove(cbPos.currentIndex)
            cbMac.currentIndex=0
            cbPos.currentIndex=0
        }

    }

    btEncen{
        onClicked: {
            if(btEncen.text=="Encén"){
                client.publish("/" + cbMac.currentText, '{"R": "255", "G":"0", "B": "0", W:"0"}', "2", "0")
                btEncen.text= qsTr("Apaga")
                cbMac.enabled = false
                cbPos.enabled = false
                btAssigna.enabled = false
            }else{
                client.publish("/" + cbMac.currentText, '{"R": "0", "G":"0", "B": "0", W:"0"}', "2", "0")
                btEncen.text= qsTr("Encén")
                cbMac.enabled = true
                cbPos.enabled = true
                btAssigna.enabled = true
            }
        }

    }

    Component.onCompleted: {
        for(var i = 0; i < cbMac.count ; i++){
            cbMac.model.remove(i);
        }
        btDesar.enabled = false
        fTema.text=ut.getTema()
        fMissatge.text=ut.getMis()
    }

    btDesar{
        onClicked: {
            ut.desaConf(fTema.text,fMissatge.text)
            ut.desaFanals()
            //cridar popup segons tfNom ple
            sV.push(dadesGr)
        }
    }
}
