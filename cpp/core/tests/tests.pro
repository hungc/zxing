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
INCLUDEPATH += ../../zxing-2.0/src
INCLUDEPATH += ../../zxing-2.0/src/zxing
INCLUDEPATH += ../../zxing-2.0/src/zxing/aztec
INCLUDEPATH += ../../zxing-2.0/src/zxing/aztec/decoder
INCLUDEPATH += ../../zxing-2.0/src/zxing/aztec/detector
INCLUDEPATH += ../../zxing-2.0/src/zxing/common
INCLUDEPATH += ../../zxing-2.0/src/zxing/common/detector
INCLUDEPATH += ../../zxing-2.0/src/zxing/common/reedsolomon
INCLUDEPATH += ../../zxing-2.0/src/zxing/datamatrix
INCLUDEPATH += ../../zxing-2.0/src/zxing/datamatrix/decoder
INCLUDEPATH += ../../zxing-2.0/src/zxing/datamatrix/detector
INCLUDEPATH += ../../zxing-2.0/src/zxing/multi
INCLUDEPATH += ../../zxing-2.0/src/zxing/multi/qrcode
INCLUDEPATH += ../../zxing-2.0/src/zxing/multi/qrcode/detector
INCLUDEPATH += ../../zxing-2.0/src/zxing/oned
INCLUDEPATH += ../../zxing-2.0/src/zxing/qrcode
INCLUDEPATH += ../../zxing-2.0/src/zxing/qrcode/decoder
INCLUDEPATH += ../../zxing-2.0/src/zxing/zxing/qrcode/detector

SOURCES += ../src/*.cpp \
    ../src/common/*.cpp \
    ../src/common/reedsolomon/*.cpp \	
    ../src/qrcode/*.cpp \
    ../src/qrcode/decoder/*.cpp
   
HEADERS += src/*.h\
    ../src/common/*.h \
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

simulator {
    CONFIG(release, debug|release) {
        DESTDIR = o
        CPPUNIT_LIBDIR = ../../cppunit/Simulator-Debug
    } 
    CONFIG(debug, debug|release) {
        DESTDIR = o-g
        CPPUNIT_LIBDIR = ../../cppunit/Simulator-Debug
    }
}

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
RCC_DIR = $${DESTDIR}/.rcc
UI_DIR = $${DESTDIR}/.ui

LIBS += -L$${CPPUNIT_LIBDIR} -lcppunit
LIBS += -L../../zxing-2.0/arm/$${DESTDIR}/ -lzxing
LIBS += "-L${QNX_TARGET}/armle-v7/usr/lib" -liconv

QT -= gui
QT -= core
