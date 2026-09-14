//Checking dependencies
check().
startup().

//Pre start variables
set Shutdown_GUI to false.
set previous_time to time:seconds.
set previous_velocity to ship:velocity:orbit.
set kerbin_mu to body:mu.
set time_offset to 0.025.
set radius_k to body:radius.
set mass_k to body:mass. 
lock local_g to (constant:G*mass_k)/(radius_k + alt:radar)^2.
set ORANGE to RGB(255, 160, 0).

//GUI
local g is GUI(450).   
    set g:style:normal:bg to "GUI V3/Body.png".
    set g:style:height to 275.
    set g:style:width to 665.
    set g:style:overflow:bottom to 5.
    set g:x to 2.
    set g:y to 791.

local Title is g:addlabel().
    set Title:style:normal:bg to "GUI V3/Title.png".
    set Title:style:wordwrap to false.
    set Title:style:height to 30.
    set Title:style:width to 240.
    set Title:style:overflow:bottom to 48.
    set Title:style:overflow:top to -40.
    set Title:style:overflow:left to 0.500.

local Title_Name is g:addlabel("STAGE 1").
    set Title_Color to RGBA(0.8, 0.8, 0.8, 1).
    set Title_Name:style:fontsize to 26.
    set Title_Name:style:padding:left to 60.
    set Title_Name:style:padding:top to 14.5.
    set Title_Name:style:textcolor to Title_Color.
    set Title_Name:style:font to "calibri".

set MainBox to g:addhbox().
set HorizontalPlace to MainBox:addhlayout().
set Text_Based_GUI to HorizontalPlace:addvlayout().
set Fuel_Levels_GUI to HorizontalPlace:addhlayout().
set MainBox:style:bg to "".
set Text_Based_GUI:style:bg to "".
set Text_Based_GUI:ENABLED to true.
set HorizontalPlace:style:bg to "".
set Fuel_Levels_GUI:style:bg to "".

local VLine_1 to HorizontalPlace:addlabel().
    set VLine_1:style:normal:bg to "GUI V3/Vertical_Line.png".
    set VLine_1:style:overflow:top to 25.
    set VLine_1:style:overflow:bottom to 200.
    set VLine_1:style:overflow:left to 235.
    set VLine_1:style:overflow:right to -405.
    set VLine_1:style:wordwrap to false.

//Text Based GUI
local Data_1_Text to Text_Based_GUI:addlabel("SPEED").
    set Data_1_Text:style:textcolor to WHITE.
    set Data_1_Text:style:margin:top to 12.
    set Data_1_Text:style:padding:left to 10.
    set Data_1_Text:style:font to "calibrib".
    set Data_1_Text:style:fontsize to 21.
    set Data_1_Text:style:wordwrap to false.
    set Data_1_Text:style:width to 1.
    set Data_1_Text:style:align to "LEFT".

local Data_1_Unit to Text_Based_GUI:addlabel("KM/H").
    set Data_1_Unit:style:textcolor to WHITE.
    set Data_1_Unit:style:padding:top to -28.5.
    set Data_1_Unit:style:padding:left to 170.
    set Data_1_Unit:style:font to "calibrib".
    set Data_1_Unit:style:fontsize to 20.
    set Data_1_Unit:style:wordwrap to false.
    set Data_1_Unit:style:width to 1.
    set Data_1_Unit:style:align to "LEFT".

local Data_1 to Text_Based_GUI:addlabel().
    set Data_1:style:textcolor to WHITE.
    set Data_1:style:padding:top to -27.5.
    set Data_1:style:padding:right to -165.
    set Data_1:style:font to "calibrib".
    set Data_1:style:fontsize to 21.
    set Data_1:style:wordwrap to false.
    set Data_1:style:width to 1.
    set Data_1:style:align to "RIGHT".

local Data_2_Text to Text_Based_GUI:addlabel("ALTITUDE").
    set Data_2_Text:style:textcolor to WHITE.
    set Data_2_Text:style:margin:top to 17.
    set Data_2_Text:style:padding:left to 10.
    set Data_2_Text:style:font to "calibrib".
    set Data_2_Text:style:fontsize to 21.
    set Data_2_Text:style:wordwrap to false.
    set Data_2_Text:style:width to 1.
    set Data_2_Text:style:align to "LEFT".

