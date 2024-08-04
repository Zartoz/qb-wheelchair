local QBCore = exports['qb-core']:GetCoreObject()

-- Register the item
QBCore.Functions.CreateUseableItem(Config.WheelchairItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:OnUseItem', source, item.name)
end)
