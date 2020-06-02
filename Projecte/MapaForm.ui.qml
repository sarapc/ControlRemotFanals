import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Item {

    property alias lNom: lNom
    property alias m1: m1

    Rectangle {
        anchors.fill: parent
        color: "#77AA3B"
    }

    GridLayout {
        width: parent.width
        height: parent.height / 10
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 1
        columns: 2

        Label {
            id: lNom
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
        }
    }

    Repeater{

        model: ListModel{
            id: m1
        }
        Rectangle {
            id: rect1
            x: eixX
            y: eixY
            radius: 10
            color: "#FFF45E"
            width: 30
            height: 30
            Text {
                text: name
                anchors.centerIn: parent
                font.family: "Arial"
            }
            MouseArea {
                id: ma1
                anchors.fill: parent
            }
        }
    }
}
