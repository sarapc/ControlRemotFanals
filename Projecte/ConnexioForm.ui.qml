import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {

    property alias tfPort: tfPort
    property alias tfHostname: tfHostname
    //property alias tfUsuari: tfUsuari
    //property alias tfContrasenya: tfContrasenya
    property alias btConnectar: btConnectar
    property alias btContinuar: btContinuar
    property alias lbConnexio: lbConnexio

    GridLayout {
        width: (parent.width - 10)
        height: parent.height/2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 5
        columns: 2

        TextField {
            id: tfHostname
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("<Broker>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfHostname.enabled ? "#EEA730" : "#707070"
            }
        }

        TextField {
            id: tfPort
            width: parent.width / 3
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("<Port>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfPort.enabled ? "#EEA730" : "#707070"
            }
        }

        /*TextField {
            id: tfUsuari
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("<Usuari>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfUsuari.enabled ? "#EEA730" : "#707070"
            }
        }

        TextField {
            id: tfContrasenya
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("<Contrasenya>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfContrasenya.enabled ? "#EEA730" : "#707070"
            }
        }*/

        Button {
            id: btConnectar
            text: qsTr("Connecta")
            width: parent.width / 2
            Layout.columnSpan: 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: btConnectar.text
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btConnectar.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btContinuar
            width: parent.width / 2
            Layout.columnSpan: 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Continua")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btContinuar.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btContinuar.enabled ? "#EEA730" : "#707070"
            }
        }

        Label {
            id: lbConnexio
            color: "#000000"
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
    }
}
