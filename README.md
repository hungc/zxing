# Blackberry Port of zxing (Zebra Crossing) 
 
Officially sanctioned port of zxing to the Blackberry/QNX platform. To avoid fragmentation, please do not use any other version of zxing.  Furthermore, do not expose any zxing constructs in public APIs.

Please direct all inquiries about zxing to Steven Chan (schan@rim.com).

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
8. Click "Ok"button. 
9. Click "Finish" button.
10.  "zxing-2.0" will appear in your "Project Explorer".  Right click it and click "Build Project" from the menu that appears. 

### Notes

- Building from Windows works. Mac and Linux are not tested.
- Must clean everything before switching architectures.

### TODO

