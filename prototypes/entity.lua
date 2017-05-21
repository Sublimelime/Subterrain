-- Underground belts

data:extend({
      {
         type = "underground-belt",
         name = "subterranean-belt",
         icon = "__base__/graphics/icons/underground-belt.png",
         flags = {"placeable-neutral", "player-creation","not-blueprintable","not-deconstructable"},
         minable = {hardness = 0.2, mining_time = 2, result = "subterranean-belt"},
         max_health = 100,
         corpse = "small-remnants",
         max_distance = 250,
         underground_sprite =
            {
               filename = "__core__/graphics/arrows/underground-lines.png",
               priority = "high",
               width = 64,
               height = 64,
               x = 64,
               scale = 0.5
            },
         resistances =
            {
               {
                  type = "fire",
                  percent = 60
               }
            },
         collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
         selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
         animation_speed_coefficient = 32,
         belt_horizontal = basic_belt_horizontal,
         belt_vertical = basic_belt_vertical,
         ending_top = basic_belt_ending_top,
         ending_bottom = basic_belt_ending_bottom,
         ending_side = basic_belt_ending_side,
         starting_top = basic_belt_starting_top,
         starting_bottom = basic_belt_starting_bottom,
         starting_side = basic_belt_starting_side,
         fast_replaceable_group = "underground-belt",
         speed = 0.03125,
         structure =
            {
               direction_in =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=1,g=0.3,b=0.1,a=1},
                           width = 57,
                           height = 43,
                           y = 43
                        }
                  },
               direction_out =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=1,g=0.3,b=0.1,a=1},
                           width = 57,
                           height = 43
                        }
                  }
            },
         ending_patch = ending_patch_prototype
      },
      {
         type = "underground-belt",
         name = "fast-subterranean-belt",
         icon = "__base__/graphics/icons/fast-underground-belt.png",
         flags = {"placeable-neutral", "player-creation","not-blueprintable","not-deconstructable"},
         minable = {hardness = 0.2, mining_time = 2, result = "fast-subterranean-belt"},
         max_health = 150,
         max_distance = 250,
         corpse = "small-remnants",
         underground_sprite =
            {
               filename = "__core__/graphics/arrows/underground-lines.png",
               priority = "high",
               width = 64,
               height = 64,
               x = 64,
               scale = 0.5
            },
         resistances =
            {
               {
                  type = "fire",
                  percent = 60
               }
            },
         collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
         selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
         animation_speed_coefficient = 32,
         belt_horizontal = fast_belt_horizontal, -- specified in transport-belt-pictures.lua
         belt_vertical = fast_belt_vertical,
         ending_top = fast_belt_ending_top,
         ending_bottom = fast_belt_ending_bottom,
         ending_side = fast_belt_ending_side,
         starting_top = fast_belt_starting_top,
         starting_bottom = fast_belt_starting_bottom,
         starting_side = fast_belt_starting_side,
         fast_replaceable_group = "underground-belt",
         speed = 0.0625,
         structure =
            {
               direction_in =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=1,g=0.1,b=1,a=1},
                           width = 57,
                           height = 43,
                           y = 43
                        }
                  },
               direction_out =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/fast-underground-belt/fast-underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=1,g=0.1,b=1,a=1},
                           width = 57,
                           height = 43
                        }
                  }
            },
         ending_patch = ending_patch_prototype
      },
      {
         type = "underground-belt",
         name = "express-subterranean-belt",
         icon = "__base__/graphics/icons/express-underground-belt.png",
         flags = {"placeable-neutral", "player-creation","not-blueprintable","not-deconstructable"},
         minable = {hardness = 0.2, mining_time = 2, result = "express-subterranean-belt"},
         max_health = 200,
         max_distance = 250,
         corpse = "small-remnants",
         underground_sprite =
            {
               filename = "__core__/graphics/arrows/underground-lines.png",
               priority = "high",
               width = 64,
               height = 64,
               x = 64,
               scale = 0.5
            },
         resistances =
            {
               {
                  type = "fire",
                  percent = 60
               }
            },
         collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
         selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
         animation_speed_coefficient = 32,
         belt_horizontal = express_belt_horizontal, -- specified in transport-belt-pictures.lua
         belt_vertical = express_belt_vertical,
         ending_top = express_belt_ending_top,
         ending_bottom = express_belt_ending_bottom,
         ending_side = express_belt_ending_side,
         starting_top = express_belt_starting_top,
         starting_bottom = express_belt_starting_bottom,
         starting_side = express_belt_starting_side,
         fast_replaceable_group = "underground-belt",
         speed = 0.09375,
         structure =
            {
               direction_in =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=0,g=1,b=1,a=1},
                           width = 57,
                           height = 43,
                           y = 43
                        }
                  },
               direction_out =
                  {
                     sheet =
                        {
                           filename = "__base__/graphics/entity/express-underground-belt/express-underground-belt-structure.png",
                           priority = "extra-high",
                           shift = {0.26, 0},
                           tint = {r=0,g=1,b=1,a=1},
                           width = 57,
                           height = 43
                        }
                  }
            },
         ending_patch = ending_patch_prototype
      }
})

-- Pipe

local subPipe = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
subPipe.flags = {"placeable-neutral", "player-creation"}
subPipe.name = "subterranean-pipe"
subPipe.minable = {hardness = 0.2, mining_time = 2, result = "subterranean-pipe"}
subPipe.max_distance = 250
subPipe.max_health = 200
subPipe.fluid_box.pipe_connections[2].max_underground_distance = 250

subPipe.pictures.up.tint = {r=0.3,g=0,b=0}
subPipe.pictures.left.tint = {r=0.3,g=0,b=0}
subPipe.pictures.right.tint = {r=0.3,g=0,b=0}
subPipe.pictures.down.tint = {r=0.3,g=0,b=0}

subPipe.pictures.up.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.left.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.right.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.down.hr_version.tint = {r=0.3,g=0,b=0}

data:extend{subPipe}
