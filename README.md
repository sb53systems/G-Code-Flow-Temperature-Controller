# G-Code-Flow-Temperature-Controller
A Post Processing Script for Slic3r based Slicers and Klipper Printers. It can be run separately and open G-Code file manually

Klipper Estimator Script is required for time estimation using Klipper Look-Ahead mechanism, and must be in the same Folder with this Script.  https://github.com/Annex-Engineering/klipper_estimator

This 3D Printing Concept is Based on my personal approach and with a minimum of Delphi programming skills.

This Script is free and open source,  created to prove the effectiveness of automatic nozzle temperature change during 3D printing in order to get the best Quality/Speed Optimization, and it is not intended to be a definitive solution as I believe that integrating this concept in slisers will be more effective.

Hoping to soon find this concept in current slicers because I think it is probably the future of 3D printing.

# Instructions
Note that current Script version (bin/SB53-Systems.exe) is still under development and will be updated daily. The source code will be shared soon.

Take into account that this script is supposed to work under certain conditions :
- Does not accept G2 and G3 in G-Code.
- Time Estimation is based in Klipper Look-ahead mechanism (may not be compatible with Marlin or Others).
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- Generated G-Code are 30% to 80% larger than the original one due to Temp and Speed adjustment (can be optimized).
- This Script is not tested with Print Start Moves in G-Code (My Print Start moves are in klipper Macro).
- This Script is currently only available for windows os.


Be responsible and careful with this Script by using reasonable values ​​and monitoring the behavior of your printer, and Happy Smart 3D Printing...

# How to use :
Note that...
# About the Developer :
By Salim BELAYEL.

![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)

Offer me a coffee if you find my work worthy. PayPal account : sb53systems@gmail.com
