start = tick()
local data = game:HttpGet("https://anaminus.github.io/rbx/json/api/latest.json")
local a = game:GetService("HttpService"):JSONDecode(data)
newdata = {}
local voltma = {}
for i,v in a do
    if v["Superclass"] then 
        if not voltma[v["Superclass"]] then 
            newdata[v["Superclass"]] = {}
            voltma[v["Superclass"]] = true
        end
    end
end
for i,v in a do
    if v["type"] == "Class" then 
        newdata[v["Name"]] = {}
    end
end
for i,v in a do
    if v["type"] == "Property" then 
        newdata[v["Class"]][v["Name"]] = v["ValueType"]
    end
end

for i,v in a do
    if v["Superclass"] then 
        for u,k in pairs(newdata[v["Superclass"]]) do
            newdata[v.Name][u] = k
        end
    end
end
print("Done!\nTook ".. math.round((tick()-start)*100)/100 .."s")
return newdata