local Data_2_Unit to Text_Based_GUI:addlabel("KM").
    set Data_2_Unit:style:textcolor to WHITE.
    set Data_2_Unit:style:padding:top to -28.5.
    set Data_2_Unit:style:padding:left to 170.
    set Data_2_Unit:style:font to "calibrib".
    set Data_2_Unit:style:fontsize to 20.
    set Data_2_Unit:style:wordwrap to false.
    set Data_2_Unit:style:width to 1.
    set Data_2_Unit:style:align to "LEFT".

local Data_2 to Text_Based_GUI:addlabel().
    set Data_2:style:textcolor to WHITE.
    set Data_2:style:padding:top to -28.5.
    set Data_2:style:padding:right to -165.
    set Data_2:style:font to "calibrib".
    set Data_2:style:fontsize to 21.
    set Data_2:style:wordwrap to false.
    set Data_2:style:width to 1.
    set Data_2:style:align to "RIGHT".

local Data_3_Text to Text_Based_GUI:addlabel("ATM PRES").
    set Data_3_Text:style:textcolor to WHITE.
    set Data_3_Text:style:margin:top to 17.
    set Data_3_Text:style:padding:left to 10.
    set Data_3_Text:style:font to "calibrib".
    set Data_3_Text:style:fontsize to 21.
    set Data_3_Text:style:wordwrap to false.
    set Data_3_Text:style:width to 1.
    set Data_3_Text:style:align to "LEFT".

local Data_3_Unit to Text_Based_GUI:addlabel("ATM").
    set Data_3_Unit:style:textcolor to WHITE.
    set Data_3_Unit:style:padding:top to -28.5.
    set Data_3_Unit:style:padding:left to 170.
    set Data_3_Unit:style:font to "calibrib".
    set Data_3_Unit:style:fontsize to 20.
    set Data_3_Unit:style:wordwrap to false.
    set Data_3_Unit:style:width to 1.
    set Data_3_Unit:style:align to "LEFT".

local Data_3 to Text_Based_GUI:addlabel().
    set Data_3:style:textcolor to WHITE.
    set Data_3:style:padding:top to -28.5.
    set Data_3:style:padding:right to -165.
    set Data_3:style:font to "calibrib".
    set Data_3:style:fontsize to 21.
    set Data_3:style:wordwrap to false.
    set Data_3:style:width to 1.
    set Data_3:style:align to "RIGHT".

local Data_4_Text to Text_Based_GUI:addlabel("Q-PRES").
    set Data_4_Text:style:textcolor to WHITE.
    set Data_4_Text:style:margin:top to 17.
    set Data_4_Text:style:padding:left to 10.
    set Data_4_Text:style:font to "calibrib".
    set Data_4_Text:style:fontsize to 21.
    set Data_4_Text:style:wordwrap to false.
    set Data_4_Text:style:width to 1.
    set Data_4_Text:style:align to "LEFT". 

local Data_4_Unit to Text_Based_GUI:addlabel("ATM").
    set Data_4_Unit:style:textcolor to WHITE.
    set Data_4_Unit:style:padding:top to -28.5.
    set Data_4_Unit:style:padding:left to 170.
    set Data_4_Unit:style:font to "calibrib".
    set Data_4_Unit:style:fontsize to 20.
    set Data_4_Unit:style:wordwrap to false.
    set Data_4_Unit:style:width to 1.
    set Data_4_Unit:style:align to "LEFT".   

local Data_4 to Text_Based_GUI:addlabel().
    set Data_4:style:textcolor to WHITE.
    set Data_4:style:padding:top to -28.5.
    set Data_4:style:padding:right to -165.
    set Data_4:style:font to "calibrib".
    set Data_4:style:fontsize to 21.
    set Data_4:style:wordwrap to false.
    set Data_4:style:width to 1.
    set Data_4:style:align to "RIGHT".

//Fuel Levels GUI
local LOx_Level to Fuel_Levels_GUI:addhbox().
    set LOx_Level:style:normal:bg to "GUI V3/Prop_Body.png".
    set LOx_Level:style:overflow:left to 115.
    set LOx_Level:style:overflow:right to -115.
    set LOx_Level:style:overflow:top to -38.
    set LOx_Level:style:overflow:bottom to 50.
    set LOx_Level:style:width to 70.
    set LOx_Level:style:height to 120.
    set LOx_Level:style:align to "RIGHT".
    set LOx_Level:style:margin:left to 340.

