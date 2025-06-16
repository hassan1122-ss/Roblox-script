local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local dragonflyModel = game:GetService("ReplicatedStorage"):FindFirstChild("Dragonfly")

if dragonflyModel and char then
    local clone = dragonflyModel:Clone()
    clone.Parent = workspace
    clone:SetPrimaryPartCFrame(char.PrimaryPart.CFrame * CFrame.new(0, 5, -10))
else
    warn("Dragonfly not found in ReplicatedStorage.")
end
