cmake_minimum_required(VERSION 3.0)

project(organya)

set(ORG_HEADERS
    organya/organya.h
)

set(ORG_SOURCES
    organya/blip_buf.c
    organya/decoder.cpp
    organya/file.cpp
)

set(PX_HEADERS
    pxtone/pxtn.h
    pxtone/pxtnDelay.h
    pxtone/pxtnDescriptor.h
    pxtone/pxtnError.h
    pxtone/pxtnEvelist.h
    pxtone/pxtnMaster.h
    pxtone/pxtnMax.h
    pxtone/pxtnMem.h
    pxtone/pxtnOverDrive.h
    pxtone/pxtnPulse_Frequency.h
    pxtone/pxtnPulse_Noise.h
    pxtone/pxtnPulse_NoiseBuilder.h
    pxtone/pxtnPulse_Oggv.h
    pxtone/pxtnPulse_Oscillator.h
    pxtone/pxtnPulse_PCM.h
    pxtone/pxtnService.h
    pxtone/pxtnText.h
    pxtone/pxtnUnit.h
    pxtone/pxtnWoice.h
    pxtone/pxtoneNoise.h
)

set(PX_SOURCES
    pxtone/pxtnDelay.cpp
    pxtone/pxtnDescriptor.cpp
    pxtone/pxtnError.cpp
    pxtone/pxtnEvelist.cpp
    pxtone/pxtnMaster.cpp
    pxtone/pxtnMem.cpp
    pxtone/pxtnOverDrive.cpp
    pxtone/pxtnPulse_Frequency.cpp
    pxtone/pxtnPulse_Noise.cpp
    pxtone/pxtnPulse_NoiseBuilder.cpp
    pxtone/pxtnPulse_Oggv.cpp
    pxtone/pxtnPulse_Oscillator.cpp
    pxtone/pxtnPulse_PCM.cpp
    pxtone/pxtnService.cpp
    pxtone/pxtnService_moo.cpp
    pxtone/pxtnText.cpp
    pxtone/pxtnUnit.cpp
    pxtone/pxtnWoice.cpp
    pxtone/pxtnWoice_io.cpp
    pxtone/pxtnWoicePTV.cpp
    pxtone/pxtoneNoise.cpp
)

add_library(${PROJECT_NAME} STATIC ${ORG_SOURCES} ${ORG_HEADERS} ${PX_SOURCES} ${PX_HEADERS})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${STATIC_LIB_SUFFIX})

install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT library
)

install(FILES ${ORG_HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/organya)
install(FILES ${PX_HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/pxtone)
