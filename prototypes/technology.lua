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
               count = 50,
               ingredients = {{"science-pack-1", 1}},
               time = 15
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-logistics-2",
         icon = "__base__/graphics/technology/logistics.png",
         prerequisites = {"logistics-2", "steel-processing", "subterranean-logistics-1"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "fast-subterranean-belt"
               }
            },
         unit =
            {
               count = 80,
               ingredients = {{"science-pack-2", 1},{"science-pack-1",1}},
               time = 30
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-logistics-3",
         icon = "__base__/graphics/technology/logistics.png",
         prerequisites = {"logistics-3","oil-processing","subterranean-logistics-2"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "express-subterranean-belt"
               }
            },
         unit =
            {
               count = 150,
               ingredients = {{"science-pack-2", 1}, {"science-pack-1",1}},
               time = 30
            },
         order = "a-f-a",
      },
      {
         type = "technology",
         name = "subterranean-liquid-logistics",
         icon = "__base__/graphics/technology/landfill.png",
         prerequisites = {"oil-processing","steel-processing"},
         effects =
            {
               {
                  type = "unlock-recipe",
                  recipe = "subterranean-pipe"
               }
            },
         unit =
            {
               count = 170,
               ingredients = {{"science-pack-3", 1},{"science-pack-2",2}},
               time = 30
            },
         order = "a-f-a",
      }
})
