local RunService = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer

local CurrentBoxes = {}

local function noclip()
	local Character = localPlayer.Character
	if Character then
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and v.CanCollide == true then v.CanCollide = false end	
		end
	end
end

local function NoClosestPlayersToTheBox(Box)
	for _, v in pairs(game.Players:GetChildren()) do
		if v.Name ~= localPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - Box.Position).Magnitude < 105 then return false end
	end
	return true
end

local Platform
if not game.Workspace:FindFirstChild("AutofarmPlatform") then
	Platform = Instance.new("Part", game.Workspace)
	Platform.Name = "AutofarmPlatform"
	Platform.Anchored = true
	Platform.Size = Vector3.new(15, 0.5, 15)
	Platform.Position = Vector3.new(0, -205, 0)
else
	Platform = game.Workspace:FindFirstChild("AutofarmPlatform")
end

localPlayer.CharacterAdded:Connect(function() noclip() end)
localPlayer.Character:WaitForChild("Humanoid").Health = 0

for _, Box in pairs(game.Workspace.Boxes:GetChildren()) do table.insert(CurrentBoxes, Box) end
game.Workspace.Boxes.ChildAdded:Connect(function(child) table.insert(CurrentBoxes, child) end)
game.Workspace.Boxes.ChildRemoved:Connect(function(child) table.remove(CurrentBoxes, table.find(CurrentBoxes, child)) end)

local NeededTransparency = 0.01

while task.wait(0.25) do
	if #CurrentBoxes > 0 then
		local Character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local HRP = Character:WaitForChild("HumanoidRootPart")
		
		for _, Box in pairs(CurrentBoxes) do
			NeededTransparency = Box.Name == "Shadow" and 0.51 or 0.01
			while NoClosestPlayersToTheBox(Box) == true and Box.Transparency < NeededTransparency and RunService.RenderStepped:Wait() do
				HRP.CFrame = CFrame.new(Box.Position + Vector3.new(0, -3.75, 0))
				Platform.CFrame = CFrame.new(Box.Position + Vector3.new(0, -6.75, 0))
			end
			if Box.Transparency >= 0.51 then table.remove(CurrentBoxes, table.find(CurrentBoxes, Box)) end
		end
		
		HRP.CFrame = CFrame.new(0, -202, 0)
		Platform.CFrame = CFrame.new(0, -205, 0)
	end
end
