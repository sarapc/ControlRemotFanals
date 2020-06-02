import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {

    property alias btCarregarPl: btCarregarPl
    property alias btCrearPl: btCrearPl

    GridLayout {
        width: parent.width
        height: parent.height/4
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 2
        columns: 1

        Button {
            id: btCarregarPl
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Carrega Places")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCarregarPl.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCarregarPl.enabled ? "#EEA730" : "#707070"
            }
        }

        Button {
            id: btCrearPl
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Crea Plaça")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCrearPl.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCrearPl.enabled ? "#EEA730" : "#707070"
            }
        }
    }
}
