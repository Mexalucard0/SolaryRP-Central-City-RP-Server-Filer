
local playerNamesDist = 10

Citizen.CreateThread(function()
    while true do
        for id = 0, 31 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
        local takeaway = 0.95

                if ((distance < playerNamesDist) and IsEntityVisible(GetPlayerPed(id))) ~= GetPlayerPed( -1 ) then
            if NetworkIsPlayerTalking(id) then
            DrawMarker(27,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 91, 202, 242, 120, 0, 0, 80, 1, 0, 0, 0)
            else
            --DrawMarker(27, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 239, 239, 239, 50, 0, 0, 2, 0, 0, 0, 0)
                    end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)