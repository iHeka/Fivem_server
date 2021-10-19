MSCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if MSCore == nil then
            TriggerEvent('MSCore:GetObject', function(obj) MSCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

isLoggedIn = false
local PlayerGang = {}


RegisterNetEvent('MSCore:Client:OnPlayerLoaded')
AddEventHandler('MSCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerGang = MSCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('MSCore:Client:OnPlayerUnload')
AddEventHandler('MSCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('MSCore:Client:OnGangUpdate')
AddEventHandler('MSCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
end)

-- Codigo
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- ballas

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "ballas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnballas()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "ballas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            print('nonce')
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "ballastash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "ballastash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-- vagos

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "vagos" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnvagos"].coords.x, Config.Locations["ogcarspawnvagos"].coords.y, Config.Locations["ogcarspawnvagos"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnvagos"].coords.x, Config.Locations["ogcarspawnvagos"].coords.y, Config.Locations["ogcarspawnvagos"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnvagos"].coords.x, Config.Locations["ogcarspawnvagos"].coords.y, Config.Locations["ogcarspawnvagos"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnvagos"].coords.x, Config.Locations["ogcarspawnvagos"].coords.y, Config.Locations["ogcarspawnvagos"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnvagos"].coords.x, Config.Locations["ogcarspawnvagos"].coords.y, Config.Locations["ogcarspawnvagos"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnvagos()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "vagos" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashvagos"].coords.x, Config.Locations["stashvagos"].coords.y, Config.Locations["stashvagos"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashvagos"].coords.x, Config.Locations["stashvagos"].coords.y, Config.Locations["stashvagos"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashvagos"].coords.x, Config.Locations["stashvagos"].coords.y, Config.Locations["stashvagos"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashvagos"].coords.x, Config.Locations["stashvagos"].coords.y, Config.Locations["stashvagos"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            print('nonce')
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "stashvagos", {
                                maxweight = 999999999999999999,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "stashvagos")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-- Bahamas

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "bahamas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnbahamas"].coords.x, Config.Locations["ogcarspawnbahamas"].coords.y, Config.Locations["ogcarspawnbahamas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnbahamas"].coords.x, Config.Locations["ogcarspawnbahamas"].coords.y, Config.Locations["ogcarspawnbahamas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnbahamas"].coords.x, Config.Locations["ogcarspawnbahamas"].coords.y, Config.Locations["ogcarspawnbahamas"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnbahamas"].coords.x, Config.Locations["ogcarspawnbahamas"].coords.y, Config.Locations["ogcarspawnbahamas"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnbahamas"].coords.x, Config.Locations["ogcarspawnbahamas"].coords.y, Config.Locations["ogcarspawnbahamas"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnBahamas()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "bahamas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashbahamas"].coords.x, Config.Locations["stashbahamas"].coords.y, Config.Locations["stashbahamas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashbahamas"].coords.x, Config.Locations["stashbahamas"].coords.y, Config.Locations["stashbahamas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashbahamas"].coords.x, Config.Locations["stashbahamas"].coords.y, Config.Locations["stashbahamas"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashbahamas"].coords.x, Config.Locations["stashbahamas"].coords.y, Config.Locations["stashbahamas"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            print('nonce')
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "bahamasstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "bahamasstash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-- Vanilla

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "vanilla" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnvanilla"].coords.x, Config.Locations["ogcarspawnvanilla"].coords.y, Config.Locations["ogcarspawnvanilla"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnvanilla"].coords.x, Config.Locations["ogcarspawnvanilla"].coords.y, Config.Locations["ogcarspawnvanilla"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnvanilla"].coords.x, Config.Locations["ogcarspawnvanilla"].coords.y, Config.Locations["ogcarspawnvanilla"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnvanilla"].coords.x, Config.Locations["ogcarspawnvanilla"].coords.y, Config.Locations["ogcarspawnvanilla"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnvanilla"].coords.x, Config.Locations["ogcarspawnvanilla"].coords.y, Config.Locations["ogcarspawnvanilla"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnVanilla()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "vanilla" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashvanilla"].coords.x, Config.Locations["stashvanilla"].coords.y, Config.Locations["stashvanilla"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashvanilla"].coords.x, Config.Locations["stashvanilla"].coords.y, Config.Locations["stashvanilla"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashvanilla"].coords.x, Config.Locations["stashvanilla"].coords.y, Config.Locations["stashvanilla"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashvanilla"].coords.x, Config.Locations["stashvanilla"].coords.y, Config.Locations["stashvanilla"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            print('nonce')
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "vanillastash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "vanillastash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

----grove-----

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "grove" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawngrove"].coords.x, Config.Locations["ogcarspawngrove"].coords.y, Config.Locations["ogcarspawngrove"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawngrove"].coords.x, Config.Locations["ogcarspawngrove"].coords.y, Config.Locations["ogcarspawngrove"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawngrove"].coords.x, Config.Locations["ogcarspawngrove"].coords.y, Config.Locations["ogcarspawngrove"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawngrove"].coords.x, Config.Locations["ogcarspawngrove"].coords.y, Config.Locations["ogcarspawngrove"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawngrove"].coords.x, Config.Locations["ogcarspawngrove"].coords.y, Config.Locations["ogcarspawngrove"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawngrove()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "grove" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashgrove"].coords.x, Config.Locations["stashgrove"].coords.y, Config.Locations["stashgrove"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashgrove"].coords.x, Config.Locations["stashgrove"].coords.y, Config.Locations["stashgrove"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashgrove"].coords.x, Config.Locations["stashgrove"].coords.y, Config.Locations["stashgrove"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashgrove"].coords.x, Config.Locations["stashgrove"].coords.y, Config.Locations["stashgrove"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "grovestash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "grovestash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-------Cartel-------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "cartel" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnCartel"].coords.x, Config.Locations["ogcarspawnCartel"].coords.y, Config.Locations["ogcarspawnCartel"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnCartel"].coords.x, Config.Locations["ogcarspawnCartel"].coords.y, Config.Locations["ogcarspawnCartel"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnCartel"].coords.x, Config.Locations["ogcarspawnCartel"].coords.y, Config.Locations["ogcarspawnCartel"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnCartel"].coords.x, Config.Locations["ogcarspawnCartel"].coords.y, Config.Locations["ogcarspawnCartel"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnCartel"].coords.x, Config.Locations["ogcarspawnCartel"].coords.y, Config.Locations["ogcarspawnCartel"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnCartel()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "cartel"  then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashCartel"].coords.x, Config.Locations["stashCartel"].coords.y, Config.Locations["stashCartel"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashCartel"].coords.x, Config.Locations["stashCartel"].coords.y, Config.Locations["stashCartel"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashCartel"].coords.x, Config.Locations["stashCartel"].coords.y, Config.Locations["stashCartel"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashCartel"].coords.x, Config.Locations["stashCartel"].coords.y, Config.Locations["stashCartel"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "Carteltash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "Carteltash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-------Mafia-------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "mafia" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnMafia"].coords.x, Config.Locations["ogcarspawnMafia"].coords.y, Config.Locations["ogcarspawnMafia"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnMafia"].coords.x, Config.Locations["ogcarspawnMafia"].coords.y, Config.Locations["ogcarspawnMafia"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnMafia"].coords.x, Config.Locations["ogcarspawnMafia"].coords.y, Config.Locations["ogcarspawnMafia"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnMafia"].coords.x, Config.Locations["ogcarspawnMafia"].coords.y, Config.Locations["ogcarspawnMafia"].coords.z, "~g~E~w~ - Save vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnMafia"].coords.x, Config.Locations["ogcarspawnMafia"].coords.y, Config.Locations["ogcarspawnMafia"].coords.z, "~g~E~w~ - Garage")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnMafia()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and MSCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "mafia" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashMafia"].coords.x, Config.Locations["stashMafia"].coords.y, Config.Locations["stashMafia"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashMafia"].coords.x, Config.Locations["stashMafia"].coords.y, Config.Locations["stashMafia"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashMafia"].coords.x, Config.Locations["stashMafia"].coords.y, Config.Locations["stashMafia"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashMafia"].coords.x, Config.Locations["stashMafia"].coords.y, Config.Locations["stashMafia"].coords.z, "~g~E~w~ - Closet ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "Mafiastash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "Mafiastash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

