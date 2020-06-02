import QtQuick 2.14
import QtQml 2.12

SelecGrupForm {

    function carregarDades(){

        for(var i = 0; i < lvGr.count ; i++){
            lvGr.model.remove(i);
        }
        var num = ut.getNumG()
        for(i = 0; i<num; i++){
            lvGr.model.append({"name": ""+ut.getNomG(i)})
        }
    }

    function canvi1(){
        lvGr.visible = true
        glColors.visible = false
        lGreen.visible = false
        lBlue.visible = false
        lRed.visible = false
        lAlpha.visible = false
        sGreen.visible = false
        sBlue.visible = false
        sRed.visible = false
        sAlpha.visible = false
        rColor.visible = false
        btDesa.visible = false
    }

    function canvi2(){
        lvGr.visible = false
        glColors.visible = false
        lGreen.visible = true
        lBlue.visible = true
        lRed.visible = true
        lAlpha.visible = true
        sGreen.visible = true
        sBlue.visible = true
        sRed.visible = true
        sAlpha.visible = true
        rColor.visible = true
        btDesa.visible = true
    }

    function colorClicked(color){
        rColor.color = color
        var c = rColor.color.toString(16)
        sRed.value = parseInt(c.substring(1,3),16)
        sGreen.value = parseInt(c.substring(3,5),16)
        sBlue.value = parseInt(c.substring(5,7),16)
        canvi2()
    }

    Component.onCompleted: {
        carregarDades()
        canvi1()
    }

    btPink.onClicked:{
        colorClicked(btPink.background.color)
    }

    btMaroon.onClicked: {
        colorClicked(btMaroon.background.color)
    }

    btCian.onClicked: {
        colorClicked(btCian.background.color)
    }

    btOrange.onClicked: {
        colorClicked(btOrange.background.color)
    }

    btBlueGreen.onClicked: {
        colorClicked(btBlueGreen.background.color)
    }

    btYellow.onClicked: {
        colorClicked(btYellow.background.color)
    }

    btGreen.onClicked: {
        colorClicked(btGreen.background.color)
    }

    btPurple.onClicked: {
        colorClicked(btPurple.background.color)
    }

    sGreen.onValueChanged: {
        var c = rColor.color.toString(16)
        if(sGreen.value<16){
            rColor.color = c.substring(0,3) + "0" + sGreen.value.toString(16) + c.substring(5,7)
        }else{
            rColor.color = c.substring(0,3) + sGreen.value.toString(16) + c.substring(5,7)
        }
    }

    sRed.onValueChanged: {
        var c = rColor.color.toString(16)
        if(sRed.value<16){
            rColor.color = c.substring(0,1) + "0" + sRed.value.toString(16) + c.substring(3,7)
        }else{
            rColor.color = c.substring(0,1) + sRed.value.toString(16) + c.substring(3,7)
        }
    }

    sBlue.onValueChanged: {
        var c = rColor.color.toString(16)
        if(sBlue.value<16){
            rColor.color = c.substring(0,5) + "0" + sBlue.value.toString(16)
        }else{
            rColor.color = c.substring(0,5) + sBlue.value.toString(16)
        }
    }

    sAlpha.onValueChanged: {
        rColor.opacity= sAlpha.value/255
    }

    btDesa.onClicked: {
        var num = ut.getNumF()
        var JsonString = '{"R": "' + sRed.value.toString() + '", "G":"' + sGreen.value.toString() + '", "B":"'  + sBlue.value.toString()  + '", "W":"' + sAlpha.value.toString() + '"}'
        for(var i = 0; i< num; i++){
            client.publish(ut.getTemaFG(i), JsonString, "2", "0");
        }
        canvi1()
    }
}
