![image](https://github.com/user-attachments/assets/b5b84ecc-84e5-4583-97c8-efdcdf985504)  
# G-Code Flow and Temperature Controller
A free and open-source post-processing script for `Orca Slicer` that shows how automatically adjusting nozzle temperatures and flow rates can improve both `Quality` and `Speed` while simplifying the `Slicer settings`.  
  
This concept is based on my personal approach and minimal `Delphi` programming skills.  
Although it’s not a definitive solution, as I believe that integrating this concept into slicers would significantly enhance its efficiency and allow more advanced features.  
  
I think that the filament gradually absorbs energy in the hotend and should be extruded at an ideal final temperature.  
This script adjusts the temperature based on the average flow rate that can be reached during printing, and then changes the G-code speed to align with the optimal flow rate for that temperature.  
This will adapt the nozzle temperature for different sections and geometries of the print, while ensuring that the filament is extruded at an ideal speed.  
  
I know this concept might seem unconventional, but with my setup, it helps me achieve optimal speed and quality with the same slicer settings—even using an old 3D printer with Klipper and affordable filament. In fact, I’ve stopped printing without it.  
  
![IMG20240927152206](https://github.com/user-attachments/assets/5de13b9c-2930-4809-b027-79e65188029b)  
  
See my `ORCA Slicer` [Settings](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/My_Config.md) :gear:  
  
See the [Print Samples Discussion](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/discussions/8) :bulb:  Share yours.  
  
I believe that 3D printing can be less complex than it seems. I encourage you to test, share, and further develop this concept, as I believe it/or a similar approach will shape the future of 3D printing. With a bit of `AI` 3D printing could become accessible to everyone.  
  
:warning: Please use this script responsibly and with caution, applying reasonable values and closely monitoring your printer's behavior.  
  
I welcome your feedback and am open to any new proposals.  
### `Happy Smart 3D Printing :)`  
  
### If you find my work worthy, Bay me a [![image](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/a504ac44-082d-40f1-a9d0-4abc3da242d8)](https://ko-fi.com/sb53system) or give this project a :star:. Thank you :rose:  
  
# Latest Release
### [SB53 G-Code Flow/Temperature Controller V1.1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/releases/tag/V1.1) (updated October 29 2024)  
### Addons:
- Compatibility with all Firmware.
- Arcs moves support.
- Improve GCode reading and generation time with a custom Klipper_Estimator script.
  
You can retain your old script configuration after an update by using the "/Config" folder from the previous version. Simply replace the files "SB53-Systems.exe" and "Klipper_estimator.exe.". Note that the final version 1.1 include a different Klipper_Estimator script.  
  
# Next Features
- Add an explainer video on youtube and instructions on how to use it.
- Allow more advanced optimization for different printing features. (EX: Overhangs, Outer wall, Bridges, ...more)
  
# Instructions and Prerequisites  
1. The script can be used as a standard program by running the SB53-Systems.exe file and manually opening a G-Code file, or by integrating it into the slicer as a post-processing script.  
    ```
    D:\SB53_G-Code_Flow_Temperature_Controller_V1.1\SB53-Systems.exe;
    ```  
    ![image](https://github.com/user-attachments/assets/722d57b1-6568-4317-ba3f-5873c66e221c)  
  
2. Included a [Custom](https://github.com/sb53systems/klipper_estimator) version of [Klipper_Estimator V 3.7.3](https://github.com/Annex-Engineering/klipper_estimator). An accurate tool that uses `Klipper Look-Ahead kinematics` to estimate the time and average flow rate for each move in the G-Code. (+/- 1s total time for Klipper Firmware). The mechanism is very close to other Firmwares (+/- 5% if used correctly).  
   Note that the file `\Klipper_estimator.exe` (already included) is required and must be in the same Folder with this Script.  
   ![image](https://github.com/user-attachments/assets/30449359-fabd-4b3d-9593-523db606c0c1)  
  
3. Editing the `first layer temperature` is important, the script can :
    ### - Using a Start Print Macro (Klipper):
    Modify the specified print start macro. Example Below  
    ![image](https://github.com/user-attachments/assets/26b1e09e-0750-43f6-995f-8671da5838e0)  
    ![image](https://github.com/user-attachments/assets/a3c814af-4522-4177-907c-7aab631505f7)  
    ### - Using "M109 S":
    Edit the GCode command "M109 S" provided that it is preceded by the comment "; Temp_To_Edit". Example Below  
      ```
       ; Temp_To_Edit
      ```  
      ![image](https://github.com/user-attachments/assets/a51b55dc-831b-48e2-88e8-18b2c99c3222)  
    
    You also need to add the comment "; PRINT_END" at the start of the `Machine end G-code`, this will allow the script to avoid the print end Moves. Example Below
      ```
       ; PRINT_END
      ```  
      ![image](https://github.com/user-attachments/assets/05d7ba2e-c3fc-43bc-971b-691dd6e5ff86)  
  
4. The initial temperature estimated by the Script depends on the speed of the first moves of the G-Code, you can adjust it by fixing the speed of the purge line or the speed of the first layer perimeters.  
  
5. To have a best Speed/Quality Optemization, the Slicer Profil must be set for Max Moves and Max Volumetric Speed. The Nozzle temperature is not important because it will be reset in the script, and the speed will be reduced (not increased) to the Recommended Flow.   
    Example below with my max 200mm/s Printer speed : (Same profil for `PLA, PETG and ABS`)  
    
    ![image](https://github.com/user-attachments/assets/c0a30aed-046a-48ad-b819-93def3b28de5)  
  
    The speed of `overhangs` and small `internal/external bridges` should be set to the maximum speed, this will ensure that the filament is extruded at the recommended flow rate and that it is not too hot and falls off, or too cold and shrinks, also avoiding sudden flow changes and unnecessary temperature drops caused by the average flow calculated by the script.  
    ![image](https://github.com/user-attachments/assets/050be022-7cef-47ff-b1aa-15f8b5134dce)  
    [See my overhangs test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Overhangs_Test.md)  
  
    For larger bridges, I use `Thick Bridges` in Orca Slicer and a single 5015 radial fan for part cooling, there is not much deference between a 60mm bridge at 30mm/s and another at 100mm/s, and since I don't print a lot of wide bridges, I prefer to keep an automatic speed.  
    [See my Bridge test examples.](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/blob/main/Bridges_Test.md)  
  
    You can use a modifier (or more) in the slicer that changes the speed of a few lower layers to the bridge, the temperature and speed should gradually decrease to the desired bridge speed. Example bellow for 50mm/s External Bridge speed. (This approach can only be optimized when it is integrated into the Slicer)  
    ![image](https://github.com/user-attachments/assets/51f2cba4-d57d-4ea7-8ef7-d0c36dd61dc0)   
    ![image](https://github.com/user-attachments/assets/1cee9879-389b-4117-9048-b96c76e51891)  
  
6. You have to set your filament settings:
    - The maximum recommended volumetric speed at the maximum temperature that your Hotend or Filament can handle.
    - The Fan Cooling perdiode and the Min print speed, according to the Filament and your cooling configuration.
  
    ![image](https://github.com/user-attachments/assets/5dc1f64d-48dc-4d39-8290-ad8251267990)  
    ![image](https://github.com/user-attachments/assets/c07c5e7c-b137-4af3-86b6-efeaecdc06cc)  
  
### Note that :  
  - The script is specifically programmed to reduce speeds only when they exceed the recommended flow rate (based on layer height and line width), while lower speeds will remain as set in the G-Code (Slicer speed).
  - The script does not display the temperature curve in the generated G-Code Chart if Arcs moves are used. This is due to the integration and interpretation of the Klipper_Estimator output.
  - PA can be adjusted based on temperature only for Klipper firmware. For other firmwares you need to uncheck the Adjust PA option.  
  - Changing PA while printing can cause bubbles in the walls. The script is programmed to adjust PA only in sparse infill, internal solid infill, support, and internal bridges.  
  ![351913375-991fe2b8-3935-46ff-816e-5b0aee981b4d](https://github.com/user-attachments/assets/602b96a8-2666-44bd-b70f-aa5c06deadd4)  
  
  - This script doesn't support multi-tool or multi-material printing.
  - For `Bambu 3D Printers`, you need :
    - To save the G-Code generated in Orcaslicer to a `memory card` or `USB drive`, and then print from there instead of starting the print directly from the slicer.
    - Avoid Flow calibration before printing and first layer inspection.
  - Ironing is not recommended with this script, as it can affect the desired results and increase printing time.  
  - Adaptive pressure advance is not recommended with this script.  
  - Delta printers kinematic limits are not supported with the current version of Klipper_Estimator.  
  - Reading or generating large G-Code files with this Script can takes up to 2 minutes, depending in your CPU.
  - Processing G-Code with Arc moves will take longer, because the Klipper Estimator script will cut them into small segments based on the parameter `"mm_per_arc_segment": 0.1`.
  - The generated G-Code is 10/30 % larger than the original one due to Temp and Speed adjustment.
  - This script is currently only available for `Windows OS`. With `Delphi 12` and some changes to the source code, it can be compiled for other operating systems (I can help with this or do it later!).  
  
# Ideal Flow/Temperature Calibration
The visual calibration method (effective for PETG, PLA, etc.) involves selecting the desired appearance (closest to the original filament) over 3 to 5 prints:  

  1. Print a cylinder in vase mode: This allows for a higher flow rate. You can use the maximum layer height and maximum line width, while limiting the maximum volumetric speed to the desired test flow rate. Start with the maximum recommended temperature, then manually and gradually reduce the temperature during printing. (This step should be done without the script.)  
  2. Small prints for flow rates of (0 to 3) mm³/s: For instance, print a 3DBenchy at 20/30% scale. (This step should be done with the script.)  
  
Note: This method is not suitable for non-shiny filaments or those that do not change color. To determine the ideal values, other advanced solutions will be necessary, particularly for assessing layer adhesion, dimensional accuracy, or the final temperature of the extruded filament.  
  
The calibration process could be optimized with a more accurate automatic solution. Using a sensor, such as an infrared thermometer (MLX90614 or similar), capable of accurately tracking the temperature of the extruded filament (in air or during printing), along with a real-time script that controls the flow and temperature, could start at the maximum flow rate and temperature, gradually reducing down to 1 mm³/s, while recording the values at which the filament is extruded at the desired temperature.  
  
It would be ideal for filament vendors to provide just one ideal temperature!  
  
See my [Ideal Flow Vs Hotend Temperature Calibration](https://github.com/sb53systems/Flow_Temperature_Calibration) Project on Github.  
  
I challenge makers to find a precise, cost-effective, and user-friendly solution for the majority of 3D printers. :)  
  
# Observations and Tips
  - I recommend that you calibrate your PID values ​​for a temperature between 70% and 90% of the maximum temperature.  
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
  - You have to set the appropriate `Extruder/Printer` values.
  - `Klipper_Estimator` script requires a file containing the maximum limits of the printer `(config .json)`.
    - For Klipper, you can get this file by entering the printer's IP address or by selecting a local file.
    - For other firmware, you'll need to edit the file manually and input the equivalent values.  
    Note that You have to set this file for each `Printer/Extruder` preset.  
    Config.json file Example:  
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
  - After saving the `Extruder/Printer` preset, you need to select the `filament type`, then set the filament values (start with 1mm3/2) and save with a specific name. (for each Extruder)  
    ![image](https://github.com/user-attachments/assets/9b6c98a9-0847-4118-a9d6-f37696be13a9)  
    
  ### Note that:
  - In subsequent uses, the script can recognize the `Extruder/Printer` and `Filament` used, if they are written with the same name as in the slicer (Copy and Paste).  
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
  
# Video that speak about the project on Youtube
### - Variable Temperature 3D Printing – The FUTURE of 3D Printing? (By PRINTING PERSPECTIVE):  
  https://www.youtube.com/watch?v=P6Y8uUPd3yg  
  
# About this Repository
### By Salim BELAYEL.  
This project began in June 2024 and was developed using `Delphi 12 Community Edition`.  
Email : sb53systems@gmail.com  
  
![SB53-Systems~1](https://github.com/sb53systems/G-Code-Flow-Temperature-Controller/assets/33290411/b94703a1-cf21-4109-bfa6-b9bcff438a1d)  
