# Blackberry Port of zxing (Zebra Crossing) 
 
Officially sanctioned port of zxing to the Blackberry/QNX platform. To avoid fragmentation, please do not use any other version of zxing.  Furthermore, do not expose any zxing constructs in public APIs.

Please direct all inquiries about zxing to Clifford Hung (chung@rim.com).

### Prerequisites

- Blackberry Native SDK (NDK) for Tablet OS

### Build instructions

1. Source the bbndk-env.sh from the NDK installation directory (e.g. ". ./bbndk-env.sh")
2. From the command-line, change to the zxing/cpp/core/lib directory.
3. Run make to produce release and debug builds of the ZXing library for ARM and X86. Static libraries are only produced for ARM so that they can be included in the test binary.

### Building the tests 

The CppUnit library is required to compile the unit tests. A port is hosted at git@github.rim.net:/chung/cppunit.git.  Please clone that repo and follow the same general instructions above except navigating to the root directory of the CppUnit module.  

1. Ensure that the cppunit project is located at the same directory level as the zxing project, as this is what the Makefile expects.
2. From the command-line, change to the zxing/cpp/core/test_app directory. Delete the file Makefile.dnm, so that make will run in this directory.
4. Run make to produce release and debug builds of the test binary (zxing-test) for ARM.

### Notes

- Building on Linux from command-line works. Mac and Windows have not been tested.

### TODO

