ESX = exports["es_extended"]:getSharedObject()
lib.locale()

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
end) 

CreateThread(function()
    for k, v in pairs(Config.Teleport) do
        if v.EnableItem then
                        exports.ox_target:addSphereZone({
                            coords = v.PosIn,
                            radius = 0.6,
                            debug = Config.Debug,
                            options = {
                                {
                                    name = 'TpInWithItem',
                                    event = 'HS:TP',
                                    icon = v.icon,
                                    label = v.label,
                                    items = v.itemrequierd,
                                    teleport = v.PosOut,
                                    distance = Config.InteractionDistance,
                                }
                            }
                        })
                        exports.ox_target:addSphereZone({
                            coords = v.PosOut,
                            radius = 0.6,
                            debug = Config.Debug,
                            options = {
                                {
                                    name = 'TpOutWithItem',
                                    event = 'HS:TP2',
                                    icon = v.icon,
                                    label = v.labelout,
                                    items = v.itemrequierd,
                                    teleport = v.PosIn,
                                    distance = Config.InteractionDistance,
                                }
                            }
                        })
        else
                    for k, v in pairs(Config.Teleport) do
                    exports.ox_target:addSphereZone({
                        coords = v.PosIn,
                        radius = 0.6,
                        debug = Config.Debug,
                        options = {
                            {
                                name = 'TpInWithoutItem',
                                event = 'HS:TP',
                                icon = v.icon,
                                label = v.label,
                                teleport = v.PosOut,
                                distance = Config.InteractionDistance,
                            }
                        }
                    })
                    exports.ox_target:addSphereZone({
                        coords = v.PosOut,
                        radius = 0.6,
                        debug = Config.Debug,
                        options = {
                            {
                                name = 'TpOutWithoutItem',
                                event = 'HS:TP2',
                                icon = v.icon,
                                label = v.labelout,
                                teleport = v.PosIn,
                                distance = Config.InteractionDistance,
                            }
                        }
                    })
           end
        end
     end
end)


AddEventHandler("HS:TP", function(data)
    if Config.EnableProgressbar then
        screenfadeout(500)
            lib.progressBar({
                duration = Config.Duration,
                label = locale('ProgressIn'),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                },
            })
        SetEntityCoords(PlayerPedId(), data.teleport.x, data.teleport.y, data.teleport.z, false, false, false, true)
        screenfadein(500)
        Notify(locale('NotifyIn'))
    else
        screenfadeout(500)
        SetEntityCoords(PlayerPedId(), data.teleport.x, data.teleport.y, data.teleport.z, false, false, false, true)
        screenfadein(500)
        Notify(locale('NotifyIn'))
    end
end)

AddEventHandler("HS:TP2", function(data)
    if Config.EnableProgressbar then
            screenfadeout(500)
            lib.progressBar({
                duration = Config.Duration,
                label = locale('ProgressOut'),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                },
            })
            SetEntityCoords(PlayerPedId(), data.teleport.x, data.teleport.y, data.teleport.z, false, false, false, true)
            screenfadein(500)
            Notify(locale('NotifyOut'))
    else
            screenfadeout(500)
            SetEntityCoords(PlayerPedId(), data.teleport.x, data.teleport.y, data.teleport.z, false, false, false, true)
            screenfadein(500)
            Notify(locale('NotifyOut'))
    end
end)

function screenfadein(time)
    if Config.EnableDoScreenFadeIn then
        DoScreenFadeIn(time)
    end
end


function screenfadeout(time)
    if Config.EnableDoScreenFadeIn then
        DoScreenFadeOut(time)
    end
end
