data:extend({
      {
         type = "recipe",
         name = "subterranean-belt",
         enabled = false,
         energy_required = 1,
         ingredients =
            {
               {"iron-plate", 10},
               {"transport-belt", 5}
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
               {"underground-belt", 2}
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
               {"fast-underground-belt", 2},
               {type="fluid", name="lubricant", amount=4},
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
               {"pipe", 10},
               {"iron-plate", 5}
            },
         result_count = 2,
         result = "subterranean-pipe",
         requester_paste_multiplier = 4
      }
})
