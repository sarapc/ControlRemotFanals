QT += quick mqtt network sql

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        client.cpp \
        dades.cpp \
        fanal.cpp \
        grup.cpp \
        main.cpp \
        pl.cpp \
        posiciofanal.cpp \
        utilitat.cpp

RESOURCES += qml.qrc \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    CarregarFanals.qml \
    CarregarFanalsForm.ui.qml \
    CarregarGrups.qml \
    CarregarGrupsForm.ui.qml \
    CarregarPl.qml \
    CarregarPlForm.ui.qml \
    Colors.qml \
    ColorsForm.ui.qml \
    ConfFanals.qml \
    ConfFanalsForm.ui.qml \
    ConfGrups.qml \
    ConfGrupsForm.ui.qml \
    ConfInicial.qml \
    ConfInicialForm.ui.qml \
    ConfPl.qml \
    ConfPlForm.ui.qml \
    ConfigInicial.qml \
    ConfigInicialForm.ui.qml \
    Connexio.qml \
    ConnexioForm.ui.qml \
    DadesFanals.qml \
    DadesFanalsForm.ui.qml \
    DadesGrups.qml \
    DadesGrupsForm.ui.qml \
    DadesPl.qml \
    DadesPlForm.ui.qml \
    Inici.qml \
    IniciForm.ui.qml \
    Mapa.qml \
    MapaForm.ui.qml \
    SelecGrup.qml \
    SelecGrupForm.ui.qml

HEADERS += \
    client.h \
    dades.h \
    fanal.h \
    grup.h \
    pl.h \
    posiciofanal.h \
    utilitat.h
