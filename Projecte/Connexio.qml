import QtQuick 2.4
import Client.backend 1.0

ConnexioForm {

    tfHostname{
        enabled: client.state === Client.Disconnected
    }

    tfPort{
        enabled: client.state === Client.Disconnected
    }
/*
    tfUsuari{
        enabled: client.state === Client.Disconnected
    }

    tfContrasenya{
        enabled: client.state === Client.Disconnected
    }
*/
    lbConnexio{
        text: "Estat: " + stateToString(client.state) + "( " + client.state + " )"
        enabled: client.state === Client.Connected
    }

    function stateToString(value) {
        if (value === 0)
            return "Desconnectat"
        else if (value === 1)
            return "Connectant"
        else if (value === 2)
            return "Connectat"
        else
            return "Error"
    }

    btConnectar{
        text: client.state === Client.Connected ? qsTr("Desconnecta") : qsTr("Connecta")
        onClicked: {
            client.setHostname(tfHostname.text)
            client.setPort(tfPort.text)
            //client.setUsername(tfUsuari.text)
            //client.setPassword(tfContrasenya.text)
            if (client.state === Client.Connected) {
                client.disconnectFromHost()
                messageModel.clear()
            } else
                client.connectToHost()
        }
    }

    btContinuar{
        enabled: client.state === Client.Connected
        onClicked:{
            ut.desaConnection(tfHostname.text,tfPort.text);
            sV.push(dadesPl)
        }
    }

    Component.onCompleted: {
        tfHostname.text = ut.getBroker()
        tfPort.text = ut.getPort()
    }

}
