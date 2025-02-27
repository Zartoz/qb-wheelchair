local QBCore = exports['qb-core']:GetCoreObject()
local hasWheelchair = false
local spawnedWheelchair = nil

local function removeWheelchair()
    if spawnedWheelchair and DoesEntityExist(spawnedWheelchair) then
        DeleteVehicle(spawnedWheelchair)
        spawnedWheelchair = nil
        hasWheelchair = false

        if Config.InventorySystem == 'qb-inventory' then
            TriggerServerEvent('qb-wheelchair:giveWheelchairItem')
        elseif Config.InventorySystem == 'ox_inventory' then
            TriggerServerEvent('qb-wheelchair:giveWheelchairItem') 
        end
    end
end

local function spawnWheelchair(playerPed)
    local playerCoords = GetEntityCoords(playerPed)
    local spawnCoords = vector3(playerCoords.x + 2, playerCoords.y, playerCoords.z)

    RequestModel(Config.WheelchairModel)
    while not HasModelLoaded(Config.WheelchairModel) do
        Wait(100)
    end

    local vehicle = CreateVehicle(Config.WheelchairModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, false)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

    if Config.FuelScript == 'ps-fuel' then
        exports['ps-fuel']:SetFuel(vehicle, 100)
    elseif Config.FuelScript == 'LegacyFuel' then
        exports['LegacyFuel']:SetFuel(vehicle, 100)
    elseif Config.FuelScript == 'cdn-fuel' then
        exports['cdn-fuel']:SetFuel(vehicle, 100.0)
    end

    TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))

    hasWheelchair = true
    spawnedWheelchair = vehicle

    if Config.TargetSystem == 'qb-target' then
        exports['qb-target']:AddTargetEntity(vehicle, {
            options = {
                {
                    label = 'Remove Wheelchair',
                    icon = 'fas fa-wheelchair',
                    action = function()
                        removeWheelchair()
                    end,
                },
            },
            distance = 2.5
        })
    elseif Config.TargetSystem == 'ox_target' then
        exports.ox_target:addLocalEntity(vehicle, {
            {
                name = 'remove_wheelchair',
                label = 'Remove Wheelchair',
                icon = 'fas fa-wheelchair',
                onSelect = function()
                    removeWheelchair()
                end
            }
        })
    end
end

RegisterNetEvent('QBCore:Client:OnUseItem')
AddEventHandler('QBCore:Client:OnUseItem', function(itemName)
    if itemName == Config.WheelchairItem then
        local playerPed = PlayerPedId()
        if not hasWheelchair then
            spawnWheelchair(playerPed)
            if Config.InventorySystem == 'qb-inventory' then
                TriggerServerEvent('qb-wheelchair:removeWheelchairItem')
            elseif Config.InventorySystem == 'ox_inventory' then
                TriggerServerEvent('qb-wheelchair:removeWheelchairItem')
            end
        else
            QBCore.Functions.Notify('You already have a wheelchair spawned.', 'error')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if hasWheelchair and not DoesEntityExist(spawnedWheelchair) then
            hasWheelchair = false
            spawnedWheelchair = nil
        end
    end
end)
