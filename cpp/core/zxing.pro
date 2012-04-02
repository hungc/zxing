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

TEMPLATE = lib
TARGET = zxing

QT -= gui
QT -= core

CONFIG += warn_on debug_and_release

INCLUDEPATH += ../src
SOURCES += ../src/zxing/*.cpp \
    ../src/zxing/aztec/*.cpp \
    ../src/zxing/aztec/decoder/*.cpp \
    ../src/zxing/aztec/detector/*.cpp \
    ../src/zxing/common/*.cpp \
    ../src/zxing/common/detector/*.cpp \
    ../src/zxing/common/reedsolomon/*.cpp \
    ../src/zxing/datamatrix/*.cpp \
    ../src/zxing/datamatrix/decoder/*.cpp  \
    ../src/zxing/datamatrix/detector/*.cpp \
    ../src/zxing/multi/*.cpp \
    ../src/zxing/multi/qrcode/*.cpp \
    ../src/zxing/multi/qrcode/detector/*.cpp \
    ../src/zxing/oned/*.cpp \
    ../src/zxing/qrcode/*.cpp \
    ../src/zxing/qrcode/decoder/*.cpp \
    ../src/zxing/qrcode/detector/*.cpp 
    
HEADERS += ../src/zxing/*.h \
    ../src/zxing/aztec/*.h \
    ../src/zxing/aztec/decoder/*.h \
    ../src/zxing/aztec/detector/*.h \
    ../src/zxing/common/*.h \
    ../src/zxing/common/detector/*.h \
    ../src/zxing/common/reedsolomon/*.h \
    ../src/zxing/datamatrix/*.h \
    ../src/zxing/datamatrix/decoder/*.h  \
    ../src/zxing/datamatrix/detector/*.h \
    ../src/zxing/multi/*.h \
    ../src/zxing/multi/qrcode/*.h \
    ../src/zxing/multi/qrcode/detector/*.h \
    ../src/zxing/oned/*.h \
    ../src/zxing/qrcode/*.h \
    ../src/zxing/qrcode/decoder/*.h \
    ../src/zxing/qrcode/detector/*.h

device {
    CONFIG(release, debug|release) {        
        DESTDIR = o.le-v7       
    } 
    CONFIG(debug, debug|release) {
        DESTDIR = o.le-v7-g
    }
}

simulator {
    CONFIG(release, debug|release) {
        DESTDIR = o
    } 
    CONFIG(debug, debug|release) {
        DESTDIR = o-g
    }
}

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
RCC_DIR = $${DESTDIR}/.rcc
UI_DIR = $${DESTDIR}/.ui


