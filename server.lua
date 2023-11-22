local playerDeadinVeh = {}

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

function Fwv(entity)
    local hr = GetEntityHeading(entity) + 90.0
    if hr < 0.0 then
        hr = 360.0 + hr
    end
    hr = hr * 0.0174533
    return {
        x = math.cos(hr) * 2.0,
        y = math.sin(hr) * 2.0
    }
end

RegisterNetEvent('tonny_emsplus:tableplayers')
AddEventHandler('tonny_emsplus:tableplayers', function(players)
    local players = players
    for k,v in pairs(players) do
        local xPlayer = ESX.GetPlayerFromId(v)
        local name = xPlayer.getName()
        local id = v

        playerDeadinVeh[k] = {
            id = id,
            name = name,
        }
    end
    TriggerClientEvent('tonny_emsplus:openmenu', source, playerDeadinVeh)
end)

RegisterNetEvent('tonny_emsplus:outvehserv')
AddEventHandler('tonny_emsplus:outvehserv', function(theid)
    local theid = theid
    local xPlayer = ESX.GetPlayerFromId(theid)
    
    TriggerClientEvent('tonny_emsplus:outvehcli', xPlayer)
end)

RegisterNetEvent('tonny_emsplus:checkjob')
AddEventHandler('tonny_emsplus:checkjob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'ambulance' or xPlayer.group == 'admin' or xPlayer.group == 'superstaff' then
        TriggerClientEvent('tonny_emsplus:nearbyPlayer', source)
    else
        xPlayer.showNotification('Tu n\'as pas le job requis !')
    end
end)