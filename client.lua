local QBCore = exports['qb-core']:GetCoreObject()

-- Function to spawn the wheelchair
local function spawnWheelchair(playerPed)
    local playerCoords = GetEntityCoords(playerPed)
    local spawnCoords = vector3(playerCoords.x + 2, playerCoords.y, playerCoords.z)

    -- Load the model
    RequestModel('iak_wheelchair')
    while not HasModelLoaded('iak_wheelchair') do
        Wait(100)
    end

    -- Create the vehicle
    local vehicle = CreateVehicle('iak_wheelchair', spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, false)
    
    -- Set the player in the vehicle
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
end

-- Event handler for item use
RegisterNetEvent('QBCore:Client:OnUseItem')
AddEventHandler('QBCore:Client:OnUseItem', function(itemName)
    if itemName == Config.WheelchairItem then
        local playerPed = PlayerPedId()
        spawnWheelchair(playerPed)
    end
end)
