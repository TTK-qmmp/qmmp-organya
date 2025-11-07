
QMAKE_CFLAGS += -std=gnu11
greaterThan(QT_MAJOR_VERSION, 5){
    QMAKE_CXXFLAGS += -std=c++17
}else{
    QMAKE_CXXFLAGS += -std=c++11
}

HEADERS += decoderorganyafactory.h \
           decoder_organya.h \
           organyahelper.h

SOURCES += decoderorganyafactory.cpp \
           decoder_organya.cpp \
           organyahelper.cpp \
           liborganya/organya/blip_buf.c \
           liborganya/organya/decoder.cpp \
           liborganya/organya/file.cpp \
           liborganya/pxtone/pxtnDelay.cpp \
           liborganya/pxtone/pxtnDescriptor.cpp \
           liborganya/pxtone/pxtnError.cpp \
           liborganya/pxtone/pxtnEvelist.cpp \
           liborganya/pxtone/pxtnMaster.cpp \
           liborganya/pxtone/pxtnMem.cpp \
           liborganya/pxtone/pxtnOverDrive.cpp \
           liborganya/pxtone/pxtnPulse_Frequency.cpp \
           liborganya/pxtone/pxtnPulse_Noise.cpp \
           liborganya/pxtone/pxtnPulse_NoiseBuilder.cpp \
           liborganya/pxtone/pxtnPulse_Oggv.cpp \
           liborganya/pxtone/pxtnPulse_Oscillator.cpp \
           liborganya/pxtone/pxtnPulse_PCM.cpp \
           liborganya/pxtone/pxtnService.cpp \
           liborganya/pxtone/pxtnService_moo.cpp \
           liborganya/pxtone/pxtnText.cpp \
           liborganya/pxtone/pxtnUnit.cpp \
           liborganya/pxtone/pxtnWoice.cpp \
           liborganya/pxtone/pxtnWoice_io.cpp \
           liborganya/pxtone/pxtnWoicePTV.cpp \
           liborganya/pxtone/pxtoneNoise.cpp

INCLUDEPATH += $$PWD/liborganya

#CONFIG += BUILD_PLUGIN_INSIDE
contains(CONFIG, BUILD_PLUGIN_INSIDE){
    include($$PWD/../../plugins.pri)
    TARGET = $$PLUGINS_PREFIX/Input/organya

    unix{
        target.path = $$PLUGIN_DIR/Input
        INSTALLS += target
    }
}else{
    QT += widgets
    CONFIG += warn_off plugin lib thread link_pkgconfig c++11
    TEMPLATE = lib

    unix{
        equals(QT_MAJOR_VERSION, 4){
            QMMP_PKG = qmmp-0
        }else:equals(QT_MAJOR_VERSION, 5){
            QMMP_PKG = qmmp-1
        }else:equals(QT_MAJOR_VERSION, 6){
            QMMP_PKG = qmmp
        }else{
            error("No Qt version found")
        }
        
        PKGCONFIG += $${QMMP_PKG}

        PLUGIN_DIR = $$system(pkg-config $${QMMP_PKG} --variable=plugindir)/Input
        INCLUDEPATH += $$system(pkg-config $${QMMP_PKG} --variable=prefix)/include

        plugin.path = $${PLUGIN_DIR}
        plugin.files = lib$${TARGET}.so
        INSTALLS += plugin
    }
}
