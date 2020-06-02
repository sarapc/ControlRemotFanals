import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {

    property alias tfNom: tfNom
    property alias cbGr: cbGr
    property alias cbFan: cbFan
    property alias btAssigna: btAssigna
    property alias btDesar: btDesar
    property alias cbAssig: cbAssig

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

        Label {
            id: lConfig
            text: qsTr("Configuració:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.columnSpan: 2
        }

        TextField {
            id: tfNom
            width: parent.width / 2
            Layout.minimumWidth: 188
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: false
            Layout.columnSpan: 2
            placeholderText: qsTr("<Nom Configuració>")
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfNom.enabled ? "#EEA730" : "#707070"
            }
        }

        Label {
            id: lGr
            text: qsTr("Grup:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ComboBox {
            id: cbGr
            x: 0
            y: 0
            width: 305
            height: 35
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            model: ListModel {
                id: mGr
            }
            background: Rectangle {
                radius: 10
                border.color: cbGr.enabled ? "#EEA730" : "#707070"
            }
        }

        Label {
            id: lFan
            text: qsTr("Fanal:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ComboBox {
            id: cbFan
            x: 0
            y: 103
            width: 374
            height: 35
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            model: ListModel {
                id: mFan
            }
            background: Rectangle {
                radius: 10
                border.color: cbFan.enabled ? "#EEA730" : "#707070"
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

        Label {
            id: lAss
            text: qsTr("Assignació:")
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ComboBox {
            id: cbAssig
            x: 0
            y: 0
            width: 305
            height: 35
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            model: ListModel {
            }
            background: Rectangle {
                radius: 10
                border.color: cbAssig.enabled ? "#EEA730" : "#707070"
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

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

