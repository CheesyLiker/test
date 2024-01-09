loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

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
