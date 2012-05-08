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

EXTRA_INCVPATH+=$(PRODUCT_ROOT)/public
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/tests

LIBS+=m

# CppUnit
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/../../../cppunit/include

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
    CCFLAGS += -O0
    LIBS+=cppunit_g
    LIBS+=zxing_g
else
    # Non-debug build.
    #
    # Enable optimizations suitable for modern C++.
    CCFLAGS += -O3
    LIBS+=cppunit
    LIBS+=zxing
endif

ifeq ($(CPU),arm)
    ifeq ($(filter g,$(VARIANT_LIST)),g)
        EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../../../cppunit/$(CPU)/a-le-v7-g
        EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/$(CPU)/a-le-v7-g
    else
        # Non-debug build.
        #
        EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../../../cppunit/$(CPU)/a-le-v7
        EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/$(CPU)/a-le-v7
    endif
else
    ifeq ($(CPU),x86)
        ifeq ($(filter g,$(VARIANT_LIST)),g)
            EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../../../cppunit/$(CPU)/a-g
            EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/$(CPU)/a-g
        else
            # Non-debug build.
            #
            EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../../../cppunit/$(CPU)/a
            EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/$(CPU)/a
        endif
    endif
endif

