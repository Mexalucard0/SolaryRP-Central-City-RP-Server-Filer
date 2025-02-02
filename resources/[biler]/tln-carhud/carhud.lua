-- ###########################################
-- #                                         #
-- #          C   A   R   H   U   D          #
-- #                                         #
-- #  C  O  N  F  I  G  U  R  A  T  I  O  N  #
-- #                                         #
-- ###########################################
-- Special thanks to the original creators!
-- Edited by Arby :3


-- Components
local HUD = {
	
	Speed 			= 'kmh', -- Choose between "kmh" or "mph" (case sensitive) to display on the speedometer.

	SpeedIndicator 	= true, -- Displays a speedometer in either MPH or KMH depending on your preference.

	ParkIndicator 	= true, -- Displays vehicle gears as if the vehicle was AUTOMATIC transmission (Make sure that "CarGears" is set to FALSE if using this)

	Top 			= false, -- Displays the top panel ( Oil, DSC, Vehicle Plate, Fluid, AC )

	Plate 			= false, -- Displays the vehicle registration plate. (Set to TRUE if you wish to display the plate without the other goodies that "TOP" has)

	CarGears		= true, -- Displays vehicle gears as if the vehicle was manual transmission. (Make sure that "ParkIndicator" is set to FALSE if using this)

}

-- UI Location Control (Touching this is not recommended.)
local UI = { 

	x =  -0.000 ,	-- Base Screen Coords 	+ 	 x
	y = 0.019 ,	-- Base Screen Coords 	+ 	-y

}





-- ###################################
-- #                                 #
-- #          C   O   D   E          #
-- #                                 #
-- ###################################

-- DO NOT TOUCH THIS, It could break the resource.

