
local function getEventInfo(Event, Name)
    print("\n----------["..Name.." Information]----------\n")
    for mainIndex, mainValue in pairs(Event) do
        if type(mainValue) == "table" then
           print("\n[Main Table -> SubTable] Name: "..mainIndex.."\n")
           for subTableIndex1, subTableValue1 in pairs(mainValue) do
               if type(subTableValue1) == "table" then 
                   print("\n[Main Table -> SubTable -> SubTable] Name: "..subTableIndex1.."\n")
                   for subTableIndex2, subTableValue2 in pairs(subTableValue1) do
                        print("Index: "..subTableIndex2, "Value: "..subTableValue2)
                   end
               else
                   print("Index: "..subTableIndex1, "Value: "..subTableValue1)
               end
           end
        else
            print("Index: "..mainIndex, "Value: "..mainValue)
        end
    end
    print("\n")
end
pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrieveCachedPlayerStat"):InvokeServer(), "RetrieveCachedPlayerStat")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStats"):InvokeServer(), "RetrievePlayerStats")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GetPromoInfo"):InvokeServer(), "GetPromoInfo")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("WindShrineDonation"):InvokeServer(), "WindShrineDonation")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrieveBeeInfoSummary"):InvokeServer(), "RetrieveBeeInfoSummary")
end)

pcall(function()

getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemPackageEvent"):InvokeServer(), "ItemPackageEvent")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStat"):InvokeServer(), "RetrievePlayerStat")
end)

pcall(function()
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStatsSummary"):InvokeServer(), "RetrievePlayerStatsSummary")
end)