local LOx_Pos to LOx_Level:addlabel().
    set LOx_Pos:style:normal:bg to "GUI V3/Prop_Positive.png".
    set LOx_Pos:style:overflow:left to 111.5.
    set LOx_Pos:style:overflow:right to -110.
    set LOx_Pos:style:margin:top to 167.
    set LOx_Pos:style:width to 53.
    set LOx_Pos:style:height to 0.1.

local LOx_Percent to LOx_Level:addlabel().
    set LOx_Percent:style:textcolor to RGBA(0.3, 0.3, 0.3, 1).
    set LOx_Percent:style:fontsize to 20.
    set LOx_Percent:style:margin:top to 90.
    set LOx_Percent:style:font to "calibrib".
    set LOx_Percent:style:align to "CENTER".
    set LOx_Percent:style:padding:left to -277.
    set LOx_Percent:style:width to 1.

local LOx_Title to LOx_Level:addlabel("LOX").
    set LOx_Title:style:textcolor to WHITE.
    set LOx_Title:style:fontsize to 25.
    set LOx_Title:style:margin:top to 3.
    set LOx_Title:style:padding:left to -168.5.
    set LOx_Title:style:font to "calibrib".
    set LOx_Title:style:width to 1.

local Fuel_Level to Fuel_Levels_GUI:addhbox().
    set Fuel_Level:style:normal:bg to "GUI V3/Prop_Body.png".
    set Fuel_Level:style:overflow:left to 110.
    set Fuel_Level:style:overflow:right to -110.
    set Fuel_Level:style:overflow:top to -38.
    set Fuel_Level:style:overflow:bottom to 50.
    set Fuel_Level:style:width to 70.
    set Fuel_Level:style:height to 120.
    set Fuel_Level:style:align to "LEFT".

local Fuel_Pos to Fuel_Level:addlabel().
    set Fuel_Pos:style:normal:bg to "GUI V3/Prop_Positive.png".
    set Fuel_Pos:style:overflow:left to 106.75.
    set Fuel_Pos:style:overflow:right to -105.
    set Fuel_Pos:style:margin:top to 167.
    set Fuel_Pos:style:width to 53.
    set Fuel_Pos:style:height to 0.1.

local Fuel_Percent to Fuel_Level:addlabel().
    set Fuel_Percent:style:textcolor to RGBA(0.3, 0.3, 0.3, 1).
    set Fuel_Percent:style:fontsize to 20.
    set Fuel_Percent:style:margin:top to 90.
    set Fuel_Percent:style:font to "calibrib".
    set Fuel_Percent:style:align to "CENTER".
    set Fuel_Percent:style:padding:left to -265.
    set Fuel_Percent:style:width to 1.

local Fuel_Title to Fuel_Level:addlabel("FUEL").
    set Fuel_Title:style:textcolor to WHITE.
    set Fuel_Title:style:fontsize to 25.
    set Fuel_Title:style:margin:top to 3.
    set Fuel_Title:style:padding:left to -166.5.
    set Fuel_Title:style:font to "calibrib".
    set Fuel_Title:style:width to 1.

local VLine_2 to HorizontalPlace:addlabel().
    set VLine_2:style:normal:bg to "GUI V3/Vertical_Line.png".
    set VLine_2:style:overflow:top to 25.
    set VLine_2:style:overflow:bottom to 200.
    set VLine_2:style:overflow:left to 45.
    set VLine_2:style:overflow:right to -230.

//Engine GUI
set Miscellaneous to HorizontalPlace:addvlayout().
set EngineHBOX to HorizontalPlace:addhlayout().

local twr_box to Miscellaneous:addhbox().
    set twr_box:style:hstretch to true.
    set twr_box:style:vstretch to true.
    set twr_box:style:overflow:right to 60.
    set twr_box:style:overflow:left to -37.
    set twr_box:style:overflow:top to -163.
    set twr_box:style:overflow:bottom to 174.5.
    set twr_box:style:width to 3.
    set twr_box:style:height to 7.

