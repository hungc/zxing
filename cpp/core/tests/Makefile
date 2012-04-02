QMAKE_TARGET  = tests
QMAKE         = $(QNX_HOST)/usr/bin/qmake
TARGET        = $(QMAKE_TARGET)

clean:
	$(MAKE) -C ./arm -f Makefile distclean
	$(MAKE) -C ./x86 -f Makefile distclean	
	
all: Makefile $(QMAKE_TARGET)

Makefile: FORCE	
	$(QMAKE) -spec unsupported/blackberry-armv7le-g++ -o arm/Makefile $(QMAKE_TARGET).pro CONFIG+=device

FORCE:

$(QMAKE_TARGET): device

device:
	$(MAKE) -C ./arm -f Makefile all

Device-Debug: Makefile
	$(MAKE) -C ./arm -f Makefile debug
	
Device-Release: Makefile
	$(MAKE) -C ./arm -f Makefile release