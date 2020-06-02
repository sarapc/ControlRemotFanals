import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.3
import Utilitat.backend 1.0
import Client.backend 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: qsTr("Projecte")

    Client{
        id: client
    }

    Utilitat{
        id: ut
    }

    header: ToolBar {
        id:toolbar
        height: 65
        width: parent.width
        Rectangle{
            anchors.fill: parent
            color: "#FFE59E"
            Image{
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/siarq.png"
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }
        }
        ToolButton {
            id: tbMenu
            visible: sV.currentItem.toString().startsWith("Inici")|| sV.currentItem.toString().startsWith("Connexio") ? false : true
            text: qsTr("⋮")
            onClicked: menu.open()
            height: parent.height
            width: 50
            background: Rectangle{
                radius: 10
                color: "#FFE59E"
            }
            Menu {
                id: menu
                y: tbMenu.height
                height: 116
                width: 100
                MenuItem {
                    id: mi1
                    text: "Dades Plaça"
                    contentItem: Text{
                        text: mi1.text
                        font.family: "Arial"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: 1.0
                        color: mi1.down ? "#FFFFFF" : "#8F8F8F"
                    }
                    background: Rectangle{
                        anchors.fill: parent
                        color: "#FFE59E"
                    }
                    onClicked:
                        sV.push(dadesPl)
                }
                MenuItem {
                    id: mi2
                    text: "Dades Fanals"
                    contentItem: Text{
                        text: mi2.text
                        font.family: "Arial"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: 1.0
                        color: mi2.down ? "#FFFFFF" : "#8F8F8F"
                    }
                    background: Rectangle{
                        anchors.fill: parent
                        color: "#FFE59E"
                    }
                    onClicked: sV.push(dadesF)
                }
                MenuItem {
                    id: mi3
                    text: "Dades Grups"
                    contentItem: Text{
                        text: mi3.text
                        font.family: "Arial"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: 1.0
                        color: mi3.down ? "#FFFFFF" : "#8F8F8F"
                    }
                    background: Rectangle{
                        anchors.fill: parent
                        color: "#FFE59E"
                    }
                    onClicked: sV.push(dadesGr)
                }
                MenuItem {
                    id: mi4
                    text: "Colors"
                    contentItem: Text{
                        text: mi4.text
                        font.family: "Arial"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: 1.0
                        color: mi4.down ? "#FFFFFF" : "#8F8F8F"
                    }
                    background: Rectangle{
                        anchors.fill: parent
                        color: "#FFE59E"
                    }
                    onClicked: sV.push(colors)
                }
            }
        }
    }

    StackView{
        id:sV
        anchors.fill: parent
        initialItem: inici

        Component{
            id: inici
            Inici{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:connexio
            Connexio{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:dadesPl
            DadesPl{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:carregarPl
            CarregarPl{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:confPl
            ConfPl{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id: confFanals
            SwipeView{
                id: sv1
                currentIndex: 0
                height: sV.height
                width: sV.width
                ConfFanals{

                }

                Mapa{

                }

            }
        }

        Component{
            id:dadesGr
            DadesGrups{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:carregarGr
            CarregarGrups{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id:confGrups
            SwipeView{
                id: sv2
                currentIndex: 0
                height: sV.height
                width: sV.width
                ConfGrups{
                }

                Mapa{
                }
            }
        }

        Component{
            id: colors
            Colors{
                height: sV.height
                width: sV.width
            }
        }

        Component{
            id: selecGrup
            SelecGrup{
                height: sV.height
                width: sV.width
            }
        }
    }
}