local twr_unit_box to Miscellaneous:addhbox().
    set twr_unit_box:style:hstretch to true.
    set twr_unit_box:style:vstretch to true.
    set twr_unit_box:style:overflow:right to 36.
    set twr_unit_box:style:overflow:left to -13.
    set twr_unit_box:style:overflow:top to -156.
    set twr_unit_box:style:overflow:bottom to 167.
    set twr_unit_box:style:width to 1.
    set twr_unit_box:style:height to 7.

local twr_unit_box_name to twr_unit_box:addlabel().
    set twr_unit_box_name:style:font to "calibrib".
    set twr_unit_box_name:style:align to "CENTER".
    set twr_unit_box_name:style:textcolor to WHITE.
    set twr_unit_box_name:style:padding:top to 325.
    set twr_unit_box_name:style:padding:left to 42.5.
    set twr_unit_box_name:style:fontsize to 10.
    set twr_unit_box_name:style:width to 1.
    set twr_unit_box_name:style:height to 1.    
    set twr_unit_box_name:text to "TWR".

local twr_value to twr_box:addlabel().
    set twr_value:style:font to "calibrib".
    set twr_value:style:align to "CENTER".
    set twr_value:style:textcolor to WHITE.
    set twr_value:style:padding:top to 340.
    set twr_value:style:padding:left to 93.
    set twr_value:style:fontsize to 14.
    set twr_value:style:width to 1.
    set twr_value:style:height to 1.    

local ThrottleBox to Miscellaneous:addhbox().
    set ThrottleBox:style:hstretch to true.
    set ThrottleBox:style:vstretch to true.
    set ThrottleBox:style:overflow:right to -123.
    set ThrottleBox:style:overflow:left to 147.
    set ThrottleBox:style:overflow:top to -149.4.
    set ThrottleBox:style:overflow:bottom to 160.25.
    set ThrottleBox:style:width to 5.
    set ThrottleBox:style:height to 7.    

local ThrottleBoxPercent to Miscellaneous:addhbox().
    set ThrottleBoxPercent:style:hstretch to true.
    set ThrottleBoxPercent:style:vstretch to true.
    set ThrottleBoxPercent:style:overflow:right to -106.
    set ThrottleBoxPercent:style:overflow:left to 118.5.
    set ThrottleBoxPercent:style:overflow:top to -142.5.
    set ThrottleBoxPercent:style:overflow:bottom to 153.
    set ThrottleBoxPercent:style:width to 5.
    set ThrottleBoxPercent:style:height to 7.    

local ThrottlePercent to ThrottleBoxPercent:addlabel("%").
    set ThrottlePercent:style:font to "calibrib".
    set ThrottlePercent:style:align to "CENTER".
    set ThrottlePercent:style:textcolor to WHITE.
    set ThrottlePercent:style:padding:top to 298.
    set ThrottlePercent:style:padding:left to -227.
    set ThrottlePercent:style:fontsize to 14.5.
    set ThrottlePercent:style:width to 1.5.
    set ThrottlePercent:style:height to 1.

local ThrottleLabel to ThrottleBox:addlabel().
    set ThrottleLabel:style:font to "calibrib".
    set ThrottleLabel:style:align to "CENTER".
    set ThrottleLabel:style:textcolor to WHITE.
    set ThrottleLabel:style:padding:top to 312.5.
    set ThrottleLabel:style:padding:left to -272.
    set ThrottleLabel:style:fontsize to 14.5.
    set ThrottleLabel:style:width to 1.5.
    set ThrottleLabel:style:height to 1.

local ThrustBox to Miscellaneous:addhbox().
    set ThrustBox:style:hstretch to true.
    set ThrustBox:style:vstretch to true.
    set ThrustBox:style:overflow:right to -122.
    set ThrustBox:style:overflow:left to 147.
    set ThrustBox:style:overflow:top to 31.4.
    set ThrustBox:style:overflow:bottom to -20.
    set ThrustBox:style:width to 5.
    set ThrustBox:style:height to 7.  

local ThrustUnitBox to Miscellaneous:addhbox().
    set ThrustUnitBox:style:hstretch to true.
    set ThrustUnitBox:style:vstretch to true.
    set ThrustUnitBox:style:overflow:right to -99.
    set ThrustUnitBox:style:overflow:left to 117.
    set ThrustUnitBox:style:overflow:top to 37.85.
    set ThrustUnitBox:style:overflow:bottom to -27.
    set ThrustUnitBox:style:width to 5.
    set ThrustUnitBox:style:height to 7. 

