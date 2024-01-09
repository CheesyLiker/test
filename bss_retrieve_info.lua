------------ Variables ----------------
local LocalPlayer = game.Players.LocalPlayer

------------ Functions ----------------
local function printRPSSstats(group)
	local RetrievePlayerStatsSummary = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStatsSummary"):InvokeServer()
	for groupName, groupStats in pairs(group) do
		print(groupName.."\n")
		for index, stat in pairs(groupStats) do
			print(index..": ", RetrievePlayerStatsSummary[stat]["Desc"])
		end
		print("\n")
	end
end

-- Player Stats

local Honey = LocalPlayer.CoreStats.Honey.Value
local HoneyPerSec = LocalPlayer.PlayerGui.ScreenGui.MeterHUD.HoneyMeter.Bar.PerSecLabel.Text
local Pollen = LocalPlayer.CoreStats.Pollen.Value
local PollenPerSecond = LocalPlayer.PlayerGui.ScreenGui.MeterHUD.PollenMeter.Bar.PerSecLabel.Text
local PlayerHealth = LocalPlayer.Character:WaitForChild("Humanoid").Health

local RPSSgroups = {
	["General Stats"] = {"Gather Total", "Pollen", "Honey Per Pollen", "Honey At Hive", "Pollen From Tools", "Bee Ability Rate", "Bee Ability Pollen", "Pollen From Bees", "Loot Luck"};
	["Conversion"] = {"Convert Total", "Convert Rate", "Convert Rate At Hive", "Instant Conversion", "Bonus Convert Amount"};
	["Critical Chances"] = {"Critical Power", "Critical Chance", "Super-Crit Power", "Super-Crit Chance"};
	["Pollen"] = {"Bomb Pollen", "Buzz Bomb Pollen", "Instant Bomb Conv", "Bubble Pollen", "Instant Bubble Conv", "Flame Pollen", "Instant Flame Conv", "Capacity Multiplier"};
	["Red Pollen"] = {"Red Pollen", "Red Bomb Pollen", "Instant Red Conv", "Red Field Capacity"};
	["Blue Pollen"] = {"Blue Pollen", "Blue Bomb Pollen", "Instant Blue Conv", "Blue Field Capacity"};
	["White Pollen"] = {"White Pollen", "Instant White Conv", "White Field Capacity"};
	["Goo"] = {"Goo", "Goo Conversion"}
}

printRPSSstats(RPSSgroups)
