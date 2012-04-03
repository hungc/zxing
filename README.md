# Blackberry Port of zxing (Zebra Crossing) 
 
Officially sanctioned port of zxing to the Blackberry/QNX platform. To avoid fragmentation, please do not use any other version of zxing.  Furthermore, do not expose any zxing constructs in public APIs.

Please direct all inquiries about zxing to Clifford Hung (chung@rim.com).

### Prerequisites

- Blackberry Native SDK (NDK) for Tablet OS

### Build Instructions

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

The following optional instructions are for building the tests. You can find the unittest library at git@github.rim.net:/chung/cppunit.git.  Please clone that library and follow the same general instructions above except navigating to the root directory of the unittest module.  After that, please follow the same general instructions above except navigating to cpp/core/tests in zxing.


### Notes

- Building from Windows works. Mac and Linux are not tested.
- Must clean everything before switching architectures.

### TODO

