local OV = angelsmods.functions.OV
local move_item = angelsmods.functions.move_item

-------------------------------------------------------------------------------
-- WATER ENRICHMENT -----------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] and data.raw["fluid"]["deuterium"] then
  OV.converter_fluid("heavy-water", "liquid-water-heavy")
  angelsmods.functions.disable_barreling_recipes("heavy-water")
  OV.converter_fluid("deuterium", "gas-deuterium")
  angelsmods.functions.disable_barreling_recipes("deuterium")

  OV.disable_recipe({"bob-heavy-water", "heavy-water-electrolysis"})

  OV.global_replace_technology("heavy-water-processing", "water-chemistry-1")
  OV.disable_technology("heavy-water-processing")
  OV.global_replace_technology("deuterium-processing", "water-chemistry-2")
  OV.disable_technology("deuterium-processing")

  OV.add_unlock("water-chemistry-2", "deuterium-fuel-cell")
  OV.set_science_pack("deuterium-fuel-reprocessing", "utility-science-pack", 1)
  OV.set_science_pack("deuterium-fuel-cell-2", "utility-science-pack", 1)

elseif angelsmods.industries and angelsmods.industries.overhaul then
  -- everything is good, nothing to change

--elseif data.raw["fluid"]["deuterium"] then
  -- not bobs mods, should we do something, usual thing is to do nothing...

else -- no deuterium required, disabling it...
  angelsmods.functions.add_flag("gas-enriched-hydrogen-sulfide", "hidden")
  angelsmods.functions.disable_barreling_recipes("gas-enriched-hydrogen-sulfide")
  angelsmods.functions.add_flag("liquid-water-semiheavy-1", "hidden")
  angelsmods.functions.disable_barreling_recipes("liquid-water-semiheavy-1")
  angelsmods.functions.add_flag("liquid-water-semiheavy-2", "hidden")
  angelsmods.functions.disable_barreling_recipes("liquid-water-semiheavy-2")
  angelsmods.functions.add_flag("liquid-water-semiheavy-3", "hidden")
  angelsmods.functions.disable_barreling_recipes("liquid-water-semiheavy-3")
  angelsmods.functions.add_flag("liquid-water-heavy", "hidden")
  angelsmods.functions.disable_barreling_recipes("liquid-water-heavy")
  angelsmods.functions.add_flag("gas-deuterium", "hidden")
  angelsmods.functions.disable_barreling_recipes("gas-deuterium")

  OV.disable_recipe(
    {
      "angels-hydrogen-sulfide-enrichment",
      "angels-water-enrichment-1",
      "angels-water-enriched-cooling-1",
      "angels-water-enrichment-2",
      "angels-water-enriched-cooling-2",
      "angels-water-enrichment-3",
      "angels-water-enriched-cooling-3",
      "angels-heavy-water-extraction",
      "angels-heavy-water-cooling",
      "angels-heavy-water-separation",
      "angels-heavy-water-separation-2"
    }
  )

  OV.disable_technology({"water-chemistry-1", "water-chemistry-2"})
end

-- Enforce semiheavy water temp
OV.set_temperature_barreling("liquid-water-semiheavy-1", 25)
-- OV.duplicate_barreling_at_temperature("liquid-water-semiheavy-1", 100)
OV.set_temperature_barreling("liquid-water-semiheavy-2", 25)
-- OV.duplicate_barreling_at_temperature("liquid-water-semiheavy-1", 100)
OV.set_temperature_barreling("liquid-water-semiheavy-3", 25)
-- OV.duplicate_barreling_at_temperature("liquid-water-semiheavy-1", 100)
OV.set_temperature_barreling("liquid-water-heavy", 25)
-- OV.duplicate_barreling_at_temperature("liquid-water-heavy", 100)

