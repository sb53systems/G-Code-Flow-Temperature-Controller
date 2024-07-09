# G-Code-Flow-Temperature-Controller
A post processing script for slic3r based Slicers and Klipper Printers
The source code will be shared soon.



The current version is still under development and will be updated daily.
Take into account that this script is supposed to work under certain conditions :
- Does not accept G2 and G3 in G-Code.
- Time Estimation is based in Klipper Look-ahead Kinematics (may not be compatible with Marlin or Others).
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- Generated G-Code are 30% to 80% larger than the original one due to Temp and Speed adjustment (can be optimized).
- This Script is not tested with Print Start Moves in G-Code (My Print Start moves are in klipper Macro).


Be responsible and careful with this script by using reasonable values ​​and controlling the behavior of your printer.
Happy Smart 3D Printing...
