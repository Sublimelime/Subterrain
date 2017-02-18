-- USER CONFIG VARS ---------

-- Change this if you want the mod to take more belts for the same distance, for balancing
local BELT_COST_MULTIPLIER = 1 --(DEFAULT (integer): 1)
-- Change this to false if you'd like to not get the belts back when you break the pair of belts.
local SHOULD_REFUND_BELTS = true -- (DEFAULT (boolean): true)

-----------------------------

script.on_event({defines.events.on_built_entity}, --run whenever the player builds an entity
   function(e)
      local entity=e.created_entity

      --first check to see if it's my belt or pipe being built
      if entity.name=='subterrainian-belt' or entity.name=='fast-subterrainian-belt' or entity.name=='express-subterrainian-belt' then
         if entity.belt_to_ground_type == 'output' then --If they're building the ending piece
            local player=game.players[e.player_index]
            --get neighbor of belt and figure out distance
            local inputEntity = entity.neighbours[1] --the opening end of the pair of belts
            local IX = inputEntity.position.x
            local IY = inputEntity.position.y
            local OX = entity.position.x
            local OY = entity.position.y
            local distance = math.sqrt(math.pow(math.abs(math.floor(IX) - math.floor(OX)),2) + math.pow(math.abs(math.floor(IY) - math.floor(OY)),2))

            --check if they have the correct amount of the respective belt in their inventory
            ------------------------NORMAL BELT
            if entity.name=='subterrainian-belt' then
               if player.get_item_count("transport-belt") < (distance * BELT_COST_MULTIPLIER) then --if they don't have enough
                  entity.destroy() -- Destroy the entity
                  player.print("Not enough transport belts in inventory to create this length.")

                  --give their items back
                  if not player.cursor_stack.valid_for_read then --if that was their last one
                     player.cursor_stack.set_stack{name="subterrainian-belt", count=1}
                  elseif player.cursor_stack.name == "subterrainian-belt" then
                     player.cursor_stack.count = player.cursor_stack.count + 1
                  end
               else --they have enough
                  player.remove_item{name="transport-belt",count=distance * BELT_COST_MULTIPLIER} --deduct the required belts from their inventory
               end

               ---------------------FAST BELT
            elseif entity.name == 'fast-subterrainian-belt' then
               if player.get_item_count("fast-transport-belt") < (distance * BELT_COST_MULTIPLIER) then --if they don't have enough
                  entity.destroy() -- Destroy the entity
                  player.print("Not enough fast transport belts in inventory to create this length.")

                  --give their items back
                  if not player.cursor_stack.valid_for_read then --if that was their last one
                     player.cursor_stack.set_stack{name="fast-subterrainian-belt", count=1}
                  elseif player.cursor_stack.name == "fast-subterrainian-belt" then
                     player.cursor_stack.count = player.cursor_stack.count + 1
                  end
               else --they have enough
                  player.remove_item{name="fast-transport-belt",count=distance * BELT_COST_MULTIPLIER} --deduct the required belts from their inventory
               end

               ------------------EXPRESS BELT
            elseif entity.name == 'express-subterrainian-belt' then
               if player.get_item_count("express-transport-belt") < (distance * BELT_COST_MULTIPLIER)then --if they don't have enough
                  entity.destroy() -- Destroy the entity
                  player.print("Not enough express transport belts in inventory to create this length.")

                  --give their items back
                  if not player.cursor_stack.valid_for_read then --if that was their last one
                     player.cursor_stack.set_stack{name="express-subterrainian-belt", count=1}
                  elseif player.cursor_stack.name == "express-subterrainian-belt" then
                     player.cursor_stack.count = player.cursor_stack.count + 1
                  end
               else --they have enough
                  player.remove_item{name="express-transport-belt",count=distance * BELT_COST_MULTIPLIER} --deduct the required belts from their inventory
               end
            end
         end
      elseif entity.name=='subterrainian-pipe' then
         --todo same as above
      end
   end --ends the function in the event
)

--todo refund belts when broken
