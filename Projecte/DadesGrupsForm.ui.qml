import QtQuick 2.4
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {

    property alias btCarregarGr: btCarregarGr
    property alias btCrearGr: btCrearGr

    GridLayout {
        width: parent.width
        height: parent.height/4
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 2
        columns: 1

        Button {
            id: btCarregarGr
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Carrega configuració Grups")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCarregarGr.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCarregarGr.enabled ? "#EEA730" : "#707070"
            }
        }

        Button {
            id: btCrearGr
            width: parent.width / 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Crea configuració Grups")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btCrearGr.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btCrearGr.enabled ? "#EEA730" : "#707070"
            }
        }
    }
}
