import QtQuick 2.4
import Utilitat.backend 1.0

ConfPlForm {

    btDesar{
        enabled: false
        onClicked: {
            var num = parseInt(tfNum.text)
            ut.crearPl(tfNom.text,num)
            for(var i = 0; i < num; i++){
                ut.afegirPos(m1.get(i).name, m1.get(i).eixX/sV.width, m1.get(i).eixY/sV.height)
            }
            ut.desaPl()
            sV.push(dadesF)
        }
    }

    btConfigurar{
        onClicked:{
            var num = parseInt(tfNum.text)
            var dist1 = 80
            var dist2 = 80
            if(tfNom.length!=0 && tfNum.length!=0){
                for(var i = 1; i <= num; i++){
                    if (i % 2 != 0){
                        m1.append({"name": i, "eixX" : (sV.width * 0.10 -15), "eixY" : dist1})
                        dist1 += 40
                    }else{
                        m1.append({"name": i, "eixX" : (sV.width * 0.90 -15), "eixY" : dist2})
                        dist2 += 40
                    }

                }
                btDesar.enabled=true
                btConfigurar.enabled = false
                tfNom.enabled = false
                tfNum.enabled = false
            }else{
                popup.open()
            }
        }
    }
}
