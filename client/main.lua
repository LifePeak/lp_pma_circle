------------------------------------| Variable Declaration |---------------------------------
lib.locale()

function notificationHandler(icon,title,msg,color,sound)
	if Config.Notification.System ~= 'lp_notify' then
		lib.notify({
            title = title,
            description = msg,
            type = 'info'
        })
	else
		TriggerEvent("lifepeak.notify",icon,title,msg,Config.Notification.Color,true,Config.Notification.Postion,Config.Notification.displaytime,sound)
	end
end

-- Optimize with Event Voice Change Handler
AddEventHandler("pma-voice:setTalkingMode", function(modeInt)
    local plyState = LocalPlayer.state
    local distance = plyState.proximity.distance
    notificationHandler("microphone", locale('notification_title'),locale('notification_msg', distance), "blue", "success.mp3")
    drawMarker(distance)
end)

function drawMarker(distance)
    local shouldDraw = true
    Citizen.CreateThread(function()
        while shouldDraw do
            local plycoord = GetEntityCoords(cache.ped)  
            DrawMarker(1, plycoord.x,plycoord.y, plycoord.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, distance, distance, 0.5, Config.CircleColorRED, Config.CircleColorGREEN, Config.CircleColorBLUE, 170, false, true, 2, nil, nil," ", false)
            Citizen.Wait(0)
        end
    end)

    local timer = lib.timer(Config.DisplayTime, function()
        shouldDraw = false
    end, true)
end