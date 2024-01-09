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

getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStatsSummary"):InvokeServer(), "RetrievePlayerStatsSummary")
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrievePlayerStat"):InvokeServer(), "RetrievePlayerStat")
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemPackageEvent"):InvokeServer(), "ItemPackageEvent")
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RetrieveBeeInfoSummary"):InvokeServer(), "RetrieveBeeInfoSummary")
getEventInfo(game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("WindShrineDonation"):InvokeServer(), "WindShrineDonation")
