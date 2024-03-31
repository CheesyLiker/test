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
		if v.Name ~= localPlayer.Name and (v.Character.HumanoidRootPart.Position - Box.Position).Magnitude < 105 then return false end
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

game.Workspace.Boxes.ChildAdded:Connect(function(child) table.insert(CurrentBoxes, child) end)
game.Workspace.Boxes.ChildRemoved:Connect(function(child) table.remove(CurrentBoxes, table.find(CurrentBoxes, child)) end)

while RunService.RenderStepped:Wait() do
	if #CurrentBoxes > 0 then
		local Character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local HRP = Character:WaitForChild("HumanoidRootPart")
		
		for _, Box in pairs(CurrentBoxes) do
			if Box.Transparency < 0.51 and NoClosestPlayersToTheBox(Box) == true then
				HRP.CFrame = CFrame.new(Box.Position + Vector3.new(0, -3.75, 0))
				Platform.CFrame = CFrame.new(Box.Position + Vector3.new(0, -6.75, 0))
			else
				if Box.Transparency >= 0.51 then
					table.remove(CurrentBoxes, table.find(CurrentBoxes, Box))
				end
				
				HRP.CFrame = CFrame.new(0, -202, 0)
				Platform.CFrame = CFrame.new(0, -205, 0)
			end
		end
		
		HRP.CFrame = CFrame.new(0, -202, 0)
		Platform.CFrame = CFrame.new(0, -205, 0)
	end
end
