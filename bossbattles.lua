loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

_G.MobsAutofarm = false

local RunService = game:GetService("RunService")

local currentMob = {
	[1] = {Name = "Moldsmal", Progress = 1},
	[3] = {Name = "Toriel", Progress = 2},
	[4] = {Name = "HM_Toriel", Progress = 3},
	[6] = {Name = "Papyrus", Progress = 4},
	[7] = {Name = "HM_Papyrus", Progress = 5},
	[8] = {Name = "MTT", Progress = 6},
	[14] = {Name = "Undyne2", Progress = 7},
	[21] = {Name = "Sans", Progress = 8},
	[50] = {Name = "MTT_NEO", Progress = 9},
	[60] = {Name = "HM_Sans", Progress = 10},
	[65] = {Name = "HM_Undyne", Progress = 11},
	[70] = {Name = "HM_Asgore", Progress = 12},
	[80] = {Name = "HM_Chara", Progress = 13}
}

local function AutofarmFunction()
	_G.MobsAutofarm = not _G.MobsAutofarm
	while _G.MobsAutofarm and task.wait() do
		local LocalPlayer = game.Players.LocalPlayer
		local currentLevel = LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Level").Value

		if currentLevel == 100 then
			game:GetService("ReplicatedStorage").ResetsClick:FireServer(game:GetService("Players").LocalPlayer.leaderstats.Resets)
			currentLevel = 1
			LocalPlayer.CharacterAdded:Wait()
			LocalPlayer.CharacterRemoving:Wait()
		end

		local playerCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local HRP = playerCharacter:WaitForChild("HumanoidRootPart")
		
		game.Workspace.Game.Mobs.ChildAdded:Connect(function(Boss)
			Boss:WaitForChild("Enemy").Health = 0
			HRP.CFrame = Boss:FindFirstChildOfClass("Part").CFrame
			task.wait(0.15)
			game.Players.LocalPlayer.PlayerGui:WaitForChild("InviteGUI").Enabled = false
		end)
		
		local currentBoss = nil
		local lastSavedProgress = 1
		for requiredLevel, bossData in pairs(currentMob) do
			if currentLevel >= requiredLevel and bossData.Progress >= lastSavedProgress then 
				currentBoss = bossData
				lastSavedProgress = bossData.Progress
			end
		end

		local Teleporter = workspace.Game.Teleporters.Model:FindFirstChild(currentBoss.Name)
		
		while LocalPlayer.PlayerGui:WaitForChild("InviteGUI").Enabled == false and task.wait() do
			HRP.CFrame = Teleporter.CFrame
		end
		
		game:GetService("Lighting").Invite:FireServer({}, Teleporter)
		LocalPlayer.CharacterRemoving:Wait()
	end
end

local Main = Library:Init({
	name = "Undertale Boss Battles VER 0.37"
})

local Tab = Main:CreateTab({
	name = "Autofarm",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Autofarm"
})

local Button = Tab:Button({
	name = "Autofarm Mobs",
	callback = (function()
		AutofarmFunction()
	end)
})

Tab:Section({
	text = "Kill All Mobs"
})

local Button = Tab:Button({
	name = "Kill All Mobs",
	callback = (function()
		for _, v in pairs(game.Workspace.Game.Mobs:GetChildren()) do
			v:FindFirstChildOfClass("Humanoid").Health = 0
		end
	end)
})

Tab:Section({
	text = "Print Player Level"
})

local Button = Tab:Button({
	name = "Print Player Level",
	callback = (function()
		print(game.Players.LocalPlayer.leaderstats.Level.Value)
	end)
})

Tab:Section({
	text = "Get a Godmode"
})

local Button = Tab:Button({
	name = "Get a Godmode",
	callback = (function()
		local ohString1 = "DamageTaken"
		local ohBoolean2 = false
		local ohNumber3 = 0/0

		game:GetService("ReplicatedStorage").Functions:FireServer(ohString1, ohBoolean2, ohNumber3)
	end)
})
