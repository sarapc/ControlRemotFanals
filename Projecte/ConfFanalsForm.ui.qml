import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Item {

    property alias gl1: gl1
    property alias fTema: fTema
    property alias fMissatge: fMissatge
    property alias btPublica: btPublica
    property alias cbPos: cbPos
    property alias cbMac: cbMac
    property alias btAssigna: btAssigna
    property alias btEncen: btEncen
    property alias btDesar: btDesar

    GridLayout {
        id: gl1
        x: 10
        y: 10
        width: parent.width
        height: 73
        rowSpacing: 15
        anchors.topMargin: 50
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
        columns: 2

        TextField {
            id: fTema
            x: 0
            y: 25
            width: parent.width / 2
            Layout.minimumWidth: 188
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            placeholderText: qsTr("<Tema>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: fTema.enabled ? "#EEA730" : "#707070"
            }
        }

        TextField {
            id: fMissatge
            x: 191
            y: 25
            width: parent.width / 2
            Layout.minimumWidth: 188
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            placeholderText: qsTr("<Missatge>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: fMissatge.enabled ? "#EEA730" : "#707070"
            }
        }

        Button {
            id: btPublica
            x: 155
            y: 66
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
            Layout.fillWidth: false
            contentItem: Text {
                text: qsTr("Publica")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btPublica.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btPublica.enabled ? "#EEA730" : "#707070"
            }
        }
    }

    GridLayout {
        height: 250
        rowSpacing: 10
        width: parent.width
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
        anchors.topMargin: 150
        columns: 2

        Label {
            id: lConfig
            text: qsTr("Configuració:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }

        Label {
            id: lMac
            text: qsTr("Mac:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ComboBox {
            id: cbMac
            x: 0
            y: 0
            width: 305
            height: 35
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            model:ListModel{
            }
            background: Rectangle {
                radius: 10
                border.color: cbMac.enabled ? "#EEA730" : "#707070"
            }
        }

        Label {
            id: lAlias
            text: qsTr("Alias:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ComboBox {
            id: cbPos
            x: 0
            y: 103
            width: 374
            height: 35
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            model:ListModel{
            }
            background: Rectangle {
                radius: 10
                border.color: cbPos.enabled ? "#EEA730" : "#707070"
            }
        }
        Button {
            id: btAssigna
            y: 156
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("Assigna")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btAssigna.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btAssigna.enabled ? "#EEA730" : "#707070"
            }
        }
        Button {
            id: btEncen
            y: 209
            width: parent.width / 2
            text: qsTr("Encén")
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: btEncen.text
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btEncen.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btEncen.enabled ? "#EEA730" : "#707070"
            }
        }
        Button {
            id: btDesar
            y: 209
            width: parent.width / 2
            Layout.minimumWidth: 99
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            contentItem: Text {
                text: qsTr("Desa")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btDesar.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btDesar.enabled ? "#EEA730" : "#707070"
            }
        }
    }
}
