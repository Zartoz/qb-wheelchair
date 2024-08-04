local QBCore = exports['qb-core']:GetCoreObject()

local function spawnWheelchair(playerPed)
    local playerCoords = GetEntityCoords(playerPed)
    local spawnCoords = vector3(playerCoords.x + 2, playerCoords.y, playerCoords.z)

    -- Load the model
    RequestModel('iak_wheelchair')
    while not HasModelLoaded('iak_wheelchair') do
        Wait(100)
    end

    local vehicle = CreateVehicle('iak_wheelchair', spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, false)
    
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
end

RegisterNetEvent('QBCore:Client:OnUseItem')
AddEventHandler('QBCore:Client:OnUseItem', function(itemName)
    if itemName == Config.WheelchairItem then
        local playerPed = PlayerPedId()
        spawnWheelchair(playerPed)
    end
end)
