Config = {}
Config.Debug = false --* Debugs prtins etc...

-- To change the preferred language from English, add the convar to your server.cfg
-- setr ox:locale en | cs | sk ...etc
Config.EnableDoScreenFadeIn = true --* Fade when Teleporting in / out
Config.EnableProgressbar = true
Config.EnableNotify = true
Config.Notify = "okokNotify" --* okokNotify, ox, other - you can add yours down below
Config.Duration = 2500 --* 1000 = 1s - Duration of the progressbar
Config.InteractionDistance = 1.4 --* Distance to interact with 3rd eye

Config.Teleport = {
	tp1 = {
        EnableItem = true, --* False = You dont need any item for it to work | TRUE = You need to specify item "itemrequierd" lower in config
        itemrequierd = "keycard", --* YOU NEED TO HAVE ENABLE ITEM ON! IF "EnableItem" is false then you dont need to put here anything
		PosIn = vec3(564.5224, 2598.8965, 43.8719),
		PosOut = vec3(1066.4044, -3183.3301, -39.1638),
		label = "Go in",
		labelout = "Go Out",
		icon = "fa-solid fa-door-open",

	},
    tp2 = {
		EnableItem = true, --* False = You dont need any item for it to work | TRUE = You need to specify item "itemrequierd" lower in config
        itemrequierd = "keycard", --* YOU NEED TO HAVE ENABLE ITEM ON! IF "EnableItem" is false then you dont need to put here anything
		PosIn = vec3(2179.0200, 3496.4487, 46.0145),
		PosOut = vec3(844.6129, -3004.9502, -44.4000),
		label = "Go in",
		labelout = "Go Out",
		icon = "fa-solid fa-door-open",
	},
}

if Config.EnableNotify then
    function Notify(message)
        if message then
            if Config.Notify == 'okokNotify' then
                    exports['okokNotify']:Alert(locale('NotifyTitle'), message, 2500, 'info') --* You can change type here
            elseif Config.Notify == 'ox' then
                    lib.notify({
                        title = locale('NotifyTitle'),
                        description = message,
                        type = 'success'
                    })
            elseif Config.Notify == 'other' then
                --add your own notification.
            end
        end
    end
end