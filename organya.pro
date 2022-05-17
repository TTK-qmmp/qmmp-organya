include($$PWD/../../plugins.pri)

TARGET = $$PLUGINS_PREFIX/Input/organya

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

unix {
    target.path = $$PLUGIN_DIR/Input
    INSTALLS += target
}
