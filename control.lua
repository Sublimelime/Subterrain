local sb, fsb, esb = "subterranean-belt", "fast-subterranean-belt", "express-subterranean-belt"
local sp = "subterranean-pipe"
local gub, pup = "green-underground-belt", "purple-underground-belt"

local function getDistance(entity, ioEntity)
    return math.sqrt(math.pow(math.abs(math.floor(ioEntity.position.x) - math.floor(entity.position.x)), 2) + math.pow(math.abs(math.floor(ioEntity.position.y) - math.floor(entity.position.y)), 2))
end

local function checkCount(player, count, what)
    if player.get_item_count(what) < count then
        return false
    else
        return true
    end
end

local function restoreDeniedItem(player,item)
    if not player.cursor_stack.valid_for_read then --if that was their last one
        player.cursor_stack.set_stack{name = item, count = 1}
    elseif player.cursor_stack.name == item then
        player.cursor_stack.count = player.cursor_stack.count + 1
    end
end


script.on_event({defines.events.on_built_entity}, --run whenever the player builds an entity
    function(e)
        local entity = e.entity
        local player = game.players[e.player_index]

        if event.name == sb or event.name == fsb or event.name == esb then
            subterrainOnBuilt(event)
        elseif event.name == sp  then
            subterrainPipesOnBuilt(event)
        elseif entity.name == gub or entity.name == pup then
            bobsLogisticsOnBuilt(event)
        end
    end --ends event function
)

-- Actions for subterrain on built.
function subterrainOnBuilt(event)
    if settings.global["subterrain-belt-cost-multiplier"].value <= 0 then return nil end --don't cost belts
    local entity = e.entity
    local player = game.players[e.player_index]

    --check to see if the place is important
    if not entity.belt_to_ground_type == "output" or not (entity.belt_to_ground_type == "input" and entity.neighbours) then
        return
    end

    local otherEntity = entity.neighbours
    local distance = getDistance(entity, otherEntity)
    local cost = (math.floor(distance * settings.global["subterrain-belt-cost-multiplier"].value))
    local respectiveBelts = string.gsub(entity.name, "subterranean", "transport")
    local respectiveBelts_pretty = respectiveBelts:gsub("-", " ") .. "s"

    otherEntity.force = "player" --set the force of the other side to player, to allow refund

    if not checkCount(player, cost, respectiveBelts) then --they don't have enough of the aboveground belts for this distance
        entity.destroy()
        player.print("You don't have enough " .. respectiveBelts_pretty ..  " in your inventory to create this length.")

        restoreDeniedItem(player,respectiveBelts)
    else
        player.remove_item{name = respectiveBelts, count = cost} --deduct the required belts from their inventory
    end
end

--actions for subterrain pipes on built
function subterrainPipesOnBuilt(event)
    local entity = e.entity
    local player = game.players[e.player_index]
    entity.rotatable = false --Prevent rotation, as that can be used to game the system

    if settings.global["subterrain-pipe-cost-multiplier"].value <= 0 then return nil end --no pipe cost

    local otherPipe = entity.neighbours[2] or nil

    if not otherPipe then
        return nil --no need to do anything if this is the first placed
    end

    local distance = getDistance(entity, otherPipe)
    local calc = (math.floor(distance * settings.global["subterrain-pipe-cost-multiplier"].value))

    otherPipe.force = "player"

    if not checkCount(player, calc, "pipe") then
        entity.destroy()
        player.print("You don't have enough pipes in your inventory to create this length.")

        restoreDeniedItem(player, sp)
    else
        player.remove_item{name = "pipe", count = calc} --charge the player the pipes
    end
end


--actions for bob's logistics on built
function bobsLogisticsOnBuilt(event)
    if settings.global["subterrain-belt-cost-multiplier"].value <= 0 then return nil end --don't cost belts
    local entity = e.entity
    local player = game.players[e.player_index]

    --check to see if the place is important
    if not entity.belt_to_ground_type == "output" or not (entity.belt_to_ground_type == "input" and entity.neighbours) then
        return
    end

    local otherEntity = entity.neighbours
    local distance = getDistance(entity, otherEntity)
    local cost = (math.floor(distance * settings.global["subterrain-belt-cost-multiplier"].value))
    local respectiveBelts = string.gsub(entity.name, "underground", "transport")
    local respectiveBelts_pretty = respectiveBelts:gsub("-", " ") .. "s"

    otherEntity.force = "player" --set the force of the other side to player, to allow refund

    if not checkCount(player, cost, respectiveBelts) then --they don't have enough of the aboveground belts for this distance
        entity.destroy()
        player.print("You don't have enough " .. respectiveBelts_pretty ..  " in your inventory to create this length.")

        restoreDeniedItem(player,respectiveBelts)
    else
        player.remove_item{name = respectiveBelts, count = cost} --deduct the required belts from their inventory
    end
end


script.on_event({defines.events.on_preplayer_mined_item}, --Called before the mined item is removed from the map
    function(e)

    end
)
