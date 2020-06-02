import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {

    property alias btCarregarF: btCarregarF
    property alias btCrearF: btCrearF

    GridLayout {
        width: parent.width
        height: parent.height/4
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 2
        columns: 1

        Button {
            id: btCarregarF
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Carrega configuració Fanals")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCarregarF.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCarregarF.enabled ? "#EEA730" : "#707070"
            }
        }

        Button {
            id: btCrearF
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Crear configuració Fanals")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCrearF.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCrearF.enabled ? "#EEA730" : "#707070"
            }
        }
    }
}
