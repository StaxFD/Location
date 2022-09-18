ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(80)
    end
    TriggerEvent("Location:blips")
end)
local tablepositionsandblips = _Location.PositionsMenu
function _Location.Menu:Main(LocationPos)
    _Location.Menu.Create(LocationPos)
    RageUI.Visible(_Location.Menu.main, not RageUI.Visible(_Location.Menu.main))
	FreezeEntityPosition(PlayerPedId(),true)
    while _Location.Menu.main do
        Citizen.Wait(0)
        RageUI.IsVisible(_Location.Menu.main, function()
            _LocationButton(LocationPos)
        end)
        if not RageUI.Visible(_Location.Menu.main) 
        and not RageUI.Visible(_Location.Menu.SousMenuSup) 
        then 
            _Location.Menu.main = RMenu:DeleteType("_Location.Menu.main", true, FreezeEntityPosition(PlayerPedId(),false))
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 700
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(tablepositionsandblips) do
            local PositionLoc = vec3(v.pos)
            local dst1 = #(playerPos - PositionLoc)
            if dst1 < 5.0 then
                wait = 0
                DrawMarker(29, v.pos.x,v.pos.y,v.pos.z+1, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                if dst1 < 2.0 then
                    ESX.ShowHelpNotification(_Location.Translations.Menu.HelpNotif)
                    if IsControlJustReleased(1, 38) then
                        _Location.Menu:Main(PositionLoc)
                    end
                end
            end
        end
        Wait(wait)
    end
end)


RegisterNetEvent("Location:blips")
AddEventHandler("Location:blips", function()
    for k,v in pairs(tablepositionsandblips) do
        blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)
        SetBlipSprite(blip, _Location.Blips.Sprite)
        SetBlipScale(blip, _Location.Blips.Scale)
        SetBlipColour(blip, _Location.Blips.Color)
        SetBlipDisplay(blip, _Location.Blips.Display)
        SetBlipAsShortRange(blip, _Location.Blips.ShortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_Location.Blips.Name)
        EndTextCommandSetBlipName(blip)
        if v.afficherPed then
            RequestModel(_Location.Ped)
            while not HasModelLoaded(_Location.Ped) do
                RequestModel(_Location.Ped)
                Citizen.Wait(10)
            end
            Peds = CreatePed(1, _Location.Ped, v.pos.x,v.pos.y,v.pos.z - 0.98, v.headingPed, false, true)
            SetBlockingOfNonTemporaryEvents(Peds, true)
            SetPedDiesWhenInjured(Peds, false)
            SetPedCanPlayAmbientAnims(Peds, true)
            SetPedCanRagdollFromPlayerImpact(Peds, false)
            SetEntityInvincible(Peds, true)
            FreezeEntityPosition(Peds, true)
            TaskStartScenarioInPlace(Peds, "WORLD_HUMAN_CLIPBOARD", 0, true)
        end
    end
end)
local positionSpawn = _Location.PositionsSpawn
RegisterNetEvent('_/Stax_/:BuyVehicleLoc_/')
AddEventHandler('_/Stax_/:BuyVehicleLoc_/',function(model)
    for k,v in pairs(positionSpawn) do
        RequestModel(model) while not HasModelLoaded(model) do Citizen.Wait(0) end
        local vehicle = CreateVehicle(GetHashKey(model), v.pos.x,v.pos.y,v.pos.z, v.pos.w, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
end)