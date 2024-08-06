local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.WheelchairItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:OnUseItem', source, item.name)
end)

RegisterNetEvent('qb-wheelchair:removeWheelchairItem')
AddEventHandler('qb-wheelchair:removeWheelchairItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.InventorySystem == 'qb-inventory' then
        Player.Functions.RemoveItem(Config.WheelchairItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WheelchairItem], 'remove')
    elseif Config.InventorySystem == 'ox_inventory' then
        local success, response = exports.ox_inventory:RemoveItem(src, Config.WheelchairItem, 1)
        if success then
            TriggerClientEvent('ox_inventory:ItemBox', src, exports.ox_inventory:Items()[Config.WheelchairItem], 'remove')
        else
            print('Error removing wheelchair item: ' .. response)
        end
    end
end)

RegisterNetEvent('qb-wheelchair:giveWheelchairItem')
AddEventHandler('qb-wheelchair:giveWheelchairItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.InventorySystem == 'qb-inventory' then
        Player.Functions.AddItem(Config.WheelchairItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WheelchairItem], 'add')
    elseif Config.InventorySystem == 'ox_inventory' then
        local success, response = exports.ox_inventory:AddItem(src, Config.WheelchairItem, 1)
        if success then
            TriggerClientEvent('ox_inventory:ItemBox', src, exports.ox_inventory:Items()[Config.WheelchairItem], 'add')
        else
            print('Error adding wheelchair item: ' .. response)
        end
    end
end)
