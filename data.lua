local config = require("config")
local rig = require("prototypes.rig")

-- The wagon: a cargo wagon whose cargo feeds the turrets on its roof.
local wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
wagon.name = config.wagon
wagon.icons = {
  { icon = "__base__/graphics/icons/cargo-wagon.png", icon_size = 64 },
  { icon = "__base__/graphics/icons/gun-turret.png", icon_size = 64, scale = 0.3, shift = { 8, -8 } },
}
wagon.icon = nil
wagon.minable = { mining_time = 0.5, result = config.wagon }
wagon.inventory_size = 10
wagon.color = { r = 0.35, g = 0.4, b = 0.25, a = 1 }
wagon.allow_manual_color = true
wagon.factoriopedia_simulation = nil
rig.armour(wagon)

local item = table.deepcopy(data.raw["item-with-entity-data"]["cargo-wagon"])
item.name = config.wagon
item.icons = wagon.icons
item.icon = nil
item.place_result = config.wagon
item.order = "c[rolling-stock]-b[cargo-wagon]-t[gun-turret-wagon]"

local turret = rig.turret(data.raw["ammo-turret"]["gun-turret"], config.turret, -0.75)

data:extend({
  wagon,
  item,
  turret,
  rig.elevated(turret),
  {
    type = "recipe",
    name = config.wagon,
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "cargo-wagon", amount = 1 },
      { type = "item", name = "gun-turret", amount = 3 },
      { type = "item", name = "steel-plate", amount = 20 },
    },
    results = { { type = "item", name = config.wagon, amount = 1 } },
  },
  {
    type = "technology",
    name = config.wagon,
    icons = {
      { icon = "__base__/graphics/technology/railway.png", icon_size = 256 },
      { icon = "__base__/graphics/technology/gun-turret.png", icon_size = 256, scale = 0.25, shift = { 32, 32 } },
    },
    effects = { { type = "unlock-recipe", recipe = config.wagon } },
    prerequisites = { "railway", "gun-turret", "steel-processing" },
    unit = {
      count = 100,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 15,
    },
  },
})
