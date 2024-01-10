task.wait(5)




loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local TweenService = game:GetService("TweenService")
local platform = nil

_G.Aimbot = false

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

	for index, flagModel in pairs(game.Workspace.Map.Flags:GetChildren()) do
		flagModel.Pole.Transparency = 1
		flagModel.Pole.CanCollide = false
	end

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
		platform.Transparency = 0
		platform.Anchored = true
	end
	platform = game.workspace.AutofarmPlatform

	MoveCharacter(HRP, 40, CFrame.new(flag.Position.X, HRP.Position.Y - 50, flag.Position.Z), true)

	MoveCharacter(HRP, 5, flag.CFrame + Vector3.new(0, -20, 0), false)
end

local function FindClosest(folder)
	local ClosestPart = nil
	local LP = game.Players.LocalPlayer
	for index, item in pairs(folder:GetChildren()) do
		if (ClosestPart == nil or (LP:DistanceFromCharacter(item.Character.Head.Position) < LP:DistanceFromCharacter(ClosestPart.Position))) then
			ClosestPart = item
		end
	end
	return ClosestPart
end

local Main = Library:Init({
	name = "D-DAY PRIVATE SCRIPT"
})

local Tab = Main:CreateTab({
	name = "Delete",
	icon = "rbxassetid://15101013637"
})

local Button = Tab:Button({
	name = "Delete Buildings",
	callback = (function()
		for index, model in pairs(game.Workspace.Map.Buildings:GetChildren()) do
			model:Destroy()
			task.wait(0.025)
		end
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

local Toggle = Tab:Toggle({
	name = "Aimbot",
	callback = function(Value)
		_G.Aimbot = not _G.Aimbot
		
		local AimbotFunction = nil
		
		if _G.Aimbot then
			AimbotFunction = game:GetService("RunService").Heartbeat:Connect(function()
				game.Workspace.Camera.CameraSubject = FindClosest(game.Players)
			end) 
		else
			AimbotFunction:Disconnect()
		end
	end
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

Tab:Section({
	text = "Utah Beach"
})

local Button = Tab:Button({
	name = "Beach",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Beach.Pole)
	end)
})

local Button = Tab:Button({
	name = "Trenches",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Trenches.Pole)
	end)
})

local Button = Tab:Button({
	name = "Village",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Village.Pole)
	end)
})

local Button = Tab:Button({
	name = "Bridge",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Bridge.Pole)
	end)
})

local Button = Tab:Button({
	name = "City",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.City.Pole)
	end)
})

local Button = Tab:Button({
	name = "Church",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Church.Pole)
	end)
})

Tab:Section({
	text = "Castle Itter"
})

local Button = Tab:Button({
	name = "Forest",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Forest.Pole)
	end)
})

local Button = Tab:Button({
	name = "Barn",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Barn.Pole)
	end)
})

local Button = Tab:Button({
	name = "Village",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Village.Pole)
	end)
})

local Button = Tab:Button({
	name = "Walls",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Walls.Pole)
	end)
})

local Button = Tab:Button({
	name = "Tower",
	callback = (function()
		MoveToFlag(game.Workspace.Map.Flags.Tower.Pole)
	end)
})

local Tab = Main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Change Team"
})

local Button = Tab:Button({
	name = "Allies",
	callback = (function()
		game.ReplicatedStorage.Remote.Change_Team:InvokeServer("Allies")
	end)
})

local Button = Tab:Button({
	name = "Axis",
	callback = (function()
		game.ReplicatedStorage.Remote.Change_Team:InvokeServer("Axis")
	end)
})