-- ballas
function ogVehicleSpawnballas()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListballas", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- vagos
function ogVehicleSpawnvagos()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListvagos", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- Bahamas
function ogVehicleSpawnBahamas()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListBahamas", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- Vanilla
function ogVehicleSpawnVanilla()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListVanilla", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- Cartel
function ogVehicleSpawnCartel()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListCartel", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- Mafia 
function ogVehicleSpawnMafia()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListMafia", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- grove
function ogVehicleSpawngrove()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Vehicules", "VehicleListgrove", nil)
    Menu.addButton("Fermer", "closeMenuFull", nil) 
end

-- ballas
function VehicleListballas(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleballas", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnballas",nil)
end

-- vagos
function VehicleListvagos(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehiclevagos", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnvagos",nil)
end

-- Bahamas
function VehicleListBahamas(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleBahamas", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnBahamas",nil)
end

-- Vanilla
function VehicleListVanilla(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleVanilla", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnVanilla",nil)
end

-- Cartel
function VehicleListCartel(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.VehiclesCartel) do
        Menu.addButton(Config.VehiclesCartel[k], "TakeOutVehicleCartel", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnCartel",nil)
end

-- Mafia
function VehicleListMafia(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules:"
    ClearMenu()
    for k, v in pairs(Config.VehiclesMafia) do
        Menu.addButton(Config.VehiclesMafia[k], "TakeOutVehicleMafia", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Retour", "ogVehicleSpawnMafia",nil)
end

-- grove
function VehicleListgrove(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehiclegrove", k, "Garagem", " Motor: 100%", " Body: 100%", " Gasol: 100%")
    end
        
    Menu.addButton("Return", "ogVehicleSpawngrove",nil)
end

function TakeOutVehicleballas(vehicleInfo)
    local coords = Config.Locations["ogcarspawnballas"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 224,0,0)
        SetVehicleCustomSecondaryColour(veh, 224,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehiclevagos(vehicleInfo)
    local coords = Config.Locations["ogcarspawnvagos"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 224,0,0)
        SetVehicleCustomSecondaryColour(veh, 224,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleBahamas(vehicleInfo)
    local coords = Config.Locations["ogcarspawnbahamas"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 224,0,0)
        SetVehicleCustomSecondaryColour(veh, 224,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleVanilla(vehicleInfo)
    local coords = Config.Locations["ogcarspawnvanilla"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 224,0,0)
        SetVehicleCustomSecondaryColour(veh, 224,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleCartel(vehicleInfo)
    local coords = Config.Locations["ogcarspawnCartel"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 0,0,0)
        SetVehicleCustomSecondaryColour(veh, 0,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehiclegrove(vehicleInfo)
    local coords = Config.Locations["ogcarspawngrove"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 45, 216, 0)
        SetVehicleCustomSecondaryColour(veh, 45, 216, 0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleMafia(vehicleInfo)
    local coords = Config.Locations["ogcarspawnMafia"].coords
    MSCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 0,0,0)
        SetVehicleCustomSecondaryColour(veh, 0,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end