local ThrustUnit to ThrustUnitBox:addlabel("kN").
    set ThrustUnit:style:font to "calibrib".
    set ThrustUnit:style:align to "CENTER".
    set ThrustUnit:style:textcolor to WHITE.
    set ThrustUnit:style:padding:top to -62.
    set ThrustUnit:style:padding:left to -218.5.
    set ThrustUnit:style:fontsize to 14.
    set ThrustUnit:style:width to 1.5.
    set ThrustUnit:style:height to 1.

local ThrustLabel to ThrustBox:addlabel().
    set ThrustLabel:style:font to "calibrib".
    set ThrustLabel:style:align to "CENTER".
    set ThrustLabel:style:textcolor to WHITE.
    set ThrustLabel:style:padding:top to -48.37.
    set ThrustLabel:style:padding:left to -269.
    set ThrustLabel:style:fontsize to 14.5.
    set ThrustLabel:style:width to 1.5.
    set ThrustLabel:style:height to 1.

local g_force_box to Miscellaneous:addhbox().
    set g_force_box:style:hstretch to true.
    set g_force_box:style:vstretch to true.
    set g_force_box:style:overflow:right to 58.
    set g_force_box:style:overflow:left to -45.
    set g_force_box:style:overflow:top to 45.4.
    set g_force_box:style:overflow:bottom to -33.5.
    set g_force_box:style:width to 5.
    set g_force_box:style:height to 7.

local g_force_name to Miscellaneous:addhbox().
    set g_force_name:style:hstretch to true.
    set g_force_name:style:vstretch to true.
    set g_force_name:style:overflow:right to 40.5.
    set g_force_name:style:overflow:left to -13.5.
    set g_force_name:style:overflow:top to 45.4.
    set g_force_name:style:overflow:bottom to -34.5.
    set g_force_name:style:width to 5.
    set g_force_name:style:height to 7.

local g_force_label to g_force_name:addlabel().
    set g_force_label:style:font to "calibrib".
    set g_force_label:style:align to "CENTER".
    set g_force_label:style:textcolor to WHITE.
    set g_force_label:style:padding:top to -77.
    set g_force_label:style:padding:right to -102.
    set g_force_label:style:fontsize to 14.5.
    set g_force_label:style:width to 1.5.
    set g_force_label:style:height to 1.
    set g_force_label:text to "G".

local g_force_value to g_force_name:addlabel().
    set g_force_value:style:font to "calibrib".
    set g_force_value:style:align to "CENTER".
    set g_force_value:style:textcolor to WHITE.
    set g_force_value:style:padding:top to -77.
    set g_force_value:style:padding:right to -40.
    set g_force_value:style:fontsize to 14.5.
    set g_force_value:style:width to 1.5.
    set g_force_value:style:height to 1.

local Engine_GUI to EngineHBOX:addlabel().
    set Engine_GUI:style:bg to "GUI V3/Octoweb_Inactive.png".
    set Engine_GUI:style:overflow:top to 2.5.
    set Engine_GUI:style:overflow:bottom to 152.
    set Engine_GUI:style:overflow:left to 167.
    set Engine_GUI:style:overflow:right to -21.

g:show().
Update_GUI().

//Functions
function Update_GUI {
    until Shutdown_GUI = true {
        Updater().
        wait 0.01.
    }
}

function Updater {
    TextBased().
    Fuel_Levels("Oxidizer").
    Fuel_Levels("Fuel").
    DetermineEngineMode().
}

function TextBased {
    set Data_1:text to "" + ROUND(3.6*SHIP:VELOCITY:SURFACE:MAG).
    set Data_2:text to "" + Vehicle_Altitude().
    set Data_3:text to "" + ATM_PRES().
    set Data_4:text to "" + Q_PRES().
    set ThrottleLabel:text to "" + EngineInfo()[0].
    set ThrustLabel:text to "" + EngineInfo()[1].
    set twr_value:text to "" + TWR().
    set g_force_value:text to "" + calculate_acc().
}

