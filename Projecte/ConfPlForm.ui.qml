import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Item {

    property alias rectPos: rectPos
    property alias popup: popup
    property alias tfNom: tfNom
    property alias tfNum: tfNum
    property alias btConfigurar: btConfigurar
    property alias m1: m1
    property alias btDesar: btDesar

    Rectangle {
        id: rectPos
        anchors.fill: parent
        color: "#77AA3B"
    }

    Repeater {

        model: ListModel {
            id: m1
        }
        Rectangle {
            id: dragRect1
            x: eixX
            y: eixY
            radius: 10
            color: "#FFF45E"
            width: 30
            height: 30
            Drag.active: ma1.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10
            // @disable-check M223
            onXChanged: {
                // @disable-check M223
                if (ma1.drag.active) {
                    // @disable-check M222
                    m1.set(index, {
                               // @disable-check M222
                               "name": m1.get(index).name,
                               "eixX": x,
                               // @disable-check M222
                               "eixY": m1.get(index).eixY
                           })
                }
            }
            // @disable-check M223
            onYChanged: {
                // @disable-check M223
                if (ma1.drag.active) {
                    // @disable-check M222
                    m1.set(index, {
                               // @disable-check M222
                               "name": m1.get(index).name,
                               // @disable-check M222
                               "eixX": m1.get(index).eixX,
                               "eixY": y
                           })
                }
            }
            Text {
                text: name
                anchors.centerIn: parent
                font.family: "Arial"
            }
            MouseArea {
                id: ma1
                anchors.fill: parent
                drag.target: parent
                drag {
                    target: dragRect1
                    axis: Drag.XAndYAxis
                }
            }
            DropArea {
                id: dA1
                x: 10
                y: 10
            }
        }
    }

    Popup {
        id: popup
        parent: Overlay.overlay
        x: parent.width / 2
        y: parent.width / 2.5
        width: parent.width / 3
        height: parent.height / 10
        contentItem: Text {
            text: qsTr("Has d'omplir tots\nels camps.")
            font.family: "Arial"
        }
    }

    GridLayout {
        width: (parent.width - 10)
        height: parent.height / 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        rowSpacing: 10
        rows: 1
        columns: 2

        TextField {
            id: tfNom
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            placeholderText: "<Nom Plaça>"
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfNom.enabled ? "#EEA730" : "#707070"
            }
        }

        TextField {
            id: tfNum
            width: parent.width / 2
            Layout.fillWidth: true
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            inputMethodHints: Qt.ImhDigitsOnly
            horizontalAlignment: Text.AlignHCenter
            placeholderText: "<Num. Fanals>"
            font.family: "Arial"
            background: Rectangle {
                radius: 10
                border.color: tfNum.enabled ? "#EEA730" : "#707070"
            }
        }

        Button {
            id: btConfigurar
            width: parent.width / 2
            Layout.columnSpan: 2
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Configura")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btConfigurar.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btConfigurar.enabled ? "#EEA730" : "#707070"
            }
        }
    }

    Button {
        id: btDesar
        width: parent.width / 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter
        contentItem: Text {
            text: qsTr("Desa")
            font.family: "Arial"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: btDesar.down ? "#8F8F8F" : "#FFFFFF"
        }
        background: Rectangle {
            radius: 10
            color: btDesar.enabled ? "#EEA730" : "#707070"
        }
    }
}
