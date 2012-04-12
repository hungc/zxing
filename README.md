# Blackberry Port of zxing (Zebra Crossing) 
 
Officially sanctioned port of zxing to the Blackberry/QNX platform. To avoid fragmentation, please do not use any other version of zxing.  Furthermore, do not expose any zxing constructs in public APIs.

Please direct all inquiries about zxing to Clifford Hung (chung@rim.com).

### Prerequisites

- Blackberry Native SDK (NDK) for Tablet OS

For QMake-based build:
- Cascades add-on (needed for QMake)

### Build instructions

For the QMake-based build:
1. Launch the NDK's IDE.
2. Open the "File" menu and click "Import..."
3. Click on "General" when the "Import" window appears.
4. Click on "Existing Projects into Workspace" when it appears.
5. Click "Next" button.
6. Click "Browse..." button next to "Select Root Directory" label.
7. Navigate to your local copy of zxing.  Then navigate to the cpp/core directory inside it.
8. Click "Ok" button.
9. Click the "Copy projects into work space" checkbox.
10. Click "Finish" button.
11. "zxing" will appear in your "Project Explorer".  Right click it and click "Build Project" from the menu that appears. 

For the recursive makefile based build:
1. Source the bbndk-env.sh from the NDK installation directory (e.g. ". ./bbndk-env.sh")
2. From the command-line, change to the zxing/cpp/core/lib directory.
3. Run make to produce release and debug builds of the ZXing library for ARM and X86. Static libraries are only produced for ARM so that they can be included in the test binary.

### Building the tests 

The CppUnit library is required to compile the unit tests. A port is hosted at git@github.rim.net:/chung/cppunit.git.  Please clone that repo and follow the same general instructions above except navigating to the root directory of the CppUnit module.  

For the QMake-based build:
1. Import the zxing-tests project from cpp/core/tests in zxing following the same general instructions for building zxing.

For the recursive makefile based build:
1. Ensure that the cppunit project is located at the same directory level as the zxing project, as this is what the Makefile expects.
1. From the command-line, change to the zxing/cpp/core/test_app directory.
2. Run make to produce release and debug builds of the test binary (zxing-test) for ARM.

### Notes

For the QMake-based build:
- Building on Windows from command-line and IDE works. Mac and Linux have not been tested.

For the recursive makefile based build:
- Building on Linux from command-line works. Mac and Windows have not been tested.

### TODO

