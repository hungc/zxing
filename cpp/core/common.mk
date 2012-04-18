ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

#####################################
# Preset make macros go here
#####################################

NAME=zxing
SO_VERSION=2.0

EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/datamatrix
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/datamatrix/detector
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/datamatrix/decoder
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/oned
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/common
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/common/detector
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/common/reedsolomon
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/aztec
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/aztec/detector
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/aztec/decoder
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/qrcode
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/qrcode/detector
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/qrcode/decoder
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/multi
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/multi/qrcode
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/zxing/multi/qrcode/detector

EXTRA_INCVPATH+=$(shell find $(PROJECT_ROOT)/public -type d)

# Avoid error when linking the test program
CCFLAGS += -fPIC

define PINFO
PINFO DESCRIPTION=ZXing barcode decoder library
endef
INSTALLDIR=usr/lib

include $(MKFILES_ROOT)/qtargets.mk

#####################################
# Post-set make macros go here
#####################################

# Use the QNX build system's $(VARIANT_LIST) to determine whether to use
# debugging libraries, etc.
ifeq ($(filter g,$(VARIANT_LIST)),g)
  CCFLAGS += -O0
else
  # Non-debug build.
  #
  # Enable optimizations suitable for modern C++.
  CCFLAGS += -O3
endif
