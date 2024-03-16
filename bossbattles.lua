loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

_G.MobsAutofarm = false

local RunService = game:GetService("RunService")

local currentMob = {
	[1] = {Name = "Moldsmal", Quantity = 3},
	[3] = {Name = "Toriel", Quantity = 1},
	[4] = {Name = "HM_Toriel", Quantity = 1},
	[6] = {Name = "Papyrus", Quantity = 1},
	[7] = {Name = "HM_Papyrus", Quantity = 1},
	[8] = {Name = "Mettaton", Quantity = 1},
	[14] = {Name = "Undyne2", Quantity = 1},
}

local function turnOnInviteGUI()
	local LocalPlayer = game.Players.LocalPlayer
	while _G.MobsAutofarm and RunService.RenderStepped:Wait() do
		local firstGUI = LocalPlayer.PlayerGui:FindFirstChild("InviteGUI") 
		local secondGUI = LocalPlayer.PlayerGui:FindFirstChild("InviteGUIa")
		if firstGUI and not firstGUI.Enabled then firstGUI.Enabled = true
		elseif secondGUI and not secondGUI.Enabled then secondGUI.Enabled = true end
	end
end

local function AutofarmFunction()
	_G.MobsAutofarm = not _G.MobsAutofarm
	local cycle = 0
	while _G.MobsAutofarm and task.wait() do
		if cycle == 0 then
			local newThread = coroutine.create(turnOnInviteGUI)
			coroutine.resume(newThread)
		end
		cycle += 1
		
		local LocalPlayer = game.Players.LocalPlayer
		LocalPlayer.CharacterAdded:Wait()
		
		local currentLevel = LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Level").Value
		
		game.Workspace.Mobs.ChildAdded:Connect(function(Boss)
			Boss:WaitForChild("Enemy").Health = 0
		end)
		
		for requiredLevel, bossData in pairs(currentMob) do
			if currentLevel >= requiredLevel then
				game:GetService("Lighting").Invite:FireServer({}, workspace.Game.Teleporters.Model:FindFirstChild(bossData.Name))
				print("seks")
			end
		end
		
		LocalPlayer.CharacterRemoving:Wait()
	end
end

local Main = Library:Init({
	name = "Undertale Boss Battles Private Script"
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
