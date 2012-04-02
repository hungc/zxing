QMAKE_TARGET  = tests
QMAKE         = $(QNX_HOST)/usr/bin/qmake
TARGET        = $(QMAKE_TARGET)

clean:
	$(MAKE) -C ./arm -f Makefile distclean
	$(MAKE) -C ./x86 -f Makefile distclean	
	
all: Makefile $(QMAKE_TARGET)

Makefile: FORCE	
	$(QMAKE) -spec unsupported/blackberry-armv7le-g++ -o arm/Makefile $(QMAKE_TARGET).pro CONFIG+=device
	$(QMAKE) -spec win32-g++ -o x86/Makefile $(QMAKE_TARGET).pro CONFIG+=simulator

FORCE:

$(QMAKE_TARGET): device simulator

device:
	$(MAKE) -C ./arm -f Makefile all

Device-Debug: Makefile
	$(MAKE) -C ./arm -f Makefile debug
	
Device-Release: Makefile
	$(MAKE) -C ./arm -f Makefile release

simulator:
# No x86 version of cascades available, yet.
#	$(MAKE) -C ./x86 -f Makefile all
