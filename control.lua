local sb, fsb, esb = "subterranean-belt", "fast-subterranean-belt", "express-subterranean-belt"
local tb, ftb, etb =  "transport-belt", "fast-transport-belt", "express-transport-belt"
local sp, pp = "subterranean-pipe", "pipe"


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

local function setForceToPlayer(ioEntity, player)
   if ioEntity.force.name == "neutral" then
      ioEntity.force = player.force
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

      local entity = e.created_entity

      if (entity.name == sb) or (entity.name == fsb) or (entity.name == esb) then
         if settings.global["subterrain-belt-cost-multiplier"].value <= 0 then return nil end --don't cost belts
         local player = game.players[e.player_index]

         --if this belt is the second one being built
         if entity.belt_to_ground_type == "output" or (entity.belt_to_ground_type == "input" and entity.neighbours[1]) then
            local ioEntity = entity.neighbours[1]
            local distance = getDistance(entity, ioEntity)
            local calc = (math.floor(distance * settings.global["subterrain-belt-cost-multiplier"].value))

            setForceToPlayer(ioEntity, player)

            if  entity.name == sb then ------------------------NORMAL BELT
               if not checkCount(player, calc, tb) then
                  entity.destroy()
                  player.print("You don't have enough transport belts in your inventory to create this length.")

                  restoreDeniedItem(player,sb)

               else --they have enough
                  player.remove_item{name = tb, count = calc} --deduct the required belts from their inventory
               end

            elseif entity.name == fsb then ---------------------FAST BELT
               if not checkCount(player, calc, ftb) then
                  entity.destroy()
                  player.print("You don't have enough fast transport belts in your inventory to create this length.")

                  restoreDeniedItem(player,fsb)

               else --they have enough
                  player.remove_item{name = ftb, count = calc} --deduct the required belts from their inventory
               end

            elseif entity.name == esb then ------------------EXPRESS BELT
               if not checkCount(player, calc, etb) then
                  entity.destroy()
                  player.print("You don't have enough express transport belts in your inventory to create this length.")

                  restoreDeniedItem(player,esb)

               else --they have enough
                  player.remove_item{name = etb, count = calc} --deduct the required belts from their inventory
               end
            end
         end

      elseif entity.name == sp then
         entity.rotatable = false --Prevent rotation, as that can be used to game the system

         if settings.global["subterrain-pipe-cost-multiplier"].value <= 0 then return nil end
         local player = game.players[e.player_index]
         local ioEntity = entity.neighbours[2]

         if not ioEntity then
            return nil --no need to do anything if this is the first placed
         end

         local distance = getDistance(entity, ioEntity)
         local calc = (math.floor(distance * settings.global["subterrain-pipe-cost-multiplier"].value))

         setForceToPlayer(ioEntity, player)

         if not checkCount(player, calc, pp) then
            entity.destroy()
            player.print("You don't have enough pipes in your inventory to create this length.")

            restoreDeniedItem(player,sp)
         else
            player.remove_item{name = pp, count = calc} --charge the player the pipes
         end
      end
   end
)

script.on_event({defines.events.on_preplayer_mined_item}, --Called before the mined item is removed from the map
   function(e)
      local entity = e.entity

      if (entity.name == sb) or (entity.name == fsb) or (entity.name == esb) then
         --don't do any of this if not refunding belts, or refund should not be given
         if (not settings.global["subterrain-should-refund-belts"].value) or (settings.global["subterrain-belt-refund-multiplier"].value <= 0) then
            return nil
         end

         local player = game.players[e.player_index]
         local ioEntity = entity.neighbours[1] or entity
         local distance = getDistance(entity, ioEntity)

         --it has no pair, aka itself, or a reward was already given
         if (distance == 0)  or (entity.force.name == "neutral") or (ioEntity.force.name == "neutral") then
            return nil
         end

         ioEntity.force = "neutral"
         local calc = (math.floor((distance * settings.global["subterrain-belt-cost-multiplier"].value) * settings.global["subterrain-belt-refund-multiplier"].value))

         if player.character then
            if entity.name == sb then
               player.insert{name = tb, count = calc}
            elseif entity.name == fsb then
               player.insert{name = ftb, count = calc}
            elseif entity.name == esb then
               player.insert{name = etb, count = calc}
            end
         end

      elseif entity.name == sp then
         local player = game.players[e.player_index]

         if (not settings.global["subterrain-should-refund-pipes"].value) or (settings.global["subterrain-pipe-refund-multiplier"].value <= 0) then --don't do any of this if not refunding pipes
            return nil
         end

         local ioEntity = entity.neighbours[2] or entity --the opening end of the pair of pipes or itself
         local distance = getDistance(entity, ioEntity)

         if (distance == 0)  or (entity.force.name == "neutral") or (ioEntity.force.name == "neutral") then --it has no pair, aka itself, or a reward was already given
            return nil
         end

         ioEntity.force = "neutral"
         local calc = (math.floor((distance * settings.global["subterrain-pipe-cost-multiplier"].value) * settings.global["subterrain-pipe-refund-multiplier"].value))

         if player.character then
            player.insert{name = pp, count = calc}
         end
      end
   end
)
