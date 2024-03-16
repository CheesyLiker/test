loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

_G.MobsAutofarm = false

local RunService = game:GetService("RunService")

local currentMob = {
	[1] = {Name = "Moldsmal", Quantity = 3},
	[3] = {Name = "Toriel", Quantity = 1},
	[4] = {Name = "HM_Toriel", Quantity = 1},
	[6] = {Name = "Papyrus", Quantity = 1},
	[7] = {Name = "HM_Papyrus", Quantity = 1},
	[8] = {Name = "MTT", Quantity = 1},
	[14] = {Name = "Undyne2", Quantity = 1},
	[21] = {Name = "Sans", Quantity = 1},
	[50] = {Name = "MTT_NEO", Quantity = 1},
	[60] = {Name = "HM_Sans", Quantity = 1},
	[65] = {Name = "HM_Undyne", Quantity = 1},
	[70] = {Name = "HM_Asgore", Quantity = 1},
	[80] = {Name = "HM_Chara", Quantity = 1}
}

local function AutofarmFunction()
	_G.MobsAutofarm = not _G.MobsAutofarm
	while _G.MobsAutofarm and task.wait() do
		local LocalPlayer = game.Players.LocalPlayer
		local currentLevel = LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Level").Value
		print("Current Level:", currentLevel, "DataType:", typeof(currentLevel))
		if currentLevel == 100 then
			game:GetService("ReplicatedStorage").ResetsClick:FireServer(game:GetService("Players").LocalPlayer.leaderstats.Resets)
			LocalPlayer.CharacterRemoving:Wait()
		end
		
		local playerCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local HRP = playerCharacter:WaitForChild("HumanoidRootPart")
		
		game.Workspace.Game.Mobs.ChildAdded:Connect(function(Boss)
			Boss:WaitForChild("Enemy").Health = 0
			HRP.CFrame = Boss:FindFirstChildOfClass("Part").CFrame
			task.wait(0.15)
		end)

		local currentBoss = nil
		for requiredLevel, bossData in pairs(currentMob) do
			if currentLevel >= requiredLevel then currentBoss = bossData end
		end

		local Teleporter = workspace.Game.Teleporters.Model:FindFirstChild(currentBoss.Name)
		
		while LocalPlayer.PlayerGui:WaitForChild("InviteGUI").Enabled == false and task.wait() do
			HRP.CFrame = Teleporter.CFrame
		end
		
		game:GetService("Lighting").Invite:FireServer({}, Teleporter)
		
		LocalPlayer.CharacterRemoving:Wait()
		LocalPlayer.PlayerGui.InviteGUI.Enabled = false
	end
end

local Main = Library:Init({
	name = "Undertale Boss Battles VER 0.26"
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
