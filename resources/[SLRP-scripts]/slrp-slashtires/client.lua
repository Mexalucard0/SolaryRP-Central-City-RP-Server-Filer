Citizen.CreateThread(function()
	while true do
		local allowedWeapons = {"WEAPON_KNIFE", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_SWITCHBLADE"}
		local player = PlayerId()
		local plyPed = GetPlayerPed(player)
		local vehicle = GetClosestVehicleToPlayer()
		local animDict = "melee@knife@streamed_core_fps"
		local animName = "ground_attack_on_spot"
		if vehicle ~= 0 then
			if CanUseWeapon(allowedWeapons) then
				local closestTire = GetClosestVehicleTire(vehicle)
				if closestTire ~= nil then
					
					if IsVehicleTyreBurst(vehicle, closestTire.tireIndex, 0) == false then
						DrawText3D(closestTire.bonePos.x, closestTire.bonePos.y, closestTire.bonePos.z, tostring("Tryk [~r~E~s~] skær dæk op"))
						if IsControlJustPressed(1, 38) then

							RequestAnimDict(animDict)
							while not HasAnimDictLoaded(animDict) do
								Citizen.Wait(100)
							end

							local animDuration = GetAnimDuration(animDict, animName)
							TaskPlayAnim(plyPed, animDict, animName, 8.0, -8.0, animDuration, 15, 1.0, 0, 0, 0)
							Citizen.Wait((animDuration / 2) * 1000)

							local driverOfVehicle = GetDriverOfVehicle(vehicle)
							local driverServer = GetPlayerServerId(driverOfVehicle)

							if driverServer == 0 then
								SetVehicleTyreBurst(vehicle, closestTire.tireIndex, 0, 100.0)
							else
								TriggerServerEvent("SlashTires:TargetClient", driverServer, closestTire.tireIndex)
							end
							Citizen.Wait((animDuration / 2) * 1000)
							ClearPedTasksImmediately(plyPed)
						end
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("SlashTires:SlashClientTire")
AddEventHandler("SlashTires:SlashClientTire", function(tireIndex)
	TriggerEvent("chatMessage", "Der er en som skær i dine dæk!")
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local vehicle = GetVehiclePedIsIn(plyPed, false)
	SetVehicleTyreBurst(vehicle, tireIndex, 0, 100.0)
end)

function GetDriverOfVehicle(vehicle)
	local dPed = GetPedInVehicleSeat(vehicle, -1)
	for a = 0, 32 do
		if dPed == GetPlayerPed(a) then
			return a
		end
	end
	return -1
end

function CanUseWeapon(allowedWeapons)
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyCurrentWeapon = GetSelectedPedWeapon(plyPed)
	for a = 1, #allowedWeapons do
		if GetHashKey(allowedWeapons[a]) == plyCurrentWeapon then
			return true
		end
	end
	return false
end

function GetClosestVehicleToPlayer()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 3.0
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 10, plyPed, 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end

function GetClosestVehicleTire(vehicle)
	local tireBones = {"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}
	local tireIndex = {
		["wheel_lf"] = 0,
		["wheel_rf"] = 1,
		["wheel_lm1"] = 2,
		["wheel_rm1"] = 3,
		["wheel_lm2"] = 45,
		["wheel_rm2"] = 47,
		["wheel_lm3"] = 46,
		["wheel_rm3"] = 48,
		["wheel_lr"] = 4,
		["wheel_rr"] = 5,
	}
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local minDistance = 1.0
	local closestTire = nil
	
	for a = 1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = Vdist(plyPos.x, plyPos.y, plyPos.z, bonePos.x, bonePos.y, bonePos.z)

		if closestTire == nil then
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end

	return closestTire
end

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.37, 0.37)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
        local factor = (string.len(text)) / 400
	DrawRect(_x, _y + 0.0125, 0.030 + factor, 0.03, 20,20,20,150)
end