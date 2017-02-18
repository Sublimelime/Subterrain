data:extend({
      {
         type = "item",
         name = "subterranean-belt",
         icon = "__base__/graphics/icons/underground-belt.png",
         flags = {"goes-to-quickbar"},
         subgroup = "belt",
         order = "b[underground-belt]-a[underground-belt]",
         place_result = "subterranean-belt",
         stack_size = 50
      },
      {
         type = "item",
         name = "fast-subterranean-belt",
         icon = "__base__/graphics/icons/fast-underground-belt.png",
         flags = {"goes-to-quickbar"},
         subgroup = "belt",
         order = "b[underground-belt]-b[fast-underground-belt]",
         place_result = "fast-subterranean-belt",
         stack_size = 50
      },
      {
         type = "item",
         name = "express-subterranean-belt",
         icon = "__base__/graphics/icons/express-underground-belt.png",
         flags = {"goes-to-quickbar"},
         subgroup = "belt",
         order = "b[underground-belt]-c[express-underground-belt]",
         place_result = "express-subterranean-belt",
         stack_size = 50
      },
      {
         type = "item",
         name = "subterranean-pipe",
         icon = "__base__/graphics/icons/pipe-to-ground.png",
         flags = {"goes-to-quickbar"},
         subgroup = "energy-pipe-distribution",
         order = "a[pipe]-b[pipe-to-ground]",
         place_result = "subterranean-pipe",
         stack_size = 50
      }
})
