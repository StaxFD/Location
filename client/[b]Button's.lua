function _LocationButton(LocationPos)
    for k,v in pairs(_Location.vehicules) do            
        RageUI.Button(v.label, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Location.Translations.Menu.colorprice..v.price.._Location.Translations.Menu.Dollars}, true, {
            onActive = function()
                name = v.name
            end,
            onSelected = function()
                if not ESX.Game.IsSpawnPointClear(LocationPos, 10.0) then
                    ESX.ShowAdvancedNotification('<C>~o~Stax Développement~s~', '<C>~b~Informations', '<C>Location\n- ~r~Point de spawn bloquée~s~', 'CHAR_BIKESITE', 8)
                else
                    TriggerServerEvent("_/Stax_/:BuyVehicleLoc_/", LocationPos, v.price, v.name, v.label)
                    RageUI.CloseAll()
                end
            end,
        })
    end
    local speed = GetVehicleModelMaxSpeed(name)*3.6
    local speed = speed/220
    local accel = GetVehicleModelAcceleration(name)*3.6
    local accel = accel/220
    local seats = GetVehicleModelNumberOfSeats(name)
    local braking = GetVehicleModelMaxBraking(name)/2
    local couple = GetVehicleModelMaxTraction(name)/5
    RageUI.BoutonPanel("Nombre de places", "~y~" .. seats, i)
    RageUI.StatisticPanel(speed, "Vitesse maximum", i)
    RageUI.StatisticPanel(accel*100, "Accélération", i)
    RageUI.StatisticPanel(braking, "Freinage", i)
    RageUI.StatisticPanel(couple, "Couple", i)
end