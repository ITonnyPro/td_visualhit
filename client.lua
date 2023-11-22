RegisterCommand('blureffect', function(source)
    if blur == false then
        TriggerScreenblurFadeIn(500)
        blur = true
    else
        TriggerScreenblurFadeOut(500)
        blur = false
    end
end, false)

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


local lastHealth = GetEntityHealth(PlayerPedId(), false)
Citizen.CreateThread(function()
    while true do
        local health = GetEntityHealth(PlayerPedId())
        if not IsEntityDead(PlayerPedId()) then
            if lastHealth ~= health then
                if lastHealth > health then
                    --StartScreenEffect('DrugsTrevorClownsFight', 500, false)
                    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.3)
                    SetPedMotionBlur(PlayerPedId(), true)
                    ClearTimecycleModifier()
                    SetTimecycleModifier("REDMIST_blend")
                    SetTimecycleModifierStrength(0.7)
                    SetExtraTimecycleModifier("fp_vig_red")
                    SetExtraTimecycleModifierStrength(1.0)
                    Citizen.Wait(200)
                    StopGameplayCamShaking(false)
                    SetPedMotionBlur(PlayerPedId(), false)
                    ClearTimecycleModifier()
                    ClearExtraTimecycleModifier()
        
                end
                lastHealth = health
            end
        end
        --print(lastHealth)
        Citizen.Wait(0)
    end
end)