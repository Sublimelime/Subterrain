-- USER CONFIG VARS ---------

-- Change this if you want the mod to take more belts for the same distance, for balancing
local BELT_COST_MULTIPLIER = 1 --(DEFAULT (integer, cannot be floating point): 1)

-- Change this if you want the mod to take more pipe for the same distance, for balancing
local PIPE_COST_MULTIPLIER = 1 --(DEFAULT (integer, cannot be floating point): 1)

-- Change this to false if you'd like to not get the belts back when you break the pair of belts.
local SHOULD_REFUND_BELTS = true -- (DEFAULT (boolean): true)

-- Change this to false if pipes should not be refunded.
local SHOULD_REFUND_PIPES = true -- (DEFAULT (boolean): true)

-- Change this if you'd like to change what percentage of belts get returned when breaking the pair of belts. 0 means no belts, 0.5 means 50% of belts used, 2 for twice the amount used, etc. Overridden if SHOULD_REFUND_BELTS is false.
local BELT_REFUND_MULTIPLIER = 1.0 --(DEFAULT (floating point): 1.0)

-- Change this if you'd like to change what percentage of pipes get returned when breaking the pair of pipe to grounds. For valid numbers, see field above
local PIPE_REFUND_MULTIPLIER = 1.0 --(DEFAULT (floating point): 1.0)

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
            --distance formula to find out distance
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
         local player=game.players[e.player_index]
         --get neighbor of pipe and figure out distance
         local inputEntity = entity.neighbours[2] --the opening end of the pair of pipes
         if not inputEntity then --this will be nil if we're building the first pipe
            return nil
         end
         local IX = inputEntity.position.x
         local IY = inputEntity.position.y
         local OX = entity.position.x
         local OY = entity.position.y
         --distance formula to find out distance
         local distance = math.sqrt(math.pow(math.abs(math.floor(IX) - math.floor(OX)),2) + math.pow(math.abs(math.floor(IY) - math.floor(OY)),2))

         if player.get_item_count("pipe") < (distance * PIPE_COST_MULTIPLIER) then --if they don't have enough
            entity.destroy() -- Destroy the entity
            player.print("Not enough pipes in inventory to create this length.")

            --give their items back
            if not player.cursor_stack.valid_for_read then --if that was their last one
               player.cursor_stack.set_stack{name="subterrainian-pipe", count=1}
            elseif player.cursor_stack.name == "subterrainian-pipe" then
               player.cursor_stack.count = player.cursor_stack.count + 1
            end
         else --they have enough
            player.remove_item{name="pipe",count=distance * PIPE_COST_MULTIPLIER} --deduct the required belts from their inventory
         end

      end --ends the pipe code
   end --ends the function in the event
)

script.on_event({defines.events.on_preplayer_mined_item}, --Called before the mined item is removed from the map
   function(e)

      local entity=e.entity

      --first check to see if it's my belt or pipe being removed
      if entity.name=='subterrainian-belt' or entity.name=='fast-subterrainian-belt' or entity.name=='express-subterrainian-belt' then
         if not SHOULD_REFUND_BELTS or BELT_REFUND_MULTIPLIER <= 0 then --don't do any of this if not refunding belts
            return nil
         end

         if entity.belt_to_ground_type == 'output' then --If they're breaking the ending piece
            local player=game.players[e.player_index]
            --get neighbor of belt and figure out distance
            local inputEntity = entity.neighbours[1] or entity --the opening end of the pair of belts or itself
            local IX = inputEntity.position.x
            local IY = inputEntity.position.y
            local OX = entity.position.x
            local OY = entity.position.y
            --distance formula to find out distance
            local distance = math.sqrt(math.pow(math.abs(math.floor(IX) - math.floor(OX)),2) + math.pow(math.abs(math.floor(IY) - math.floor(OY)),2))

            if distance == 0 then
               return nil
            end
            --find and place a chest full of the belts to refund
            local chestPosition = game.surfaces[1].find_non_colliding_position("steel-chest", player.position, 0, 1.5)
            local chestEntity = nil
            if chestPosition then --if found a position for the chest
               chestEntity = game.surfaces[1].create_entity({name="wooden-chest",position=chestPosition,force="neutral"})
            end

            if chestEntity then

               --fill the chest with belts corresponding to what the belt pair was made of
               if entity.name == 'subterrainian-belt' then
                  chestEntity.insert{name="transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               elseif entity.name == 'fast-subterrainian-belt' then
                  chestEntity.insert{name="fast-transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               elseif entity.name == 'express-subterrainian-belt' then
                  chestEntity.insert{name="express-transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               end
            end

         elseif entity.belt_to_ground_type == 'input' then --they broke the input first
            local player=game.players[e.player_index]
            --get neighbor of belt and figure out distance
            local outputEntity = entity.neighbours[1] or entity --the opening end of the pair of belts, or itself

            local IX = outputEntity.position.x
            local IY = outputEntity.position.y
            local OX = entity.position.x
            local OY = entity.position.y
            --distance formula to find out distance
            local distance = math.sqrt(math.pow(math.abs(math.floor(IX) - math.floor(OX)),2) + math.pow(math.abs(math.floor(IY) - math.floor(OY)),2))

            if distance == 0 then --there's no other match for this belt, so refund has already been given/should not be
               return nil
            end

            --find and place a chest full of the belts to refund
            local chestPosition = game.surfaces[1].find_non_colliding_position("steel-chest", player.position, 0, 1.5)
            local chestEntity = nil
            if chestPosition then --if found a position for the chest
               chestEntity = game.surfaces[1].create_entity({name="wooden-chest",position=chestPosition,force="neutral"})
            end

            if chestEntity then
               --fill the chest with belts corresponding to what the belt pair was made of
               if entity.name == 'subterrainian-belt' then
                  chestEntity.insert{name="transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               elseif entity.name == 'fast-subterrainian-belt' then
                  chestEntity.insert{name="fast-transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               elseif entity.name == 'express-subterrainian-belt' then
                  chestEntity.insert{name="express-transport-belt",count=math.floor((distance * BELT_COST_MULTIPLIER) * BELT_REFUND_MULTIPLIER)}
               end

            end

         end

      elseif entity.name=='subterrainian-pipe' then
         if not SHOULD_REFUND_PIPES or PIPE_REFUND_MULTIPLIER <= 0 then --don't do any of this if not refunding pipes
            return nil
         end

         local player=game.players[e.player_index]
         --get neighbor of belt and figure out distance
         local inputEntity = entity.neighbours[2] or entity --the opening end of the pair of pipes or itself
         local IX = inputEntity.position.x
         local IY = inputEntity.position.y
         local OX = entity.position.x
         local OY = entity.position.y
         --distance formula to find out distance
         local distance = math.sqrt(math.pow(math.abs(math.floor(IX) - math.floor(OX)),2) + math.pow(math.abs(math.floor(IY) - math.floor(OY)),2))

         if distance == 0 then --it has no pair, aka itself
            return nil
         end
         --find and place a chest full of the pipes to refund
         local chestPosition = game.surfaces[1].find_non_colliding_position("wooden-chest", player.position, 0, 1.5)
         local chestEntity = nil
         if chestPosition then --if found a position for the chest
            chestEntity = game.surfaces[1].create_entity({name="wooden-chest",position=chestPosition,force="neutral"})
         end

         if chestEntity then
            --fill the chest with pipes
            chestEntity.insert{name="pipe",count=math.floor((distance * PIPE_COST_MULTIPLIER) * PIPE_REFUND_MULTIPLIER)}
         end
      end

   end
)
