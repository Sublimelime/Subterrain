data:extend({
{
    type = "recipe",
    name = "subterrainian-belt",
    enabled = true,
    energy_required = 1,
    ingredients =
    {
      {"iron-plate", 10},
      {"transport-belt", 5}
    },
    result_count = 2,
    result = "subterrainian-belt",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "fast-subterrainian-belt",
    enabled = true,
    ingredients =
    {
      {"iron-gear-wheel", 20},
      {"underground-belt", 2}
    },
    result_count = 2,
    result = "fast-subterrainian-belt",
    requester_paste_multiplier = 4
  },
  {
    type = "recipe",
    name = "express-subterrainian-belt",
    category = "crafting-with-fluid",
    enabled = true,
    ingredients =
    {
      {"iron-gear-wheel", 40},
      {"fast-underground-belt", 2},
      {type="fluid", name="lubricant", amount=4},
    },
    result_count = 2,
    result = "express-subterrainian-belt"
  },
  {
    type = "recipe",
    name = "subterrainian-pipe",
    enabled = true,
    ingredients =
    {
      {"pipe", 10},
      {"iron-plate", 5}
    },
    result_count = 2,
    result = "subterrainian-pipe",
    requester_paste_multiplier = 4
  }
})
