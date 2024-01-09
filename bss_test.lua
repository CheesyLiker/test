loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local Main = Library:Init({
	name = "D-DAY PRIVATE SCRIPT"
})

local Tab = Main:CreateTab({
	name = "Delete Structures",
	icon = "rbxassetid://15101013637"
})

local Button = Tab:Button({
	name = "Delete Obstacles",
	callback = (function()
		pcall(function()
			game.Workspace.Map.Vegetation:Destroy()
			game.Workspace.Map.Boundaries:Destroy()
			game.Workspace.Map.Buildings:Destroy()
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
