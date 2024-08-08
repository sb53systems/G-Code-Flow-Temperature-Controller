# G-Code-Flow-Temperature-Controller
A Post Processing Script for Slic3r based Slicers and Klipper Printers.  
  
This 3D Printing Concept is Based on my personal approach and with a minimum of Delphi programming skills.

This Script is free and open source, created to prove the effectiveness of automatic nozzle temperature change during 3D printing in order to get the best Quality/Speed Optimization, but it is not intended to be a definitive solution as I believe that integrating this concept in slicers will be more effective.  
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
  
Example below with my max 200mm/s Printer speed :  
![image](https://github.com/user-attachments/assets/a4ca7c48-0c74-4015-809b-102f71577593)
![image](https://github.com/user-attachments/assets/2aa450c6-984d-432c-890e-d0d0ada0d7a4)
![image](https://github.com/user-attachments/assets/5fe20af1-0578-4427-8b64-13d13cb48050)  
  
Note that :  
- The script only reduces the speeds above the recommended speed, lower speeds will be kept as in the G-Code.
- Hotend PID cannot be changed when printing in Klipper, I recommend using PID values for a temperature between 70-90% of the maximum temperature.  
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
The script will open once you Print or Export the G-Code from the Slicer and ask the user whether the script will be applied or not.   
  
![image](https://github.com/user-attachments/assets/bc99c01b-8b20-4b9d-93db-1dcb62fbf9b0)  
  
If yes: the first execution, Klipper_Estimator script requires a file containing the maximum limits of the printer (config .json), can be obtained by specifying the IP address of the printer or by choosing a file locally. If the printer is not the same you must change this file, then click the PROCEED button again.  
![image](https://github.com/user-attachments/assets/556fa311-cc68-42a5-af34-4261462935a0)  
  
![image](https://github.com/user-attachments/assets/2a316ba8-124d-48d5-83b1-3a6184aa189e)  
  
The Filament Type and these specific parameters are chosen automatically by the script if (PLA, PETG, ABS, TPU, ASA, HIPS), You need to set the appropriate values ​​according to your extruder limits, then save the changes for next uses.  
  
![image](https://github.com/user-attachments/assets/abbbcbaf-3396-487f-aa31-3f8dbe1ec0b1)  
  
You need to refresh the view if you make changes in the the script before generating the G-Code, then Save and Close.  

Below the Generated G-Code for 0.2mm Layer Height  
  
![image](https://github.com/user-attachments/assets/d429f7a3-7a2b-4ee2-bf72-f8d0e1daca1b)  
![image](https://github.com/user-attachments/assets/9bfd7ebc-ecfe-4873-93a2-4b5da9b8561e)  
  
Next the Generated G-Code for 0.3mm Layer Height  
  
![image](https://github.com/user-attachments/assets/abd70604-c2e3-4a6d-81d9-8bc45fa03e47)  
![image](https://github.com/user-attachments/assets/6c0cc21e-4f42-4756-98d4-9869bbed3a5d)  
  
Be responsible and careful with this Script by using reasonable values ​​and monitoring the behavior of your printer.  
I look forward to your feedback and remain open to new proposals.  
  
Happy Smart 3D Printing :-)  
  
# About the Developer :
By Salim BELAYEL.  
Developed in June 2024 with Delphi 12 Community Edition.  
Email : sb53systems@gmail.com  

![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)  

  
If you find my work worthy, Bay me a coffee. Thank you.  
  
[![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53systems)
 [Co-fi](https://ko-fi.com/sb53systems) 


