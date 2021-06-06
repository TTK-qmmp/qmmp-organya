include(../../plugins.pri)

TARGET = $$PLUGINS_PREFIX/Input/organya

HEADERS += decoderorganyafactory.h \
           decoder_organya.h \
           organyahelper.h
    
SOURCES += decoderorganyafactory.cpp \
           decoder_organya.cpp \
           organyahelper.cpp \
           liborganya/decoder.cpp \
           liborganya/file.cpp \
           liborganya/blip_buf.c

INCLUDEPATH += $$PWD/liborganya

unix {
    target.path = $$PLUGIN_DIR/Input
    INSTALLS += target
    QMAKE_CLEAN = $$PLUGINS_PREFIX/Input/liborganya.so
}
