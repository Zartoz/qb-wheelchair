local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.WheelchairItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:OnUseItem', source, item.name)
end)

RegisterNetEvent('qb-wheelchair:removeWheelchairItem')
AddEventHandler('qb-wheelchair:removeWheelchairItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.WheelchairItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WheelchairItem], 'remove')
end)

RegisterNetEvent('qb-wheelchair:giveWheelchairItem')
AddEventHandler('qb-wheelchair:giveWheelchairItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(Config.WheelchairItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WheelchairItem], 'add')
end)