-------------------------------------------------------------------------------
-- CATALYSTS ------------------------------------------------------------------
-------------------------------------------------------------------------------
if angelsmods.trigger.ores["platinum"] then
  -- angels component and/or science overhaul
  OV.patch_recipes(
    {
      {
        name = "catalyst-metal-red",
        ingredients = {
          {type = "item", name = "iron-ore", amount = 1},
          {type = "item", name = "copper-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-green",
        ingredients = {
          {type = "item", name = "bauxite-ore", amount = 1},
          {type = "item", name = "silver-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-blue",
        ingredients = {
          {type = "item", name = "rutile-ore", amount = 1},
          {type = "item", name = "gold-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-yellow",
        ingredients = {
          {type = "item", name = "tungsten-ore", amount = 1},
          {type = "item", name = "platinum-ore", amount = 1}
        }
      }
    }
  )
elseif mods["bobplates"] or angelsmods.industries and angelsmods.industries.overhaul then
  -- regular overhaul/full angels mode
  OV.patch_recipes(
    {
      {
        name = "catalyst-metal-red",
        ingredients = {
          {type = "item", name = "iron-ore", amount = 1},
          {type = "item", name = "copper-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-green",
        ingredients = {
          {type = "item", name = "bauxite-ore", amount = 1},
          {type = "item", name = "silver-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-blue",
        ingredients = {
          {type = "item", name = "rutile-ore", amount = 1},
          {type = "item", name = "cobalt-ore", amount = 1}
        }
      },
      {
        name = "catalyst-metal-yellow",
        ingredients = {
          {type = "item", name = "tungsten-ore", amount = 1},
          {type = "item", name = "nickel-ore", amount = 1}
        }
      }
    }
  )
else -- special vanilla
  OV.patch_recipes(
    {
      {
        name = "catalyst-metal-red",
        ingredients = {
          {type = "item", name = "angels-ore1", amount = 1},
          {type = "item", name = "angels-ore3", amount = 1}
        }
      },
      {
        name = "catalyst-metal-green",
        ingredients = {
          {type = "item", name = "angels-ore1", amount = 1},
          {type = "item", name = "angels-ore2", amount = 1}
        }
      },
      {
        name = "catalyst-metal-blue",
        ingredients = {
          {type = "item", name = "angels-ore3", amount = 1},
          {type = "item", name = "angels-ore4", amount = 1}
        }
      },
      {
        name = "catalyst-metal-yellow",
        ingredients = {
          {type = "item", name = "angels-ore2", amount = 1},
          {type = "item", name = "angels-ore4", amount = 1}
        }
      }
    }
  )
end

-------------------------------------------------------------------------------
-- VALVES ---------------------------------------------------------------------
-------------------------------------------------------------------------------
if angelsmods.trigger.enableconverter then
else
  angelsmods.functions.add_flag("valve-converter", "hidden")
  OV.disable_recipe("valve-converter")
end

-------------------------------------------------------------------------------
-- SPECIAL VANILLA ------------------------------------------------------------
-------------------------------------------------------------------------------
if angelsmods.functions.is_special_vanilla() then
  OV.disable_recipe(
    {
      "solid-calcium-chloride",
      "catalyst-steam-cracking-butane", -- "gas-butadiene"
      "liquid-styrene-catalyst", -- "liquid-styrene"
      "liquid-ethylbenzene-catalyst", -- "liquid-ethylbenzene"
      "cumene-process", -- "gas-acetone"
      "liquid-bisphenol-a",
      "gas-phosgene",
      "gas-ammonium-chloride",
      "gas-melamine"
    }
  )
  angelsmods.functions.add_flag({
    "solid-calcium-chloride",
    "gas-butadiene",
    "liquid-styrene",
    "liquid-ethylbenzene",
    "liquid-bisphenol-a",
    "gas-phosgene",
    "gas-ammonium-chloride",
    "gas-melamine"
  }, "hidden")
  
  if angelsmods.bioprocessing then
  else
    OV.disable_recipe(
      {
        "gas-urea",
      }
    )
    angelsmods.functions.add_flag({
      "gas-urea",
      "gas-acetone",
    }, "hidden")
  end

  if mods["bobrevamp"] then
  else
    angelsmods.functions.add_flag({
      "gas-hydrogen-peroxide",
    }, "hidden")
  end
end

if angelsmods.trigger.resin then
else
  OV.disable_recipe(
    {
      "solid-resin",
      "liquid-resin-1",
      "liquid-resin-2",
      "liquid-resin-3"
    }
  )
  angelsmods.functions.add_flag("solid-resin", "hidden")
  angelsmods.functions.add_flag("liquid-resin", "hidden")
  OV.disable_technology({
    "resins",
    "resin-1",
    "resin-2",
    "resin-3"
  })
end

if angelsmods.trigger.rubber then
else
  OV.disable_recipe(
    {
      "liquid-rubber-1",
      "solid-rubber"
    }
  )
  angelsmods.functions.add_flag("solid-rubber", "hidden")
  angelsmods.functions.add_flag("liquid-rubber", "hidden")
  OV.disable_technology({
    "rubbers",
    "rubber",
  })
end

if angelsmods.trigger.liquid_ferric_chloride_solution then
else
  OV.disable_recipe(
    {
      "liquid-ferric-chloride-solution"
    }
  )
  angelsmods.functions.add_flag("liquid-ferric-chloride-solution", "hidden")
end

if angelsmods.trigger.liquid_cupric_chloride_solution then
else
  OV.disable_recipe(
    {
      "liquid-cupric-chloride-solution"
    }
  )
  angelsmods.functions.add_flag("liquid-cupric-chloride-solution", "hidden")
end

-------------------------------------------------------------------------------
-- FUEL VALUES ----------------------------------------------------------------
-------------------------------------------------------------------------------
--base fluid is methane, all others are based on relative real values
--==BASED ON VOULMETRIC NUMBERS divided by 10, using methane as the base
local Energy_table = {
  --liquid Naphtha (heavy oil), bobs value is 1MJ (Heavy fuel oil 38.2 MJ/L)(39 MJ/kg)
  ["liquid-naphtha"]     = { fv = 244.7, bp = 260, em = 3, turr = false },
  ["heavy-oil"]          = { fv = angelsmods.trigger.enableconverter and 244.7 or nil, bp = 260, turr = angelsmods.trigger.enableconverter and true or false },
  --liquid Fuel oil (light oil), bobs value 1.5MJ (light fuel oil 39 MJ/L)(40.6 MJ/kg)
  ["liquid-fuel-oil"]    = { fv = 249.9, bp = 180, em = 2, turr = false }, --was 24.99kJ
  ["light-oil"]          = { fv = angelsmods.trigger.enableconverter and 249.9 or nil, bp = 180, turr = angelsmods.trigger.enableconverter and true or false },
  --gas methane (petrogas), bobs value 2.3MJ (methane 35.9 MJ/L)(49.85 MJ/kg)
  ["gas-methane"]        = { fv = 230,   bp = -161, },
  ["petroleum-gas"]      = { fv = angelsmods.trigger.enableconverter and 230 or nil, bp = -161, turr = angelsmods.trigger.enableconverter and true or false },
  ["gas-ethane"]         = { fv = 388.9, bp = -88.6, em = 1.5 }, --gas ethane (), - (ethane 60.7 MJ/L)(47.2 MJ/kg)
  ["gas-butane"]         = { fv = 710.5, bp = -0.5, em = 1.8 }, --gas butane (), - (butane 110.9 MJ/L)(46.46 MJ/kg)
  ["gas-propene"]        = { fv = 521.5, bp = -47.7, em = 5 }, --gas propene (), - (propylene 81.4 MJ/L)(45.8 MJ/kg)
  ["gas-methanol"]       = { fv = 140.6, bp = 65 }, --gas methanol (), - (methanol(L) 15.8 MJ/L)(19.9 MJ/kg)
  ["gas-ethylene"]       = { fv = 263.6, bp = -104 }, --gas ethylene (), - (ethylene conversion from ethane, 263.6 = 0.75*388.9*1411/1561
  ["gas-benzene"]        = { fv = 234.8, bp = 80.1, em = 6 }, --(benzene 36.65 MJ/L = 0.876 kg/L * 78.11 g/mol * 3268 kJ/mol)
  ["crude-oil"]          = { fv = 208.5, bp = 258, turr = false }, --liquid crude (crude oil) sum of parts minus 15%
  ["liquid-mineral-oil"] = { fv = 239.6, bp = 370, em = 5 }, -- (parrafin(L) 37.4 MJ/L)
  ["liquid-condensates"] = { fv = 244.7, bp =-44, em = 3 }, -- (LPG 24.4 MJ/L)
  ["liquid-ngl"]         = { fv = 373.8, bp =-107.2, em = 3 }, -- sum of parts minus 15%
  ["gas-hydrogen"]       = { fv = 33,    bp = -252.9, em = 0.2 --[[>>(may need to go much lower) meant to be 66kJ, but dropped to 33 for reasons.]] }, --gas hydrogen (), bobs value is 45kJ (hydrogen 10.3 MJ/L)(120.1 MJ/kg)
  ["gas-hydrazine"]      = { fv = 126.9, bp = 114, em = 0.1 }, --gas hydrazine (), bobs value is 340kJ (hydrazine 19.8 MJ/L)(19.4 MJ/kg)
  ["liquid-fuel"]        = { fv = 300,   bp = 200, em = 1.5, turr = false }, --down from 2.3MJ. Guessed on bp
  ["gas-ethanol"]        = { fv = 255.4, bp = 77.8 }, --liquid ethanol (), - (ethanol(L), stoichiometric with ethylene, relative molar heats of combustion, 255.4 = 263.6*1367/1411)
  ["liquid-glycerol"]    = { fv = 145.1, bp = 290 } --liquid glycerol (22.6 MJ/L = 1.261 kg/L * 92.1 g/mol * 1654 kJ/mol)
}

local exhaust_heat_capacity = 0.5

data:extend{
  {
    type = "fluid",
    name = "gas-exhaust",
    localised_description = nil,
    icons = angelsmods.functions.create_gas_fluid_icon(
      {"__angelspetrochem__/graphics/icons/molecules/carbon-monoxide.png", 72},
      "CCOc"
    ),
    --icon_size = 32,
    subgroup = "petrochem-basic-fluids",
    order = "f",
    default_temperature = 500,
    gas_temperature = 25,
    heat_capacity = exhaust_heat_capacity.."KJ",
    base_color = angelsmods.functions.fluid_color("CO"),--{r = 1, g = 0.4, b = 0.4},
    flow_color = angelsmods.functions.flow_color("CO"),--{r = 1, g = 0.4, b = 0.4},
    max_temperature = 1500,
  }, {
    type = "fluid",
    name = "mechanical-rotary-power",
    localised_description = nil,
    icons = angelsmods.functions.create_gas_fluid_icon(
        { "__angelspetrochem__/graphics/icons/molecules/carbon-monoxide.png", 72 },
        "CCOc"
    ),
    --icon_size = 32,
    subgroup = "petrochem-basic-fluids",
    order = "f",
    default_temperature = 0,
    gas_temperature = 25,
    heat_capacity = "1KJ",
    base_color = angelsmods.functions.fluid_color("CO"), --{r = 1, g = 0.4, b = 0.4},
    flow_color = angelsmods.functions.flow_color("CO"), --{r = 1, g = 0.4, b = 0.4},
    max_temperature = 1500,
  }
}
local max_bp = 370 -- mineral oil/paraffin
local min_bp = -252.9 -- hydrogen
local max_eff = 0.8
local min_eff = 0.25
local slope = (max_eff - min_eff) / (max_bp - min_bp)

local function calc_torque_eff(bp)
    return (bp - min_bp) * slope + min_eff
end

local function round_value(num, places)
    local m = 10 ^ (places or 0)
    return math.floor(num * m + 0.5) / m
end

-- gas-exhaust and mechanical-rotary-power
local function make_fluid_burning_recipes(fluid_name, vals)
  local torque_eff = calc_torque_eff(vals.bp)
  -- values in kJ
  local torque = round_value(vals.fv*torque_eff, 0  )
  local heat   = vals.fv*(1-torque_eff)
  local temperature = round_value(heat/exhaust_heat_capacity+500, 0 )
  -- We want the T2 recipe to have a rotary wattage of 10 MW, and the T3 wattage to be 40 MW
  -- rotary-power is 100 kJ per unit, so we want to make 100, 400 units of rotary power
  -- multiply units by (100/torque), (400/torque)
  -- multiply by 0.8 to account for max_eff
  local CCGT_wattage = 40 * max_eff -- MW
  local gas_turbine_wattage = 10 * max_eff -- MW

  return {{
    type = "recipe",
    name = "angels-"..fluid_name.."-ccgt-burning",
    category = "angels-ccgt-burning",
    subgroup = "angels-ccgt-burning",
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = fluid_name, amount = 1000/torque*CCGT_wattage, fluid_box_index = 1}
    },
    results = {
      {type = "fluid", name = "mechanical-rotary-power", amount = 10*CCGT_wattage, temperature = 125},
      {type = "fluid", name = "gas-exhaust",            amount = 1000/torque*CCGT_wattage, temperature = temperature}
    },
    always_show_products = true,
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/void.png",
        icon_size = 32}
    },
    crafting_machine_tint = nil
  },{
      type = "recipe",
      name = "angels-" .. fluid_name .. "-gas-turbine-burning",
      category = "angels-gas-turbine-burning",
      subgroup = "angels-gas-turbine-burning",
      energy_required = 1,
      ingredients = {
        { type = "fluid", name = fluid_name, amount = 1000/torque*gas_turbine_wattage }
      },
      results = {
        { type = "fluid", name = "mechanical-rotary-power", amount = 10*gas_turbine_wattage, temperature = 125}
      },
        always_show_products = true,
        icons = {
            {
                icon = "__angelsrefining__/graphics/icons/void.png",
                icon_size = 32 }
        },
      crafting_machine_tint = nil
  }
}
end

local turret_params = data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids

for fluid, vals in pairs(Energy_table) do
  local fluid_data = data.raw.fluid[fluid]
  if vals.fv and fluid_data then
    fluid_data.fuel_value = vals.fv .. "kJ"
    fluid_data.emissions_multiplier = vals.em or data.raw.fluid[fluid].emissions_multiplier or 1
    if vals.turr ~= false then
      table.insert(turret_params, { type = fluid, damage_modifier = vals.fv / Energy_table["gas-methane"].fv })
    end
  data:extend(make_fluid_burning_recipes(fluid, vals))
  end
end

--fuel oil balancing
if mods["bobplates"] then
  data.raw.recipe["enriched-fuel-from-liquid-fuel"].ingredients = { { type = "fluid", name = "liquid-fuel", amount = 100 } } --up from 20
end
