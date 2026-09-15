# KSP Falcon 9 kOS Telemetry Display
- A **kOS script** that adds a telemetry display for **Tundra Exploration's Falcon 9**
- Future updates will feature displays for both the booster and 2nd stage. But for now, only the booster has it.

<img width="656" height="240" alt="F9_Telemetry_Display_Demo" src="https://github.com/user-attachments/assets/e99df26d-faed-4e1c-acd9-51b3495b0318" />

## DEPENDENCIES
- **Tundra Exploration**
- **Kerbal Operating System (kOS)**

> [!IMPORTANT]
> - This script might break on displays other than 1080p. RO or RSS might also break the script. Otherwise, this script should function normally. If anything pops up, feel free to contact me on Tundra Exploration's Discord or file a an issue here. 

## The telemetry script adds:
- **SPEED** (KM/H)
- **ALTITUDE** (KM)
- **ATMOSPHERIC PRESSURE & DYNAMIC PRESSURE** (in atmospheres or ATM)
- **FUEL BARS** (%) 
- **OCTAWEB ENGINE DISPLAY** (9 engines, 3 engines, and 1 engine)
- **THRUST** (kN & MN)
- **THROTTLE** (%)
- **G-FORCE** (G)
- **TWR** 

## How to install 
- Download the script
- Open the archive and look for a folder named "Ships"
- Paste the "Ships" folder inside your specific KSP directory
- Open KSP and go to the VAB/HANGAR
- Search for "kOS" (any kOS CPU should work, but I decided to go with KAL9000)
- Make sure to have the "Falcon 9/Heavy Full Thrust First Stage Tank" and "Falcon 9/Heavy Full Thrust Octoweb" as parts for this script to work properly. If you're not using the realnames configuration for Tundra Exploration, instead use "Ghidora 9/Heavy" for "Falcon 9/Heavy"

<img width="264" height="286" alt="Step 1-2" src="https://github.com/user-attachments/assets/c0617057-fad2-4a01-ad90-49c013f3a34b" />

- Place the kOS CPU anywhere on your Falcon 9 Booster (**NOT THE SECOND STAGE**)
- Right click on the CPU and look for "Boot File"
   
<img width="798" height="537" alt="Step 3-4" src="https://github.com/user-attachments/assets/a0ae79b6-ee89-47a1-8f21-ba5235543d43" />

- Click left or right to find "F9_Booster_Telemetry.ks"
    
<img width="298" height="466" alt="Step 5" src="https://github.com/user-attachments/assets/5e593899-11e6-43ba-b59d-3fd937ec9a34" />

- The telemetry will activate once you start generating thrust or your speed is above 0
- Final step, load the craft, and enjoy!
