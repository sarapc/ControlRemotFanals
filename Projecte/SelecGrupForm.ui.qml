import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Item {

    property alias lvGr: lvGr
    property alias sGreen: sGreen
    property alias sBlue: sBlue
    property alias rColor: rColor
    property alias sRed: sRed
    property alias sAlpha: sAlpha
    property alias glColors: glColors
    property alias lRed: lRed
    property alias lGreen: lGreen
    property alias lBlue: lBlue
    property alias lAlpha: lAlpha
    property alias btDesa: btDesa
    property alias btOrange: btOrange
    property alias btYellow: btYellow
    property alias btGreen: btGreen
    property alias btBlueGreen: btBlueGreen
    property alias btCian: btCian
    property alias btPurple: btPurple
    property alias btPink: btPink
    property alias btMaroon: btMaroon

    GridLayout {
        anchors.fill: parent
        rowSpacing: 0
        rows: 7
        columns: 4

        ListView {
            id: lvGr
            width: parent.width * 0.3
            height: parent.height
            Layout.topMargin: 2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 4
            spacing: 5

            model: ListModel {}

            delegate: Button {
                id: btGr
                text: name
                width: parent.width
                height: 35
                background: Rectangle {
                    radius: 10
                    color: "#FF4545"
                }
                contentItem: Text {
                    text: btGr.text
                    font.family: "Arial"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: btGr.down ? "#8F8F8F" : "#FFFFFF"
                }
                // @disable-check M223
                onClicked: {
                    glColors.visible = true
                    lvGr.visible = false
                    // @disable-check M222
                    ut.grupSeleccionat(btGr.text)
                }
            }
        }

        GridLayout {
            id: glColors
            width: parent.width-10
            height: parent.height * 0.6
            Layout.margins: 10
            Layout.rightMargin: 10
            Layout.leftMargin: 10
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 4
            rows: 2
            columns: 4
            Button {
                id: btOrange
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#FF8800"
                    border.color: btOrange.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btYellow
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#FFFF00"
                    border.color: btYellow.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btGreen
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#76900C"
                    border.color: btGreen.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btBlueGreen
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#0C9064"
                    border.color: btBlueGreen.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btCian
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#00FFFF"
                    border.color: btCian.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btPurple
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#B600FF"
                    border.color: btPurple.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btPink
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#FF00FF"
                    border.color: btPink.down ? "grey" : "#000000"
                }
            }
            Button {
                id: btMaroon
                Layout.fillHeight: true
                Layout.fillWidth: true
                background: Rectangle {
                    radius: 10
                    color: "#900C3F"
                    border.color: btMaroon.down ? "grey" : "#000000"
                }
            }
        }
        Label {
            id: lRed
            text: qsTr("Roig")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
        }

        Label {
            id: lGreen
            text: qsTr("Verd")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        Label {
            id: lBlue
            text: qsTr("Blau")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        Label {
            id: lAlpha
            text: qsTr("Blanc")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
        }

        Slider {
            id: sRed
            width: 99
            stepSize: 1
            from: 0
            to: 255
            Layout.fillWidth: true
            orientation: Qt.Vertical
            implicitWidth: 26
            implicitHeight: 150

            handle: Rectangle {
                x: (sRed.width - width) / 2
                y: sRed.visualPosition * (sRed.height - height)
                width: 20
                height: 15
                radius: 5
                color: "gray"
                border.color: "gray"
            }

            background: Rectangle {
                x: (sRed.width - width) / 2
                width: 4
                radius: 2
                color: "red"

                Rectangle {
                    height: sRed.visualPosition * parent.height
                    width: parent.width
                    color: "gray"
                    radius: 2
                }
            }
        }

        Slider {
            id: sGreen
            width: 99
            stepSize: 1
            from: 0
            to: 255
            Layout.fillWidth: true
            orientation: Qt.Vertical
            implicitWidth: 26
            implicitHeight: 150

            handle: Rectangle {
                x: (sGreen.width - width) / 2
                y: sGreen.visualPosition * (sGreen.height - height)
                width: 20
                height: 15
                radius: 5
                color: "gray"
                border.color: "gray"
            }

            background: Rectangle {
                x: (sGreen.width - width) / 2
                width: 4
                radius: 2
                color: "green"

                Rectangle {
                    height: sGreen.visualPosition * parent.height
                    width: parent.width
                    color: "gray"
                    radius: 2
                }
            }
        }

        Slider {
            id: sBlue
            stepSize: 1
            from: 0
            to: 255
            Layout.fillWidth: true
            orientation: Qt.Vertical
            implicitWidth: 26
            implicitHeight: 150

            handle: Rectangle {
                x: (sBlue.width - width) / 2
                y: sBlue.visualPosition * (sBlue.height - height)
                width: 20
                height: 15
                radius: 5
                color: "gray"
                border.color: "gray"
            }

            background: Rectangle {
                x: (sBlue.width - width) / 2
                width: 4
                radius: 2
                color: "blue"

                Rectangle {
                    height: sBlue.visualPosition * parent.height
                    width: parent.width
                    color: "gray"
                    radius: 2
                }
            }
        }

        Slider {
            id: sAlpha
            width: 99
            stepSize: 1
            value: 0
            from: 0
            to: 255
            implicitHeight: 150
            orientation: Qt.Vertical
            implicitWidth: 26
            Layout.fillWidth: true
            handle: Rectangle {
                x: (sAlpha.width - width) / 2
                y: sAlpha.visualPosition * (sAlpha.height - height)
                width: 20
                height: 15
                color: "#808080"
                radius: 5
                border.color: "#808080"
            }
            background: Rectangle {
                x: (sAlpha.width - width) / 2
                width: 4
                radius: 2
                gradient: Gradient {
                    GradientStop {
                        position: 1
                        color: "#000000"
                    }
                    GradientStop {
                        position: 0
                        color: "#FFFFFF"
                    }
                }
                Rectangle {
                    width: parent.width
                    height: sAlpha.visualPosition * parent.height
                    color: "#808080"
                    radius: 2
                }
            }
        }

        Rectangle {
            id: rColor
            color: "black"
            width: parent.width * 0.2
            height: parent.width * 0.2
            Layout.columnSpan: 4
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        Button {
            id: btDesa
            Layout.minimumWidth: 99
            Layout.rowSpan: 1
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.columnSpan: 4
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            contentItem: Text {
                text: qsTr("Desa")
                font.family: "Arial"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: 1.0
                color: btDesa.down ? "#8F8F8F" : "#FFFFFF"
            }
            background: Rectangle {
                radius: 10
                color: btDesa.enabled ? "#EEA730" : "#707070"
            }
        }
    }
}



