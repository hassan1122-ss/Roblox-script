-- سكربت أوامر يعطيك حيوانات في Grow A Garden

local pets = {
    dragonfly = "Dragonfly",
    bee = "Coin Bee",
    butterfly = "Butterfly",
    fox = "Fox"
}

local function spawnPet(petName)
    local rp = game:GetService("ReplicatedStorage")
    local model = rp:FindFirstChild(petName)
    if not model then
        warn("الموديل غير موجود في ReplicatedStorage:", petName)
        return
    end

    local petClone = model:Clone()
    petClone.Parent = workspace

    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    petClone:SetPrimaryPartCFrame(root.CFrame * CFrame.new(0,0,-5))
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local cmd = msg:lower():match("^/give%s+(%w+)")
    if cmd and pets[cmd] then
        spawnPet(pets[cmd])
    else
        warn("اكتب /give واسم حيوان: dragonfly, bee, butterfly, fox")
    end
end)
