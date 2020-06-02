import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {

    property alias lvPl: lvPl

    ListView {
        id: lvPl
        width: (parent.width - 10)
        height: parent.height * 0.6
        anchors.horizontalCenter:  parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        model: ListModel {
        }

        delegate: Button {
            id: btPl
            text: name
            width: parent.width - 10
            height: 40
            background: Rectangle {
                radius: 10
                color: "#EEA730"
            }

            // @disable-check M223
            onClicked: {
                // @disable-check M222
                ut.carregaPl(btPl.text)
                // @disable-check M222
                console.log(btPl.text)
                // @disable-check M222
                sV.push(dadesGr)
            }

            contentItem: Text{
                text: btPl.text
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btPl.down ? "#8F8F8F" : "#FFFFFF"
            }
        }
    }
}

