![image](https://github.com/user-attachments/assets/b5b84ecc-84e5-4583-97c8-efdcdf985504)  
# G-Code Flow and Temperature Controller
A Post Processing Script for Orca Slicer and Klipper 3D Printers.  
  
This free and open-source script demonstrates the effectiveness of automatically adjusting nozzle temperatures and flow rates during 3D printing. Its goal is to optimize both quality and speed while simplifying the printing process.  
Although it’s not a definitive solution, I believe that integrating this concept into slicers would significantly enhance its efficiency.  
  
This approach is based on my personal approach and minimal Delphi programming skills.  
I think that the filament gradually absorbs energy in the hotend and should be extruded at an ideal final temperature.  
  
The script adjusts the temperature based on the average flow rate that can be reached during printing, and then changes the G-code speed to align with the optimal flow rate for that temperature.  
  
I understand that this concept may seem unconventional, but I believe that 3D printing can be less complex than it seems. My setup allowed me to achieve optimal speed and quality with the same slicer settings, even with an old 3D printer using Klipper and affordable filament.  
  
![IMG20240927152206](https://github.com/user-attachments/assets/5de13b9c-2930-4809-b027-79e65188029b)  
  
See my ORCA Slicer [Settings](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/My_Config.md) :gear:  
  
See the [Print Samples Discussion](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/discussions/8) :bulb:  Share yours.  
  
I encourage you to test, share, and further develop this concept, as I believe it/or a similar approach will shape the future of 3D printing. With AI, 3D printing could become accessible to everyone.  
  
Please use this script responsibly and with caution, applying reasonable values and closely monitoring your printer's behavior.  
  
I welcome your feedback and am open to any new proposals.  
Happy Smart 3D Printing :)  
  
If you find my work worthy, Bay me a [![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53system) or give this project a :star:. Thank you...  
   
# Video that speak about the project on Youtube
Variable Temperature 3D Printing – The FUTURE of 3D Printing? (By PRINTING PERSPECTIVE):  
https://www.youtube.com/watch?v=P6Y8uUPd3yg  
  
# Latest Release
[SB53 G-Code Flow/Temperature Controller V1.1 Beta](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/releases/tag/V1.1Beta) (updated October 08 2024)  
You can retain your old script configuration after an update by using the "/Config" folder from the previous version. Simply replace the files "SB53-Systems.exe" and "Klipper_estimator.exe.". Note that the final version 1.1 will include a different Klipper_Estimator script.  
  
# Next Features
- Add an explainer video on youtube and instructions on how to use it.
- Add support for Marlin and RepRap Firmware.
- Add support for G2 and G3 commands. (Latest beta update already supports G2 and G3, The generated G-Codes are good but the temperature displayed on the interface is not yet aligned)
  ![image](https://github.com/user-attachments/assets/245919f9-dc4d-4312-8b64-28d6fa29fb11)
  
# Instructions and Prerequisites  
1. The script can be utilized as a standard program by running the SB53-Systems.exe file and manually opening a G-Code file, or by integrating it into the slicer as a post-processing script.  
```
D:\SB53_G-Code_Flow_Temperature_Controller_V1.1Beta\SB53-Systems.exe;
```  
![image](https://github.com/user-attachments/assets/3557a6ff-524f-4964-9cd2-044b01f46faa)  
  
2. Included [Klipper_Estimator.exe](https://github.com/Annex-Engineering/klipper_estimator) script (V 3.7.3). Using Klipper Look-Ahead kinematics, it estimate the time and the average flow rate for each move in the G-Code (+/- 1s total time). This file is required and must be in the same Folder with this Script.
  ![image](https://github.com/user-attachments/assets/30449359-fabd-4b3d-9593-523db606c0c1)
  
3. Changing the initial layer temperature is important, the script automatically modifies the G-Code "M109 S" command or changes the specified print start macro. Example Below :  
![image](https://github.com/user-attachments/assets/26b1e09e-0750-43f6-995f-8671da5838e0)  
![image](https://github.com/user-attachments/assets/a3c814af-4522-4177-907c-7aab631505f7)  
  
4. The initial temperature estimated by the Script depends on the speed of the first moves of the G-Code, you can adjust it by fixing the speed of the purge line or the speed of the first layer perimeters.  
  
5. To have a best Speed/Quality Optemization, the Slicer Profil must be set for Max Moves and Max Volumetric Speed. The Nozzle temperature is not important because it will be reset in the script, and the speed will be reduced (not increased) to the Recommended Flow.  
  
  Example below with my max 200mm/s Printer speed : (Same profil for PLA, PETG and ABS)  
    
  ![image](https://github.com/user-attachments/assets/c0a30aed-046a-48ad-b819-93def3b28de5)  
  
The speed of overhangs and small internal/external bridges should be set to the maximum speed, this will ensure that the filament is extruded at the recommended flow rate and that it is not too hot and falls off, or too cold and shrinks, also avoiding sudden flow changes and unnecessary temperature drops caused by the average flow calculated by the script.  
![image](https://github.com/user-attachments/assets/050be022-7cef-47ff-b1aa-15f8b5134dce)  
  
For larger bridges, I use "Thick Bridges" in Orca Slicer and a single 5015 radial fan for part cooling, there is not much deference between a 60mm bridge at 30mm/s and another at 100mm/s, and since I don't print a lot of wide bridges, I prefer to keep an automatic speed.  
You can use a modifier (or more than one) in the slicer that changes the speed of a few lower layers to the bridge, this Approach can only be optimized if it is included in the Slicer, the temperature and speed should gradually decrease to the desired bridge speed. Example bellow for 50mm/s External Bridge speed.  
![image](https://github.com/user-attachments/assets/51f2cba4-d57d-4ea7-8ef7-d0c36dd61dc0)   
![image](https://github.com/user-attachments/assets/1cee9879-389b-4117-9048-b96c76e51891)  
  
You have to set your filament settings:
  - The maximum recommended volumetric speed at the maximum temperature that your Hotend or Filament can handle.
  - The Fan Cooling perdiode and the Min print speed, according to the Filament and your cooling configuration.
  - ...
  
![image](https://github.com/user-attachments/assets/5dc1f64d-48dc-4d39-8290-ad8251267990)  
![image](https://github.com/user-attachments/assets/c07c5e7c-b137-4af3-86b6-efeaecdc06cc)  
  
[See my Bridge test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Bridges_Test.md)  
  
[See my overhangs test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Overhangs_Test.md)  
  
Note that :  
- The script is specifically programed to only reduces the speeds above the recommended flow rate (according to layer height and line width), lower speeds will be kept as in the G-Code (Slicer speed).   
- Hotend PID cannot be changed during print in Klipper, I recommend using PID values for a temperature between 70-90% of the maximum temperature.  
- PA can be regulated in the script according to the temperature, or not and use the fixed PA from the Slicer or Klipper by unchecking the Adjust PA option befor generating the G-Code.  
- Changing the PA during printing forms bubbles in the walls, the Script is programed to change PA only in Sparse infill, Internal solid infill, Support and Internal Bridge.  
![351913375-991fe2b8-3935-46ff-816e-5b0aee981b4d](https://github.com/user-attachments/assets/602b96a8-2666-44bd-b70f-aa5c06deadd4)  
  
- This script does not support Multi-Tool and Multi-Material printing.  
- Ironing is not recommanded with this Script, it will affect the desired result and the printing time.
- Adaptive pressure advance is not compatible with the concept of this script.  
- Delta printers kinematic limits are not supported with the current version of Klipper_Estimator.  
- Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
- Processing G-Code with Arc moves will take longer, because the Klipper Estimator script will cut them into small segments based on the parameter "mm_per_arc_segment": 0.1
- The generated G-Code is 20/50 % larger than the original one due to Temp and Speed adjustment.
- This Script is currently only available for Windows OS. With delphi 12 and a few changes in the source code, it can be compiled for other operating system (I can help for this, or can do it later!).  
  
# Ideal Flow/Temperature Calibration
Note that this method is not useful with non-shiny filaments or that do not change color, other advanced solutions will be necessary to determine the ideal values, such as layer adhesion or dimensional accuracy or the final temperature of the extruded filament or...  
  
The visual calibration method (useful for PETG,PLA,...) involves choosing the desired appearance (closest to the original filament) over 3-5 prints: 
- A Cylinder in Vase mode for higher flow rate. You can use the max Layer Height and max Line Width, you should limit the maximum volumetric speed to the desired flow rate test, and start with the maximum recommended temperature, then reduce the temperature manually and gradually during printing. ; Must be done without the script  
- And very small prints for (0 to 3)mm3/s. (a 3DBenchy at 20/30 % Scale!) ; Must be done with the Script  
  
This process could be optimized with an automatic and much more accurate solution!!!  
A sensor like an infrared thermometer (MLX90614 or better) capable of accurately tracking the temperature of the extruded filament (in air or during print), with a real-time script that controls the Flow and the Temperature, starting with max flow rate and max temperature going all the way down to 1mm3/s, and record the values ​​where the filament is extruded at the desired temperature.  
  
Filament vendors should provide only one Ideal Temperature!  
  
I launch the competition to makers, to find a precise, less expensive and easy to use solution on the majority of 3D printers :)  
See my [Ideal Flow Vs Hotend Temperature Calibration](https://github.com/sb53systems/Flow_Temperature_Calibration) Project on Github.  
  
I would love to hear your suggestions in the discussions section.  
  
# Observations and Tips
- A printer with higher accelerations and lower hotend heating/cooling time, will have a better result with this approach because it allows for better flow stabilization (Quality) and Higher Max/Average Flow (Speed).  
- With a resonable Edeal Flow/Temperature calibration, the same good quality is achieved with the majority of filament brands without any changes in the script.  
- You can reduce the speed of the cooling fan during the entire printing process (Except for Bridges and Ovehangs).  
- With some prints, changing the Max/Average Smoothing value may affect the result and print time, you have to experiment yourself (I recommend values between 10 and 30).  
- Aim for speed optimization as long as it doesn't affect the desired quality, usually the printing time will only vary by a few minutes.  
- If your filament is very sensitive and you need to reduce the speed for overhangs or small features in between large features, aim for quality optimization to reduce flow variation.  
- Fuzzy Skin, Variable_Layer_Height and Scarf_Joint_Seam: can cause print delay due to frequent flow changes.  
- The outer wall speed is greater than the inner wall speed due to a deferent line width. This script will adapt the speed to any line width and layer height, making it very effective for Variable_Layer_Height and Precise_Z_Height.  
![371310408-26026ed0-d97e-4423-9d84-68c5b2a863e8](https://github.com/user-attachments/assets/e83fd21d-e34a-4def-869d-c62838b0b8b3)  
![image](https://github.com/user-attachments/assets/2fe5dd0f-008a-400b-9fa9-10228bf07b40)  
  
# Usage  
The script will popup once you Print or Export the G-Code from the Slicer, ask the user whether the script will be applied or not.   
  
![image](https://github.com/user-attachments/assets/f1589c73-8261-4171-89c9-ff0ca416f5fb)  
  
If yes, the first execution:  
- You have to set the appropriate Extruder/Printer values.
- Klipper_Estimator script requires a file containing the maximum limits of the printer (config .json), can be obtained by specifying the IP address of the printer or by choosing a file locally. You have to set this file for each preset.  
  Config.json file Example below.  
  ```
  {
  "max_velocity": 400.0,
  "max_acceleration": 10000.0,
  "minimum_cruise_ratio": 0.5,
  "square_corner_velocity": 5.0,
  "instant_corner_velocity": 1.0,
  "mm_per_arc_segment": 0.1,
  "move_checkers": [
    {
      "axis_limiter": {
        "axis": [
          0.0,
          0.0,
          1.0
        ],
        "max_velocity": 5.0,
        "max_accel": 200.0
      }
    },
    {
      "extruder_limiter": {
        "max_velocity": 106.43243214765772,
        "max_accel": 2660.8108036914427
      }
    }
  ]
  }
  ```  
- After saving the Extruder/Printer preset, you need to select the filament type, then set the filament values (start with 1mm3/2) and save with a specific name (for each Extruder).
  ![image](https://github.com/user-attachments/assets/9b6c98a9-0847-4118-a9d6-f37696be13a9)
- In subsequent uses, the script can recognize the Extruder/Printer and Filament used, if they are written with the same name as in the slicer (Copy and Paste).  
  ![image](https://github.com/user-attachments/assets/7b467275-4bed-4927-adc6-0a6306d95de6)![image](https://github.com/user-attachments/assets/0219a6d0-63d1-4b7e-b465-d45c74db0d49)  
  ![image](https://github.com/user-attachments/assets/58a4ac0d-620c-4715-9b16-e55401641720)![image](https://github.com/user-attachments/assets/fefd7247-1c32-4f94-a1b5-1fc3124d0812)  
- If you make any changes to the script, be sure to refresh the estimation and then regenerate the G-Code.  
  ![image](https://github.com/user-attachments/assets/50612330-e3c0-4bee-b368-66a5f3641955)  
  
# 3DBenchy Example
![image](https://github.com/user-attachments/assets/8df25619-d150-45b3-bf7f-3fa152b2f433)  
![image](https://github.com/user-attachments/assets/2b55cdb2-9b2d-41b1-9267-ed09f8aefce4)  
  
Below is the Generated G-Code 
  
![image](https://github.com/user-attachments/assets/5e1f1f21-afda-491c-8213-7d0b82128bc2)  
![IMG20240927023059](https://github.com/user-attachments/assets/c6c46ea2-3909-4eb6-8e2d-ce51e23e7ebf)  
  
# About this Repository
![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)  
By Salim BELAYEL.  
This project began in June 2024 and was developed using Delphi 12 Community Edition.  
Email : sb53systems@gmail.com  
  
[![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53system) [Support](https://ko-fi.com/sb53system)
