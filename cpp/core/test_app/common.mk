ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

#####################################
# Preset make macros go here
#####################################

EXTRA_SRCVPATH+=$(PRODUCT_ROOT)/tests/src
EXTRA_SRCVPATH+=$(PRODUCT_ROOT)/tests/src/common
EXTRA_SRCVPATH+=$(PRODUCT_ROOT)/tests/src/common/reedsolomon
EXTRA_SRCVPATH+=$(PRODUCT_ROOT)/tests/src/qrcode
EXTRA_SRCVPATH+=$(PRODUCT_ROOT)/tests/src/qrcode/decoder

EXTRA_INCVPATH+=$(PRODUCT_ROOT)/src
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/tests

LIBS+=m

# CppUnit
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/../../../cppunit/include
EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../../../cppunit/Device-Debug
LIBS+=cppunit

define PINFO
PINFO DESCRIPTION=ZXing barcode decoder test app
endef
INSTALLDIR=usr/bin

NAME=zxing-test

include $(MKFILES_ROOT)/qtargets.mk

#####################################
# Post-set make macros go here
#####################################

# Use the QNX build system's $(VARIANT_LIST) to determine whether to use
# debugging libraries, etc.
ifeq ($(filter g,$(VARIANT_LIST)),g)
  EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/lib/arm/a-le-v7-g
  LIBS+=zxing_g
  CCFLAGS += -O0
else
  # Non-debug build.
  #
  EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/lib/arm/a-le-v7
  LIBS+=zxing

  # Enable optimizations suitable for modern C++.
  CCFLAGS += -O3
endif