Citizen.CreateThread(function()
	while true do Citizen.Wait(1)


		local MyPed = GetPlayerPed(-1)

		if(IsPedInAnyVehicle(MyPed, false)) then

			local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
			local PlateVeh = GetVehicleNumberPlateText(MyPedVeh)
			local VehStopped = IsVehicleStopped(MyPedVeh)
			local VehEngineHP = GetVehicleEngineHealth(MyPedVeh) 
			local VehBodyHP = GetVehicleBodyHealth(MyPedVeh)
			local VehBurnout = IsVehicleInBurnout(MyPedVeh)
			local Gear = GetVehicleCurrentGear(MyPedVeh)
			local Running = IsVehicleDriveable(MyPedVeh, isOnFireCheck)

			if HUD.Speed == 'kmh' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			elseif HUD.Speed == 'mph' then
				Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
			else
				Speed = 0.0
			end
			
			if HUD.Top then
				drawTxt(UI.x + 0.520, UI.y + 1.266, 1.0,1.0,0.45, "~w~" .. PlateVeh, 255, 255, 255, 255)
				--drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "ENGINE", 114, 219, 165,0)
  
				if VehBurnout then
					--drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "~r~DSC", 255, 255, 255, 200)
				else
					--drawTxt(UI.x + 0.535, UI.y + 1.266, 1.0,1.0,0.44, "DSC", 255, 255, 255, 150)
				end	

				if (VehEngineHP > 0) and (VehEngineHP < 300) then
					--drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "~y~Fluid", 255, 255, 255, 200)
					--drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "~y~Oil", 255, 255, 255, 200)
					--drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "~y~AC", 255, 255, 255, 200)
					--drawWarn(UI.x + 0.610, UI.y + 1.394, 1.0,1.0,0.39, "Tjek motoren", 255, 118, 0, 200)
					--drawRct(UI.x + 0.11,  UI.y + 0.898, 0.046,0.03,0,0,0,150)

				elseif VehEngineHP < 1 then 
					--drawRct(UI.x + 0.159, UI.y + 0.809, 0.005, 0,0,0,0,100)
					--drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "~r~Fluid", 255, 255, 255, 200)
					--drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "~r~Oil", 255, 255, 255, 200)
					--drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "~r~AC", 255, 255, 255, 200)
					--drawWarn(UI.x + 0.610, UI.y + 1.394, 1.0,1.0,0.39, "Ring til Mekanikeren", 255, 118, 0, 200)
					--drawRct(UI.x + 0.11,  UI.y + 0.898, 0.046,0.03,0,0,0,150)

				else
					--drawTxt(UI.x + 0.619, UI.y + 1.266, 1.0,1.0,0.45, "Fluid", 255, 255, 255, 150)
					--drawTxt(UI.x + 0.514, UI.y + 1.266, 1.0,1.0,0.45, "Oil", 255, 255, 255, 150)
					--drawTxt(UI.x + 0.645, UI.y + 1.266, 1.0,1.0,0.45, "AC", 255, 255, 255, 150)
					--drawTxt(UI.x + 0.514, UI.y + 1.245, 1.0,1.0,0.45, "ENGINE", 87, 158, 113,0)
				end
				if HUD.ParkIndicator then
					if Running then
						--drawTxt(UI.x + 0.615, UI.y + 1.266, 1.0,1.0,0.45, "GEAR:", 255, 255, 255, 255)
					end
				end
			else
				if HUD.Plate then
					drawTxt(UI.x + 0.520, UI.y + 1.266, 1.0,1.0,0.45, "~w~" .. PlateVeh, 255, 255, 255, 255) 
				end
				if HUD.ParkIndicator then

					if VehStopped then
						--drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "~r~P", 255, 255, 255, 200)
					else
						--drawTxt(UI.x + 0.643, UI.y + 1.34, 1.0,1.0,0.6, "P", 255, 255, 255, 150)
					end
				end
			end
			
			if HUD.CarGears then
				if VehStopped and (Speed == 0) then
					drawTxt(UI.x + 0.633, UI.y + 1.264, 1.0,1.0,0.48, "P", 255, 255, 255, 255)
				elseif Gear < 1 then
					drawTxt(UI.x + 0.633, UI.y + 1.264, 1.0,1.0,0.48, "R", 255, 255, 255, 255)						
				elseif Gear == 1 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "1. Gear", 255, 255, 255, 255)
				elseif Gear == 2 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "2. Gear", 255, 255, 255, 255)
				elseif Gear == 3 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "3. Gear", 255, 255, 255, 255)
				elseif Gear == 4 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "4. Gear", 255, 255, 255, 255)
				elseif Gear == 5 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "5. Gear", 255, 255, 255, 255)
				elseif Gear == 6 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "6. Gear", 255, 255, 255, 255)
				elseif Gear == 7 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "7. Gear", 255, 255, 255, 255)
				elseif Gear == 8 then
					drawTxt(UI.x + 0.624, UI.y + 1.264, 1.0,1.0,0.48, "8. Gear", 255, 255, 255, 255)
				end	
			end
			
			if HUD.SpeedIndicator then
				drawRct(UI.x + 0.015, 	UI.y + 0.770, 0.1406,0.03,0,0,0,140) -- Speed panel
				if HUD.Speed == 'kmh' then
					drawTxt(UI.x + 0.520, 	UI.y + 1.2638, 1.0,1.0,0.475, " ~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.537, 	UI.y + 1.2638, 1.0,1.0,0.475, "~w~ Km/t ", 255, 255, 255, 255)
				elseif HUD.Speed == 'mph' then
					drawTxt(UI.x + 0.61, 	UI.y + 1.42, 1.0,1.0,0.64 , "~w~" .. math.ceil(Speed), 255, 255, 255, 255)
					drawTxt(UI.x + 0.633, 	UI.y + 1.432, 1.0,1.0,0.4, "~w~ mph", 255, 255, 255, 255)
				else
					drawTxt(UI.x + 0.81, 	UI.y + 1.42, 1.0,1.0,0.64 , [[Carhud ~r~ERROR~w~ ~c~in ~w~HUD Speed~c~ config (something else than ~y~'kmh'~c~ or ~y~'mph'~c~)]], 255, 255, 255, 255)
				end
			end
	
			if HUD.DamageSystem then

			end
			

		end		
	end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawWarn(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end
