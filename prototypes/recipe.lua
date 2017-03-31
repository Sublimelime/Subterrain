data:extend({
      {
         type = "recipe",
         name = "subterranean-belt",
         enabled = false,
         energy_required = 1,
         ingredients =
            {
               {"iron-plate", 15},
               {"transport-belt", 5},
               {"iron-axe",1}
            },
         result_count = 2,
         result = "subterranean-belt",
         requester_paste_multiplier = 4
      },
      {
         type = "recipe",
         name = "fast-subterranean-belt",
         enabled = false,
         ingredients =
            {
               {"iron-gear-wheel", 20},
               {"subterranean-belt", 2},
               {"steel-axe",1}
            },
         result_count = 2,
         result = "fast-subterranean-belt",
         requester_paste_multiplier = 4
      },
      {
         type = "recipe",
         name = "express-subterranean-belt",
         category = "crafting-with-fluid",
         enabled = false,
         ingredients =
            {
               {"iron-gear-wheel", 40},
               {"fast-subterranean-belt", 2},
               {type="fluid", name="lubricant", amount=4},
               {"steel-axe",1}
            },
         result_count = 2,
         result = "express-subterranean-belt"
      },
      {
         type = "recipe",
         name = "subterranean-pipe",
         enabled = false,
         ingredients =
            {
               {"pipe", 16},
               {"iron-plate", 10},
               {"steel-axe",1}
            },
         result_count = 2,
         result = "subterranean-pipe",
         requester_paste_multiplier = 4
      }
})
