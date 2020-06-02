import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import Utilitat.backend 1.0


MapaForm {

    PageIndicator {
        count: sv1.count
        currentIndex: sv1.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    PageIndicator {
        count: sv2.count
        currentIndex: sv2.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function carregarDades(){
        for(var i = 0; i < m1.lenght ; i++){
            m1.remove(i);
        }
        lNom.text = ut.getNomPl()
        var num = ut.getNumPl()
        for(i = 0; i<num; i++){
            m1.append({"name": ut.getNomF(i), "eixX": ut.getX(i)*sV.width, "eixY": ut.getY(i)*sV.height})
        }
    }

    Component.onCompleted: {
        carregarDades()
    }
}
