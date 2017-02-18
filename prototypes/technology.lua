data:extend({

      {
         type = "technology",
         name = "subterranean-logistics-1",
         icon = "__base__/graphics/technology/logistics.png",
         prerequisites = {"logistics"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "subterranean-belt"
               }
            },
         unit =
            {
               count = 20,
               ingredients = {{"science-pack-1", 1}},
               time = 15
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-logistics-2",
         icon = "__base__/graphics/technology/logistics.png",
         prerequisites = {"logistics-2"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "fast-subterranean-belt"
               }
            },
         unit =
            {
               count = 20,
               ingredients = {{"science-pack-1", 1}},
               time = 15
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-logistics-3",
         icon = "__base__/graphics/technology/logistics.png",
         prerequisites = {"logistics-3"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "express-subterranean-belt"
               }
            },
         unit =
            {
               count = 20,
               ingredients = {{"science-pack-1", 1}},
               time = 15
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-liquid-logistics",
         icon = "__base__/graphics/technology/landfill.png",
         prerequisites = {"oil-processing"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "subterranean-pipe"
               }
            },
         unit =
            {
               count = 20,
               ingredients = {{"science-pack-1", 1}},
               time = 15
            },
         order = "a-f-a",
      }
})
