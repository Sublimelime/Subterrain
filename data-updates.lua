if data.raw["underground-belt"]["green-underground-belt"] ~= nil then --bob's logistics is installed
    local entity = data.raw["underground-belt"]["green-underground-belt"]
    entity.max_distance = 250
    table.insert(entity.flags,"not-blueprintable")
    table.insert(entity.flags,"not-deconstructable")
end

if data.raw["underground-belt"]["purple-underground-belt"] ~= nil then --bob's logistics is installed
    local entity = data.raw["underground-belt"]["purple-underground-belt"]
    entity.max_distance = 250
    table.insert(entity.flags,"not-blueprintable")
    table.insert(entity.flags,"not-deconstructable")
end
