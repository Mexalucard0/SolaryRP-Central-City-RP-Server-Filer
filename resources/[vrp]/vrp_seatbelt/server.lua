--[[
	SCRIPTER: DGVaniX [ DGVaniX#0096 ] 
	WEBSITE: http://vanix.market
--]]

MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_seatbelt")
seatBelts = {}

local function toggleSeatbelt(player, choice)
	local user_id = vRP.getUserId({player})
	if(seatBelts[user_id] == true)then
		seatBelts[user_id] = false
		vRPclient.notify(player, {"~r~You've unfastened your seatbelt!"})
		TriggerClientEvent("takeoffSeatbelt", player)
	else
		seatBelts[user_id] = true
		vRPclient.notify(player, {"~g~You've fastened your seatbelt!"})
		TriggerClientEvent("applySeatbelt", player)
	end
end

RegisterNetEvent("baseevents:leftVehicle")
AddEventHandler("baseevents:leftVehicle", function()
	local thePlayer = source
	local user_id = vRP.getUserId({thePlayer})
	if(seatBelts[user_id] == true)then
		seatBelts[user_id] = false
		vRPclient.notify(thePlayer, {"~r~You've unfastened your seatbelt!"})
		TriggerClientEvent("takeoffSeatbelt", thePlayer)
	end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	TriggerClientEvent("takeoffSeatbelt", source)
end)

local function verifySeatbelt(player,choice)
	vRPclient.getNearestPlayers(player,{3},function(nplayers) 
		local user_list = ""
		for k,v in pairs(nplayers) do
			user_list = user_list .. "[" .. vRP.getUserId({k}) .. "]" .. GetPlayerName(k) .. " | "
		end 
		if user_list ~= "" then
			vRP.prompt({player,"Personer tæt på dig:" .. user_list,"",function(player,target_id) 
				target_id = parseInt(target_id)
				if target_id ~= nil and target_id ~= "" then 
					local target = vRP.getUserSource({target_id})
					if(seatBelts[target_id] == true)then
						vRPclient.notify(player, {"[POLITI] "..GetPlayerName(target).." har sele på!"})
					else
						vRPclient.notify(player, {"[POLITI] "..GetPlayerName(target).." har ikke sele på!"})
					end
				end
			end})
		else
			vRPclient.notify(player, {"Ingen spiller næd dig!"})
		end
	end)
end

vRP.registerMenuBuilder({"police", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Tjek sikkerhedssele"] = {verifySeatbelt, "Tjek sikkerhedssele"}
		add(choices)
	end
end})	
