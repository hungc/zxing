#
# Copyright (c) 2011, 2012 Research In Motion Limited.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TEMPLATE = app
TARGET = zxing

CONFIG += warn_on debug_and_release

INCLUDEPATH += ../../cppunit/include
INCLUDEPATH += ../../zxing/src
INCLUDEPATH += ../../zxing/src/zxing
INCLUDEPATH += ../../zxing/src/zxing/aztec
INCLUDEPATH += ../../zxing/src/zxing/aztec/decoder
INCLUDEPATH += ../../zxing/src/zxing/aztec/detector
INCLUDEPATH += ../../zxing/src/zxing/common
INCLUDEPATH += ../../zxing/src/zxing/common/detector
INCLUDEPATH += ../../zxing/src/zxing/common/reedsolomon
INCLUDEPATH += ../../zxing/src/zxing/datamatrix
INCLUDEPATH += ../../zxing/src/zxing/datamatrix/decoder
INCLUDEPATH += ../../zxing/src/zxing/datamatrix/detector
INCLUDEPATH += ../../zxing/src/zxing/multi
INCLUDEPATH += ../../zxing/src/zxing/multi/qrcode
INCLUDEPATH += ../../zxing/src/zxing/multi/qrcode/detector
INCLUDEPATH += ../../zxing/src/zxing/oned
INCLUDEPATH += ../../zxing/src/zxing/qrcode
INCLUDEPATH += ../../zxing/src/zxing/qrcode/decoder
INCLUDEPATH += ../../zxing/src/zxing/qrcode/detector

SOURCES += ../src/*.cpp \
    ../src/common/*.cpp \
    ../src/common/reedsolomon/*.cpp \	
    ../src/qrcode/*.cpp \
    ../src/qrcode/decoder/*.cpp
   
HEADERS += ../src/common/*.h \
    ../src/common/reedsolomon/*.h \
    ../src/qrcode/*.h \
    ../src/qrcode/decoder/*.h
   
	
	    

device {
    CONFIG(release, debug|release) {        
        DESTDIR = o.le-v7       
        CPPUNIT_LIBDIR = ../../cppunit/Device-Release
    } 
    CONFIG(debug, debug|release) {
        DESTDIR = o.le-v7-g
        CPPUNIT_LIBDIR = ../../cppunit/Device-Debug
    }
}

# Simulator isn't supported because CppUnit doesn't build for the simulator 

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
RCC_DIR = $${DESTDIR}/.rcc
UI_DIR = $${DESTDIR}/.ui

LIBS += -L$${CPPUNIT_LIBDIR} -lcppunit
LIBS += -L../../zxing/arm/$${DESTDIR}/ -lzxing
LIBS += "-L${QNX_TARGET}/armle-v7/usr/lib" -liconv

QT -= gui
QT -= core