function EngineInfo {
    if Throttle < 0.099 {
        set ThrottleLabel:style:padding:left to -269.5.
    } else if Throttle = 1 {
        set ThrottleLabel:style:padding:left to -270.65.
    } else {
        set ThrottleLabel:style:padding:left to -272.
    }

    if SHIP:THRUST < 1000 {
        set ThrustUnit:text to "kN".
        set ThrustUnit:style:padding:left to -217.499999999999986.

        set THRUST to ROUND(SHIP:THRUST).
        if SHIP:THRUST < 100 {
            if SHIP:THRUST < 10 {
                set ThrustLabel:style:padding:left to -268.6.
            } else {
                set ThrustLabel:style:padding:left to -271.499.
            }
        } else {      
            set ThrustLabel:style:padding:left to -269.
        }
    } else {
        set ThrustUnit:style:padding:left to -216.8.
        set ThrustUnit:text to "MN".
        set ThrustLabel:style:padding:left to -271.54.

        if ROUND(SHIP:THRUST/1000, 1):TOSTRING:LENGTH = 1 {
            set THRUST to ROUND(SHIP:THRUST/1000, 1) + ".0".
        } else if ROUND(SHIP:THRUST/1000, 1):TOSTRING:LENGTH <> 1 {
            set THRUST to ROUND(SHIP:THRUST/1000, 1).
        }
    }

    

    return list(ROUND(100*throttle), THRUST).
}

function ATM_PRES {
    return unit_decimal_fixer(BODY:ATM:ALTITUDEPRESSURE(ALT:RADAR)).
}

function Q_PRES {
    local dyn_pres to ROUND(ship:q, 2).

    if dyn_pres < 1 {
        if dyn_pres:TOSTRING:LENGTH = 1 {
            return dyn_pres + ".00".
        } else if dyn_pres:TOSTRING:LENGTH = 3 {
            return dyn_pres + "0".
        } else {
            return dyn_pres.
        }
    } else {
        return unit_decimal_fixer(ship:q).
    }
}

function Vehicle_Altitude {
    return unit_decimal_fixer(ALT:RADAR/1000).
}

//Only for values that are in format 0.0 and > 1
function unit_decimal_fixer {
    parameter unit.

    if unit > 100 {
        return ROUND(unit).
    }

    if ROUND(unit, 1):TOSTRING:LENGTH = 1 or ROUND(unit, 1):TOSTRING:LENGTH = 2 {
        return ROUND(unit) + ".0".
    } else {
        return ROUND(unit, 1).
    }
}

function Fuel_Levels {
    parameter Type.

    if Type = "Oxidizer" {
            if Oxidizer = 0 {
                set LOx_Pos:style:normal:bg to "".
            }

            if Oxidizer:TOSTRING:LENGTH = 1 {
                set LOx_Percent:style:padding:left to -274.
            } else {
                set LOx_Percent:style:padding:left to -277.
            }

            set LOx_Pos:style:normal:bg to "GUI V3/Prop_Positive.png".
            set LOx_Pos:style:overflow:top to 1.265*Oxidizer.
            set LOx_Percent:text to Oxidizer + "%".
    } else if Type = "Fuel" {
            if Fuel = 0 {
                set Fuel_Pos:style:normal:bg to "".
            }

            if Fuel:TOSTRING:LENGTH = 1 {
                set Fuel_Percent:style:padding:left to -263.
            } else {
                set Fuel_Percent:style:padding:left to -265.
            }

            set Fuel_Pos:style:normal:bg to "GUI V3/Prop_Positive.png".
            set Fuel_Pos:style:overflow:top to 1.2675*Fuel.
            set Fuel_Percent:text to Fuel + "%".
    }
}

function TWR {
    if SHIP:THRUST <> 0 {
        local vehicle_twr to ROUND(ship:thrust/(ship:mass*local_g), 2).

        return unit_decimal_fixer(vehicle_twr).
    } else {
        return 0.
    }
}

function DetermineEngineMode {
    if ship:partsdubbed("TE.19.F9.S1.Engine"):LENGTH <> 0 and ship:partsdubbed("TE.19.F9.S1.Engine")[0]:MAXTHRUSTAT(0) <> 0 {
        set EngineMaxThrust to ship:partsdubbed("TE.19.F9.S1.Engine")[0]:MAXTHRUSTAT(0).
        set Engine_GUI:ENABLED to true.

        if SHIP:THRUST <> 0 {
            if EngineMaxThrust >= 2560 {
                EngineImg(9).
            } else if EngineMaxThrust >= 1706 and EngineMaxThrust < 2560 {
                EngineImg(3).
            } else if EngineMaxThrust >= 763 and EngineMaxThrust < 1706 {
                EngineImg(1).
            }
        } else {
            EngineImg(0).
        }
    } else {
        EngineImg("Disabled").
        DisableGUI().
    }
}

