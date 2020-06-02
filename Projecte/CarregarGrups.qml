import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

CarregarGrupsForm {

    function cD(){
        for (var i = 0; i < lvGr.model.count; i++){
            lvGr.model.remove(index)
        }
        lvGr.model.clear()
        for(var i = 0; i < ut.getNumConf(); i++){
            lvGr.model.append({"name": ut.getLlistaConf(i)})
        }
    }

    Component.onCompleted: {
        cD()
    }
}
