# G-Code-Flow-Temperature-Controller
A post processing script for slic3r based Slicers and Klipper Printers. It can be run separately and choose G-Code manually.

This 3D Printing Concept is Based on my personal approach and with a minimum of knowledge in Delphi programming.

This program is free and open source, created to prove the effectiveness of automatic nozzle temperature change during 3D printing, and it is not intended to be a definitive solution, as I believe that integrating this concept in slisers will be more effective, and I encourage its development.

The source code will be shared soon.



The current version is still under development and will be updated daily.
Take into account that this script is supposed to work under certain conditions :
- Does not accept G2 and G3 in G-Code.
- Time Estimation is based in Klipper Look-ahead Kinematics (may not be compatible with Marlin or Others).
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- Generated G-Code are 30% to 80% larger than the original one due to Temp and Speed adjustment (can be optimized).
- This Script is not tested with Print Start Moves in G-Code (My Print Start moves are in klipper Macro).


Be responsible and careful with this script by using reasonable values ​​and controlling the behavior of your printer.

Offer me a coffee if you find my work worthy. PayPal account : sb53systems@gmail.com

By Salim BELAYEL.

Happy Smart 3D Printing...