function EngineImg {
    parameter EngineCfg.
    
    if EngineCfg = 1 {
        set Engine_GUI:style:bg to "GUI V3/Octoweb_1".
    } else if EngineCfg = 3 {
        set Engine_GUI:style:bg to "GUI V3/Octoweb_3".
    } else if EngineCfg = 9 {
        set Engine_GUI:style:bg to "GUI V3/Octoweb_9".
    } else if EngineCfg = 0 {
        set Engine_GUI:style:bg to "GUI V3/Octoweb_Inactive.png".
    } else if EngineCfg = "Disabled" {
        set Engine_GUI:style:bg to "GUI V3/Octoweb_Inactive.png".
        set Engine_GUI:ENABLED to false.
    }
}

function calculate_acc {
    set current_time to time:seconds.
    set current_velocity to ship:velocity:orbit.

    if (current_time - previous_time) >= time_offset {
        set delta_time to current_time - previous_time.
        set delta_velocity to current_velocity - previous_velocity.
        set raw_acc to delta_velocity/delta_time.

        set gravity_strength to body:mu/body:position:sqrmagnitude.
        set gravity_acc to body:position:normalized * gravity_strength.
        set felt_acc to raw_acc - gravity_acc.

        set g_force to felt_acc:mag/9.80665.

        set previous_time to current_time.
        set previous_velocity to current_velocity.

        return unit_decimal_fixer(g_force).
    }

}

function DisableGUI {
    if ship:status = "LANDED" {
        set Text_Based_GUI:ENABLED to false.
        set LOx_Level:ENABLED to false.
        set Fuel_Level:ENABLED to false.
        set LOx_Title:ENABLED to false.
        set LOx_Pos:ENABLED to false.
        set Fuel_Title:ENABLED to false.
        set Fuel_Pos:ENABLED to false.
        set LOx_Percent:ENABLED to true.
        set Fuel_Percent:ENABLED to true.
        set Miscellaneous:ENABLED to false.

        set Shutdown_GUI to true.
    }
}

function FuelAmount {
    parameter part, res.

    local fuelRemain to 0.

    for tank in part {
        for f in tank:resources {
            if f:name = res {
                set fuelRemain to fuelRemain + f:amount.
            }
        }
    }

    return fuelRemain.
}

function MAXFUEL {
    parameter part, res.

    local fuelRemain to 0.

    for tank in part {
        for f in tank:resources {
            if f:name = res {
                set fuelRemain to fuelRemain + f:capacity.
            }
        }
    }
    
    return fuelRemain.
}

function check {
    if (ship:partsdubbed("TE.19.F9.S1.Engine"):LENGTH <> 0 and ship:partsdubbed("TE.19.F9.S1.Tank"):LENGTH <> 0) {
        local booster_tank to ship:partsdubbed("TE.19.F9.S1.Tank").

        if booster_tank:LENGTH <> 0 {
            set Max_Ox to MAXFUEL(booster_tank, "oxidizer").   
            set Max_F to MAXFUEL(booster_tank, "liquidfuel").

            lock Oxidizer to 100*ROUND(FuelAmount(booster_tank, "oxidizer")/Max_Ox, 2).
            lock Fuel to 100*ROUND(FuelAmount(booster_tank, "liquidfuel")/Max_F, 2).
        } else {
            set Oxidizer to 0.
            set Fuel to 0.
        }

    } else { 
        print "NO TUNDRA EXPLORATION CLUSTER AND TANK DETECTED, PLEASE INSTALL FIRST.".
    }
}

function startup {
    if status = "landed" {shutdown.}

    if defined LZSt {
        if LZSt = "RTLS" {
            Set LZV3 to LZPo.
        } else if LZSt = "ASDS" {
            Set LZV3 to TARGET:GEOPOSITION.
        } 
    }
    
    if status = "prelaunch" {
        if defined LZSt {
            wait until not core:messages:empty.
        } else {
            wait until round(verticalspeed) > 0 or ship:thrust > 0. 
        }
    }
}