# G-Code-Flow-Temperature-Controller
A Post Processing Script for Slic3r based Slicers and Klipper 3D Printers.  
  
This 3D Printing Concept is Based on my personal approach and with a minimum of Delphi programming skills.

This Script is free and open source, created to prove the effectiveness of automatic nozzle temperature change during 3D printing in order to get the best Quality/Speed Optimization and reduce the Slicer complexity, but it is not intended to be a definitive solution as I believe that integrating this concept in slicers will be more effective.  
Hoping to soon find this concept in current slicers, because I think this will be the future of 3D printing.  
  
# Latest Release
[SB53 G-Code Flow/Temperature Controller V1.0 (3 Aug 2024)](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/releases/tag/V1.0)  
  
# Instructions and prerequisites  
The script operation consists of varying the temperature according to the average flow rate during printing time, then limit the speed in the G-Code to feat the recommended flow rate for the reached temperature.  
[Klipper_Estimator](https://github.com/Annex-Engineering/klipper_estimator) Script is required for time estimation using Klipper Look-Ahead kinematics, and must be in the same Folder with this Script (Included Klipper_Estimator.exe V 3.7.3).  
  
The script can be used as a normal program by opening the SB53-Systems.exe file and opening a GCode manually, or by adding it as a post-processing script in the Slicer.  
It is also recommended to add in the slicer Klipper_Estimator.exe path after this script to rewrite the new estimated time into the G-Code.  
![image](https://github.com/user-attachments/assets/a08ed4f5-a5f7-47dd-88eb-09a183e43a2d)  
```
D:\SB53_G-Code_Flow_Temperature_Controller_V1.0\SB53-Systems.exe;
D:\SB53_G-Code_Flow_Temperature_Controller_V1.0\Klipper_Estimator.exe --config_file D:\SB53_G-Code_Flow_Temperature_Controller_V1.0\config.json post-process;
```
  
To have a best Speed/Quality Optemization, the Slicer Profil must be set for Max Speed and Max Flow Rate, the Nozzle temperature is not important because it will be reset in the script and the print speed will be regulated to the temperature.  
  
Example below with my max 200mm/s Printer speed : (Same profil for PLA, PETG and ABS)  
![image](https://github.com/user-attachments/assets/c0a30aed-046a-48ad-b819-93def3b28de5)  
  
You shoold only modify the filament settings and set :
- The maximum recommended volumetric speed at the maximum temperature that your Hotend can handle.
- The Fan Cooling perdiode and the Min print speed.
  
![image](https://github.com/user-attachments/assets/5c6fc0f2-ddce-4203-954c-94dcd4862585)
![image](https://github.com/user-attachments/assets/ea4eee40-6a75-4d1d-a898-140ffa584db3)  
  
Note that I prefer to heat my filament a little more to have a better layers addition.  
  
The speed of overhangs and small internal/external bridges should be set to the maximum speed, this will ensure that the filament is extruded at the recommended flow rate and that it is not too hot and falls off, or too cold and shrinks, and will avoid sudden changes in flow rate and unnecessary temperature drop. (Experimental approach)  
![image](https://github.com/user-attachments/assets/5bdbf7f0-58ec-4877-93f1-a5bde20caa38)  
  
  
  
For larger bridges, I recommend using a modifier in the slicer that changes the speed of a few lower layers to the bridge, the Script will adapt gradually the temperature and the speed to the desired value. Example bellow for 50mm/s External Bridge speed.  
![image1](https://github.com/user-attachments/assets/216766be-e662-4ea0-aef0-541cbd23287a)  
  
![image3](https://github.com/user-attachments/assets/2a5a083b-20a2-4c5d-91f1-e3d87d0cc62a)  
  
The initial temperature estimated by the Script depends on the speed of the first movements of the g-code, you can adjust it by fixing the speed of the purge line or the speed of the first layer perimeters.  
  
  
Note that :  
- The script only reduces the speeds above the recommended speed, lower speeds will be kept as in the G-Code.
- Hotend PID cannot be changed during print in Klipper, I recommend using PID values for a temperature between 70-90% of the maximum temperature.  
- PA can be regulated in the script according to the temperature or not by unchecking the Adjust PA option befor generating the G-Code, and use the fixed PA from the Slicer or Klipper.  
- Changing the PA during printing causes a delay in execution and forms bubbles in the walls, the Script is programed to change PA only in Sparse infill, Internal solid infill, Support and Internal Bridge.  
![351913375-991fe2b8-3935-46ff-816e-5b0aee981b4d](https://github.com/user-attachments/assets/602b96a8-2666-44bd-b70f-aa5c06deadd4)  
- Changing the initial layer temperature is important, and cannot be done in different print start macro, this macro must be in the form below  
  PRINT_START (instructions) EXTRUDER_TEMP=XXX (...next instructions)
  ![image](https://github.com/user-attachments/assets/5e462ac4-0c8b-4537-a21a-f2a1f85b4126)
  ```
  PRINT_START EXTRUDER_TEMP=[nozzle_temperature_initial_layer] BED_TEMP=[bed_temperature_initial_layer_single]
  ```
  Or  
  ![image](https://github.com/user-attachments/assets/9e6ce605-e440-43f7-b222-e4b80bbe9e1c)
  ```
  PRINT_START BED_TEMP=[bed_temperature_initial_layer_single] EXTRUDER_TEMP=[nozzle_temperature_initial_layer]
  ```
- This Script does not accept G2 and G3 in G-Code.
- Time Estimation is based in Klipper Look-ahead kinematics (may not be compatible with Marlin or Others).
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- Generated G-Code are 30% to 80% larger than the original one due to Temp and Speed adjustment (can be optimized).
- This Script is currently only available for Windows OS.  
  
# Usage  
The script will popup once you Print or Export the G-Code from the Slicer, ask the user whether the script will be applied or not.   
  
![image](https://github.com/user-attachments/assets/bc99c01b-8b20-4b9d-93db-1dcb62fbf9b0)  
  
If yes:  
the first execution, Klipper_Estimator script requires a file containing the maximum limits of the printer (config .json), can be obtained by specifying the IP address of the printer or by choosing a file locally. If the printer is not the same you must change this file, then click the PROCEED button again.  
![image](https://github.com/user-attachments/assets/556fa311-cc68-42a5-af34-4261462935a0)  
  
![image](https://github.com/user-attachments/assets/2a316ba8-124d-48d5-83b1-3a6184aa189e)  
  
The Filament Type and these specific parameters are chosen automatically by the script if (PLA, PETG, ABS, TPU, ASA, HIPS), You need to set the appropriate values ​​according to your extruder limits, then save the changes for next uses.  
  
![image](https://github.com/user-attachments/assets/9a22f3d6-48f9-4ad8-88cf-367612a0f3e9)  
  
  
You need to refresh the view if you make changes in the script before generating the G-Code, then Save and Close.  

Below the Generated G-Code 
  
![image](https://github.com/user-attachments/assets/429905cd-ca65-460c-a007-34aeaac27f89)  
  
![image](https://github.com/user-attachments/assets/1e2a2662-a90d-4907-9d88-2e990a25197e)  
  
# Observations  
- Printers with higher accelerations and lower heating/cooling time will have a better result with this approach because it allows for better flow stabilization.
- The speed of the outer wall is always higher than the speed of the inner wall because of the deferent Line width.
![image](https://github.com/user-attachments/assets/76acb2cf-f57e-4a38-b1c7-788689ed6470)![image](https://github.com/user-attachments/assets/52b5714b-5607-45f5-adc7-73b9782b6bcc)  
- With a resonable Edeal Flow/Temperature calibration, the same good quality is achieved with the majority of filament brands, without any changes in the script.  
  
Be responsible and careful with this Script by using reasonable values ​​and monitoring the behavior of your printer.  
I look forward to your feedback and remain available and open to new proposals.  
  
# Future Version 
V1.1 will be released in few days :)  
  
![image](https://github.com/user-attachments/assets/a1a34997-d915-4d9b-ae01-43555ed32e19)  
  
New features :  
- Create custom filament profiles for different extruders/printers.
- View the generated G-Code and the real Temperature changes during the new estimated Time.
- Have the ability to use the M109 G-Code command to set the initial temperature instead of the Macro PRINT_START.
- ...More.
  
With this Script Concept, you could print any object with 0 Slicer Settings and have the best Speed/Quality Optimization, even in a 2018 Klipperized 3D printer and a nice inexpensive filament!  
  
https://www.thingiverse.com/thing:1272741. 
  
![image](https://github.com/user-attachments/assets/2ecd51bd-e556-4718-8752-9de2fd78ac69)  
  
https://github.com/user-attachments/assets/897c4a37-20b5-4e1e-a57e-ddd5e81f7877  
  
https://github.com/user-attachments/assets/ea2f2d75-cc8c-4dfc-b89d-0f82fd9bf17a  
  
# About the Developer 
By Salim BELAYEL.  
Developed in June 2024 with Delphi 12 Community Edition.  
Email : sb53systems@gmail.com  
  
![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)  
  
Happy Smart 3D Printing :-)  
  
If you find my work worthy, Bay me a coffee. Thank you.  
(Use the Co-Fi link bellow instead of the Script URL)
  
[![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53system)
 [Co-fi](https://ko-fi.com/sb53system) 


