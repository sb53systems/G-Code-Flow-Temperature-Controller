# G-Code-Flow-Temperature-Controller
A Post Processing Script for Slic3r based Slicers and Klipper 3D Printers.  
  
This 3D Printing Concept is Based on my personal approach and with a minimum of Delphi programming skills.  
Its operation consists of varying the temperature according to the average flow rate during printing time, then limit the speed in the G-Code to reach the recommended flow rate for the temperature reached.  
  
This Script is free and open source, created to prove the effectiveness of automatic Speeds/Flow and Nozzle temperature change during 3D printing in order to get the best Quality/Speed Optimization and reduce 3D Printing complexity.  
  
With this Concept, you could print any object with the same Slicer Settings and have the best Speed/Quality Optimization, even with an old Klipperized 3D printer and a nice inexpensive filament!  
  
![image](https://github.com/user-attachments/assets/959c95cd-48ec-48a6-92aa-607106f9f7d1)  
  
This script is not intended to be a definitive solution as I think integrating this concept into the Slicers will be more effective.  
  
I think this concept will be the future of 3D printing, I encourage you to test, share and develop it, with the hope that equivalent solutions will be integrated into the Slicers.  
  
# Latest Release
[SB53 G-Code Flow/Temperature Controller V1.1 Beta (updated September 11 2024)](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/releases/tag/V1.1Beta)  
  
# Instructions and Prerequisites  
1. The script can be used as a normal program by running the SB53-Systems.exe file and opening a G-Code file manually, or by adding it to the Slicer as a post-processing script.  
  ![image](https://github.com/user-attachments/assets/3557a6ff-524f-4964-9cd2-044b01f46faa)
 
```
D:\SB53_G-Code_Flow_Temperature_Controller_V1.1Beta\SB53-Systems.exe;
```
  
2. [Klipper_Estimator](https://github.com/Annex-Engineering/klipper_estimator) Script is required and must be in the same Folder with this Script (Included Klipper_Estimator.exe V 3.7.3). Using Klipper Look-Ahead kinematics, it estimate the time and the average flow rate for each move in the G-Code.  
  
3. Changing the initial layer temperature is important, the script automatically modifies the G-Code (M109 S) command or changes the specified print start macro. Example Below : 
![image](https://github.com/user-attachments/assets/26b1e09e-0750-43f6-995f-8671da5838e0)  
![image](https://github.com/user-attachments/assets/a3c814af-4522-4177-907c-7aab631505f7)  
  
4. To have a best Speed/Quality Optemization, the Slicer Profil must be set for Max Moves and Max Volumetric Speed, the Nozzle temperature is not important because it will be reset in the script, and the speed will be reduced (not increased) to the Recommended Flow.  
  
  Example below with my max 200mm/s Printer speed : (Same profil for PLA, PETG and ABS)  
    
  ![image](https://github.com/user-attachments/assets/c0a30aed-046a-48ad-b819-93def3b28de5)  
  
The speed of overhangs and small internal/external bridges should be set to the maximum speed, this will ensure that the filament is extruded at the recommended flow rate and that it is not too hot and falls off, or too cold and shrinks, and will avoid sudden changes in flow rate and unnecessary temperature drop. (Experimental approach)  
![image](https://github.com/user-attachments/assets/5bdbf7f0-58ec-4877-93f1-a5bde20caa38)  
  
For larger bridges, you can use a modifier in the slicer that changes the speed of a few lower layers to the bridge, This Approach can only be optimized if it is included in the Slicer, the temperature and speed should gradually decrease to the desired bridge speed. Example bellow for 50mm/s External Bridge speed.  
![image](https://github.com/user-attachments/assets/51f2cba4-d57d-4ea7-8ef7-d0c36dd61dc0)   
![image](https://github.com/user-attachments/assets/1cee9879-389b-4117-9048-b96c76e51891)  
  
I use Thick Bridges in Orca Slicer and a single 5015 radial fan for part cooling, there is not much deference between a 60mm bridge at 30mm/s and another at 100mm/s, and since I don't print a lot of wide bridges, I prefer to keep an automatic speed.  
  
[See my ORCA Slicer Settings.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/My_Config.md)  
  
[See my Bridge test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Bridges_Test.md)  
  
[See my overhangs test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Overhangs_Test.md)  
  
You shoold set the filament settings :
  - The maximum recommended volumetric speed at the maximum temperature that your Hotend or Filament can handle.
  - The Fan Cooling perdiode and the Min print speed.
  - ...
  
![image](https://github.com/user-attachments/assets/5dc1f64d-48dc-4d39-8290-ad8251267990)  
![image](https://github.com/user-attachments/assets/c07c5e7c-b137-4af3-86b6-efeaecdc06cc)  
  
Note that I prefer to heat my filament a little more to have a better Layer adhesion, and my PTFE-Lined Hotend safe temperature is 240°.  
  
5. The initial temperature estimated by the Script depends on the speed of the first moves of the G-Code, you can adjust it by fixing the speed of the purge line or the speed of the first layer perimeters.  
  
  
Note that :  
- The script only reduces the speeds above the recommended speed, lower speeds will be kept as in the G-Code.
- Hotend PID cannot be changed during print in Klipper, I recommend using PID values for a temperature between 70-90% of the maximum temperature.  
- PA can be regulated in the script according to the temperature or not by unchecking the Adjust PA option befor generating the G-Code, and use the fixed PA from the Slicer or Klipper.  
- Changing the PA during printing causes a delay in execution and forms bubbles in the walls, the Script is programed to change PA only in Sparse infill, Internal solid infill, Support and Internal Bridge.  
![351913375-991fe2b8-3935-46ff-816e-5b0aee981b4d](https://github.com/user-attachments/assets/602b96a8-2666-44bd-b70f-aa5c06deadd4)  
  
- This Script does not accept G2 and G3 in G-Code (Arc Fitting, Spirale Z Hope Type,...).
- This script does not support Multi-Tool and Multi-Material printing.
- Ironing and Scarf joint seam are not recommanded, it will affect the printing time and the desired result.  
- Time Estimation is based in Klipper Look-ahead kinematics, and may not be compatible with other firmware.
- The current version of Klipper_Estimator, does not support delta kinematic limits.
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- The generated G-Code is 20/50 % larger than the original one due to Temp and Speed adjustment.
- This Script is currently only available for Windows OS. With delphi 12 and a few changes in the source code, it can be compiled for other operating system (I can help for this, or can do it later!).  
  
# Usage  
The script will popup once you Print or Export the G-Code from the Slicer, ask the user whether the script will be applied or not.   
  
![image](https://github.com/user-attachments/assets/f1589c73-8261-4171-89c9-ff0ca416f5fb)  
  
If yes, the first execution:  
- You have to set the appropriate Extruder/Printer values.
- Klipper_Estimator script requires a file containing the maximum limits of the printer (config .json), can be obtained by specifying the IP address of the printer or by choosing a file locally. You have to set this file for each preset.  
  ![image](https://github.com/user-attachments/assets/2a316ba8-124d-48d5-83b1-3a6184aa189e)
- After saving the Extruder/Printer preset, Set the Filament type and name and values (for each Extruder).
- The next uses, the script can recognize the Extruder/Printer and Filament used if they are written with the same name as in the slicer.  
  ![image](https://github.com/user-attachments/assets/7b467275-4bed-4927-adc6-0a6306d95de6)![image](https://github.com/user-attachments/assets/0219a6d0-63d1-4b7e-b465-d45c74db0d49)  
  ![image](https://github.com/user-attachments/assets/40a1eeec-38eb-4db5-a4bf-36e83e9e284f)![image](https://github.com/user-attachments/assets/fefd7247-1c32-4f94-a1b5-1fc3124d0812)  
- If you make any changes to the script, you need to refresh the Estimation, then Regenerate the G-Code.  
  
# 3DBenchy Example
![image](https://github.com/user-attachments/assets/86d50570-b77d-4f9c-8897-0421e7ca2b67)  
![image](https://github.com/user-attachments/assets/394f024d-6dde-4e2f-aade-4836b72a122d)  
  
Below the Generated G-Code 
  
![image](https://github.com/user-attachments/assets/4a741c30-9c26-41f1-95e2-2f0070279949)  
  
# Observations and Tips
- A printer with higher accelerations and lower heat/cool time will have a better result with this approach because it allows for better flow stabilization.  
- With a resonable Edeal Flow/Temperature calibration, the same good quality is achieved with the majority of filament brands without any changes in the script.  
- With some prints, changing the Max/Average Smoothing value may affect the result and print time, you have to experiment yourself (I recommend values between 10 and 30).  
- Aim for speed optimization as long as it doesn't affect the desired quality, usually the printing time will only vary by a few minutes. 
- The speed of the outer wall is higher than the speed of the inner wall because of the deferent Line width.  
![image](https://github.com/user-attachments/assets/76acb2cf-f57e-4a38-b1c7-788689ed6470)![image](https://github.com/user-attachments/assets/52b5714b-5607-45f5-adc7-73b9782b6bcc)   
  
Be responsible and careful with this Script by using reasonable values ​​and monitoring the behavior of your printer.  
I look forward to your feedback and remain available and open to new proposals.  
  
Happy Smart 3D Printing :-)  
  
# About the Developer 
By Salim BELAYEL.  
Developed in June 2024 with Delphi 12 Community Edition.  
Email : sb53systems@gmail.com  
  
![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)  
  
If you find my work worthy, Bay me a coffee. Thank you.  
  
[![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53system)
 [Co-fi](https://ko-fi.com/sb53system) 


