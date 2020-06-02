import QtQuick 2.4

ColorsForm {



    btTriaColor{
        onClicked: {
            sV.push(selecGrup)
        }
    }

    btEspectacle{
        onClicked: {
            var max = 254
            var min = 0
            for(var i = 0; i< ut.getNumPl(); i++){
                //client.publish(ut.getTemaF(i), '{"R": "255", "G":"150", "B": "200", W:"0"}', "2", "0")
                var r = Math.ceil(Math.random() * (max - min) + min)
                var g = Math.ceil(Math.random() * (max - min) + min)
                var b = Math.ceil(Math.random() * (max - min) + min)
                client.publish(ut.getTemaF(i), '{"R": "'+r+'", "G":"'+g+'", "B": "'+b+'", W:"0"}', "2", "0")
            }
        }
    }

    btLGBTIQ{
        onClicked:{
            var color=['{"R": "255", "G":"0", "B": "0", W:"0"}', '{"R": "255", "G":"20", "B": "0", W:"0"}','{"R": "255", "G":"255", "B": "0", W:"0"}', '{"R": "0", "G":"255", "B": "0", W:"0"}','{"R": "0", "G":"0", "B": "255", W:"0"}','{"R": "255", "G":"0", "B": "255", W:"0"}']
            if(ut.getNumPl()==6){
                for(var i = 0; i<6; i++){
                    client.publish(ut.getTemaF(i), color[i], "2", "0")
                }
            }else if(ut.getNumG()==6){
                for(var i = 0; i<6; i++){
                    ut.grupSeleccionat(ut.getNomG(i))
                    for(var j=0; j<ut.getNumF(); j++){
                        client.publish(ut.getTemaFG(j), color[i], "2", "0")
                    }
                }
            }else{
                //pop up has de tenir 6 fanals o 6 grups per aquest mode
            }
        }
    }

    btRun{
        onClicked:{
            var max = 254
            var min = 0
            for (var k = 0; k < 37; k++){
                var r = Math.ceil(Math.random() * (max - min) + min)
                var g = Math.ceil(Math.random() * (max - min) + min)
                var b = Math.ceil(Math.random() * (max - min) + min)
                var color=['{"R": "'+r+'", "G":"'+g+'", "B": "'+b+'", W:"0"}', '{"R": "'+r+'", "G":"'+g+'", "B": "'+b+'", W:"0"}','{"R": "0", "G":"0", "B": "0", W:"0"}', '{"R": "0", "G":"0", "B": "0", W:"0"}','{"R": "0", "G":"0", "B": "0", W:"0"}','{"R": "0", "G":"0", "B": "0", W:"0"}']
                if(ut.getNumPl()==6){
                    for(var i = 0; i < 6; i++){
                        client.publish(ut.getTemaF(i), color[(i+k)%6], "2", "0")
                    }
                }else if(ut.getNumG()==6){
                    for(var i = 0; i < 6; i++){
                        ut.grupSeleccionat(ut.getNomG(i))
                        for(var j=0; j<ut.getNumF(); j++){
                            client.publish(ut.getTemaFG(j), color[(i+k)%6], "2", "0")
                        }
                    }
                }else{
                    //pop up has de tenir 6 fanals o 6 grups per aquest mode
                }
            }
            for(var i = 0; i< ut.getNumPl(); i++){
                //client.publish(ut.getTemaF(i), '{"R": "255", "G":"150", "B": "200", W:"0"}', "2", "0")
                var r = Math.ceil(Math.random() * (max - min) + min)
                var g = Math.ceil(Math.random() * (max - min) + min)
                var b = Math.ceil(Math.random() * (max - min) + min)
                client.publish(ut.getTemaF(i), '{"R": "'+r+'", "G":"'+g+'", "B": "'+b+'", W:"0"}', "2", "0")
            }

        }
    }


    btBarrido{
        onClicked:{
            for (var k = 0; k < 37; k++){
                var color=['{"R": "255", "G":"0", "B": "0", W:"0"}', '{"R": "255", "G":"20", "B": "0", W:"0"}','{"R": "255", "G":"255", "B": "0", W:"0"}', '{"R": "0", "G":"255", "B": "0", W:"0"}','{"R": "0", "G":"0", "B": "255", W:"0"}','{"R": "255", "G":"0", "B": "255", W:"0"}']
                if(ut.getNumPl()==6){
                    for(var i = 0; i < 6; i++){
                        client.publish(ut.getTemaF(i), color[(i+k)%6], "2", "0")
                    }
                }else if(ut.getNumG()==6){
                    for(var i = 0; i < 6; i++){
                        ut.grupSeleccionat(ut.getNomG(i))
                        for(var j=0; j<ut.getNumF(); j++){
                            client.publish(ut.getTemaFG(j), color[(i+k)%6], "2", "0")
                        }
                    }
                }else{
                    //pop up has de tenir 6 fanals o 6 grups per aquest mode
                }
            }

        }
    }

    btDona{
        onClicked:{
            for(var i = 0; i< ut.getNumPl(); i++){
                client.publish(ut.getTemaF(i), '{"R": "156", "G":"0", "B": "148", W:"0"}', "2", "0")
            }
        }
    }

    btSida{
        onClicked:{
            for(var i = 0; i< ut.getNumPl(); i++){
                client.publish(ut.getTemaF(i), '{"R": "255", "G":"0", "B": "0", W:"0"}', "2", "0")
            }
        }
    }
}
