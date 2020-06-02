import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {

    property alias lvGr: lvGr

    ListView {
        id: lvGr
        width: (parent.width - 10)
        height: parent.height * 0.6
        anchors.horizontalCenter:  parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        model: ListModel {
        }

        delegate: Button {
            id: btGr
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
                ut.carregaGr(btGr.text)
                // @disable-check M222
                sV.push(colors)
            }

            contentItem: Text{
                text: btGr.text
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btGr.down ? "#8F8F8F" : "#FFFFFF"
            }
        }
    }
}
