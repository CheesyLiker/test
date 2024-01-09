loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local TweenService = game:GetService("TweenService")
local platform = nil

local function MoveCharacter(tweenPart, waitTime, movePos, isDown)
	local TweenPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local Info = TweenInfo.new(
		waitTime,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.InOut,
		0,
		false,
		0
	)

	if isDown then
		HRP.CFrame = HRP.CFrame + Vector3.new(0, -50, 0)
	end

	platform.CFrame = HRP.CFrame + Vector3.new(0, -3, 0)

	-- Character Move
	local TweenGoals = {CFrame = movePos}
	local Tween = TweenService:Create(TweenPart, Info, TweenGoals)
	Tween:Play()

	-- Platform Move
	TweenGoals = {CFrame = movePos + Vector3.new(0, -3, 0)}
	TweenPart = platform
	Tween = TweenService:Create(TweenPart, Info, TweenGoals)
	Tween:Play()
	
	task.wait(waitTime)
end

local function MoveToFlag(flag)
	
	local HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") 
	local Flags = game.Workspace.Map.Flags
	
	-- Turn Off Player Collision
	for index, bodyPart in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if (bodyPart.ClassName == "Part" or bodyPart.ClassName == "MeshPart") and bodyPart.CanCollide == true then
			bodyPart.CanCollide = false
		end
	end
	
	-- Create a Platform
	platform = nil
	if not game.workspace:FindFirstChild("AutofarmPlatform") then
		platform = Instance.new("Part", game.workspace)
		platform.Name = "AutofarmPlatform"
		platform.Size = Vector3.new(15, 0.5, 15)
		platform.Transparency = 1
		platform.Anchored = true
	end
	platform = game.workspace.AutofarmPlatform
	
	MoveCharacter(HRP, 40, CFrame.new(flag.Position.X, HRP.Position.Y + Vector3.new(0, -50, 0), flag.Position.Z), true)

	MoveCharacter(HRP, 5, flag.CFrame + Vector3.new(0, -27, 0), false)
end


local Main = Library:Init({
	name = "D-DAY PRIVATE SCRIPT"
})

local Tab = Main:CreateTab({
	name = "Delete",
	icon = "rbxassetid://15101013637"
})

local Button = Tab:Button({
	name = "Delete Obstacles",
	callback = (function()
		pcall(function()
			for index, model in pairs(game.Workspace.Map.Vegetation:GetChildren()) do
				model:Destroy()
				task.wait(0.05)
			end
			
			for index, model in pairs(game.Workspace.Map.Boundaries:GetChildren()) do
				model:Destroy()
				task.wait(0.05)
			end
			
			for index, model in pairs(game.Workspace.Map.Buildings:GetChildren()) do
				model:Destroy()
				task.wait(0.05)
			end
		end)
	end)
})

local Button = Tab:Button({
	name = "Delete Terrain",
	callback = (function()
		pcall(function()
			game.Terrain:Clear()
		end)
	end)
})

local Tab = Main:CreateTab({
	name = "Flags",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Omaha Beach"
})

local Button = Tab:Button({
	name = "Beach",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Beach.Pole)
	end)
})

local Button = Tab:Button({
	name = "Village",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Village.Pole)
	end)
})

local Button = Tab:Button({
	name = "Forest",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Forest.Pole)
	end)
})

local Button = Tab:Button({
	name = "City",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.City.Pole)
	end)
})

local Button = Tab:Button({
	name = "Stronghold",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Stronghold.Pole)
	end)
})

