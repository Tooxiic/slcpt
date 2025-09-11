local sig = game:GetService("ReplicatedStorage").Remotes.Signal
local gm = game:GetService("ReplicatedStorage").Gamemodes
local k = false
if gm["Pirates Invasion"].Kitchen.Open.Value then
    sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Pirates Invasion', [3] = 'Join', [4] = 'Kitchen'}))
elseif gm["Pirates Invasion"].Prison.Open.Value then
    sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Pirates Invasion', [3] = 'Join', [4] = 'Prison'}))
elseif not gm['Defense']:GetAttributes().open then
    sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Defense', [3] = 'Start_Queue', [4] = 2}))
end

gm['Defense'].Wave:GetPropertyChangedSignal("Value"):Connect(function()
    if gm['Defense']['Owner'].Value == game.Players.LocalPlayer then
        if gm['Defense']['Wave'].Value >= 45 then
            sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Defense', [3] = 'Retry'}))
        end
    end
end)

gm["Pirates Invasion"].Kitchen.Open:GetPropertyChangedSignal("Value"):Connect(function()
    if gm["Pirates Invasion"].Kitchen.Open.Value then
        k = true
        sig:FireServer(unpack({[1] = 'General', [2] = 'Teleport', [3] = 'Teleport', [4] = 'Lobby'}))
        wait(1)
        sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Pirates Invasion', [3] = 'Join', [4] = 'Kitchen'}))
    end
end)

gm["Pirates Invasion"].Kitchen.Wave:GetPropertyChangedSignal("Value"):Connect(function()
    if gm["Pirates Invasion"].Kitchen.Wave.Value >= 50 then
        wait(1)
        sig:FireServer(unpack({[1] = 'General', [2] = 'Teleport', [3] = 'Teleport', [4] = 'Lobby'}))
        wait(1)
        sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Defense', [3] = 'Start_Queue', [4] = 2}))
    end
end)

gm["Pirates Invasion"].Prison.Open:GetPropertyChangedSignal("Value"):Connect(function()
    if gm["Pirates Invasion"].Prison.Open.Value then
        k = true
        sig:FireServer(unpack({[1] = 'General', [2] = 'Teleport', [3] = 'Teleport', [4] = 'Lobby'}))
        wait(1)
        sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Pirates Invasion', [3] = 'Join', [4] = 'Prison'}))
    end
end)

gm["Pirates Invasion"].Prison.Wave:GetPropertyChangedSignal("Value"):Connect(function()
    if gm["Pirates Invasion"].Prison.Wave.Value >= 50 then
        wait(1)
        sig:FireServer(unpack({[1] = 'General', [2] = 'Teleport', [3] = 'Teleport', [4] = 'Lobby'}))
        wait(1)
        sig:FireServer(unpack({[1] = 'Gamemodes', [2] = 'Defense', [3] = 'Start_Queue', [4] = 2}))
    end
end)
