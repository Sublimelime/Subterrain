data:extend({

  {
    type = "technology",
    name = "subterrainian-logistics-1",
    icon = "__base__/graphics/technology/logistics.png",
    prerequisites = {"logistics"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "subterrainian-belt"
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
    name = "subterrainian-logistics-2",
    icon = "__base__/graphics/technology/logistics.png",
    prerequisites = {"logistics-2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fast-subterrainian-belt"
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
    name = "subterrainian-logistics-3",
    icon = "__base__/graphics/technology/logistics.png",
    prerequisites = {"logistics-3"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "express-subterrainian-belt"
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
    name = "subterrainian-liquid-logistics",
    icon = "__base__/graphics/technology/landfill.png",
    prerequisites = {"oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "subterrainian-pipe"
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
