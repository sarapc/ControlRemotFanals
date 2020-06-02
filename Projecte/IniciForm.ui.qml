import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {

    property alias btInici: btInici

    GridLayout {
        height: parent.height/4
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
        rows: 3
        columns: 1

        Label {
            id: lBenvinguda
            color: "#EEA730"
            text: qsTr("Benvingut/da a l'aplicació")
            visible: true
            font.bold: true
            font.pointSize: 20
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Label {
            id: lExplicacio
            color: "#EEA730"
            text: qsTr("Aquesta aplicació permet controlar\nremotament els fanals d'una plaça.")
            font.bold: false
            font.pointSize: 14
            font.family: "Arial"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Button {
            id: btInici
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            contentItem: Text {
                text: qsTr("Comença")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btInici.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }
    }
}
