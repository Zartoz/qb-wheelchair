local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.WheelchairItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('QBCore:Client:OnUseItem', source, item.name)
end)
