ESX = nil 
TriggerEvent(_Location.ESX, function(obj) ESX = obj end)
RegisterNetEvent("_/Stax_/:BuyVehicleLoc_/")
AddEventHandler("_/Stax_/:BuyVehicleLoc_/", function(Pos, price, model, Stax)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xMoney = xPlayer.getMoney()
    if (#(GetEntityCoords(GetPlayerPed(src)) - Pos) > 5) then 
    DropPlayer(src,"Vous avez été kick pour avoir fait une erreur")
        return
    end
    if xMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent("_/Stax_/:BuyVehicleLoc_/", src, model)
        TriggerClientEvent('esx:showAdvancedNotification', src, 'Information', '~o~Location~s~','Vous avez loué [~o~ x 1~s~ ~y~'..Stax..' ~s~] pour ~g~'..price..'$~s~','CHAR_MP_FM_CONTACT', 8)
    else
        TriggerClientEvent('esx:showNotification', src, "~r~Vous n'avez pas assez d'argent")
    end
end)