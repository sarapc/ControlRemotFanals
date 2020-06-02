import QtQuick 2.4

DadesPlForm {

    btCarregarPl{
        onClicked: sV.push(carregarPl)
    }

    btCrearPl{
        onClicked: sV.push(confPl)
    }
}
