import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
Item {

    property alias btTriaColor: btTriaColor
    property alias btEspectacle: btEspectacle
    property alias btSida: btSida
    property alias btDona: btDona
    property alias btLGBTIQ: btLGBTIQ
    property alias btBarrido: btBarrido
    property alias btRun: btRun

    GridLayout {
        height: 250
        rows: 7
        rowSpacing: 10
        width: parent.width
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
        anchors.topMargin: 50
        columns: 2


        Button {
            id: btTriaColor
            y: 156
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE tria color")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btTriaColor.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btEspectacle
            y: 209
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE espectacle")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btEspectacle.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btBarrido
            y: 209
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE Escombrat")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btBarrido.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btRun
            y: 250
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE Run")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btRun.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btDona
            y: 209
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE dia Internacional de les Dones (8 Març)")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btDona.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

        Button {
            id: btLGBTIQ
            y: 156
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE dia Internacional LGBTIQ+ (28 Juny)")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btLGBTIQ.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }


        Button {
            id: btSida
            y: 156
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("MODE dia Mundial de la Sida (1 Desembre)")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btSida.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }
        }

    }

}
