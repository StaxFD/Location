_Location = _Location or {}
_Location.Menu = _Location.Menu or {}
_Location = {
    ESX = "esx:getSharedObject",
    Ped = "s_m_y_westsec_01",
    PositionsSpawn = {
        {pos = vector4(-841.087, -138.701,  37.632, 67.78)},
        --{pos = vector4(-841.087, -138.701,  37.632, 67.78)}, exemple pour rajouter un autre spawn
    },
    PositionsMenu = {
        {pos = vector3(-847.064, -137.067, 37.615), headingPed = 243.58, afficherPed = true},
        --{pos = vector3(-847.064, -137.067, 37.615), headingPed = 243.58, afficherPed = true}, exemple pour rajouter un menu
    },
    vehicules = {
        {name = "blista", label = "Blista", price = 1000},
        {name = "brioso", label = "Brioso", price = 1000},
    },
    Blips = {
        Sprite = 515,
        Scale = 0.65,
        Color = 3,
        Display = 4,
        ShortRange = true,
        Name = "Location",  
    },
    ["Translations"] = {
        ["Menu"] = {
            ["Title"] = "Location",
            ["SubTitle"] = "Location",
            ["Button"] = "Location",
            ["colorprice"] = "~g~",
            ["Dollars"] = "$",
            ["HelpNotif"] = "Appuyez sur ~INPUT_CONTEXT~ pour accéder à la ~HC_9~Location ~BLIP_pickup_jump~ ~s~",
        },
    }
}


-- [ afficherPed ] = si vous voulez afficher le ped ou non (true ou false)
