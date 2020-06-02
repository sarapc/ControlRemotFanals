import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

CarregarPlForm {

    function cD(){
        for (var i = 0; i < lvPl.model.count; i++){
            lvPl.model.remove(index)
        }

        for(var i = 0; i< ut.getNumLlistaPl(); i++){
            lvPl.model.append({"name": ""+ut.getLlistaPl(i).toString()})
        }
    }

    Component.onCompleted: {
        cD()
    }    
}
