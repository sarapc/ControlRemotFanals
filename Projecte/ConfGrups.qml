import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

ConfGrupsForm {

    PageIndicator {
        count: sv2.count
        currentIndex: sv2.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function carregarDades(){
        for(var i = 0; i < cbFan.count ; i++){
            cbGr.remove(i);
            cbFan.remove(i);
        }
        var num = ut.getNumPl()
        ut.esborrarGr()
        for(i = 0; i<num; i++){
            cbFan.model.append({text: ""+ut.getAliasF(i)})
            cbGr.model.append({text: "Grup"+(i+1)})
            ut.crearGrup(("Grup"+(i+1)));
        }
        cbGr.currentIndex=0
        cbFan.currentIndex=0
    }

    cbFan{
        onCountChanged: {
            if(cbFan.count==0){
                btAssigna.enabled = false
                cbFan.enabled = false
                cbGr.enabled = false
                cbAssig.enabled = false
                btDesar.enabled = true
            }
        }
    }

    btAssigna{
        onClicked:{
            ut.afegirFanal(cbGr.currentText,cbFan.currentText)
            cbAssig.model.append({text: ""+ cbGr.currentText + " <- " + cbFan.currentText})
            cbAssig.currentIndex=cbAssig.count-1
            cbFan.model.remove(cbFan.currentIndex)
            cbFan.currentIndex=0
        }

    }

    Component.onCompleted: {
        btDesar.enabled = false
        carregarDades()
    }

    btDesar{
        onClicked: {
            ut.setNomConf(tfNom.text)
            ut.esborrarGrEmpty()
            if(!tfNom.length==0){
                ut.desaGrups()
                sV.push(colors)
            }
        }
    }
}
