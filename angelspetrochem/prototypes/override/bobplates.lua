local OV = angelsmods.functions.OV
local move_item = angelsmods.functions.move_item

if mods["bobplates"] then
  OV.disable_recipe({"bob-resin-oil"})
end

-------------------------------------------------------------------------------
-- CONVERT FLUIDS TO ANGELS VERSION -------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  -- water
  if settings.startup["bobmods-plates-purewater"].value == true then
    OV.converter_fluid("pure-water", "water-purified")
    angelsmods.functions.disable_barreling_recipes("pure-water")
  end

  OV.converter_fluid("oxygen", "gas-oxygen")
  angelsmods.functions.disable_barreling_recipes("oxygen")

  OV.converter_fluid("hydrogen", "gas-hydrogen")
  angelsmods.functions.disable_barreling_recipes("hydrogen")

  -- nitrogen (air)
  OV.converter_fluid("liquid-air", "gas-oxygen")
  angelsmods.functions.disable_barreling_recipes("liquid-air")

  OV.converter_fluid("nitrogen", "gas-nitrogen")
  angelsmods.functions.disable_barreling_recipes("nitrogen")

  OV.converter_fluid("nitrogen-dioxide", "gas-nitrogen-dioxide")
  angelsmods.functions.disable_barreling_recipes("nitrogen-dioxide")

  OV.converter_fluid("nitric-acid", "liquid-nitric-acid")
  angelsmods.functions.disable_barreling_recipes("nitric-acid")

  -- sulfur
  OV.converter_fluid("hydrogen-sulfide", "gas-hydrogen-sulfide")
  angelsmods.functions.disable_barreling_recipes("hydrogen-sulfide")

  OV.converter_fluid("sulfur-dioxide", "gas-sulfur-dioxide")
  angelsmods.functions.disable_barreling_recipes("sulfur-dioxide")

  -- chlorine
  OV.converter_fluid("chlorine", "gas-chlorine")
  angelsmods.functions.disable_barreling_recipes("chlorine")

  OV.converter_fluid("hydrogen-chloride", "gas-hydrogen-chloride")
  angelsmods.functions.disable_barreling_recipes("hydrogen-chloride")

  OV.converter_fluid("ferric-chloride-solution", "liquid-ferric-chloride-solution")
  angelsmods.functions.disable_barreling_recipes("ferric-chloride-solution")
end

-------------------------------------------------------------------------------
-- TECH TREE CLEANUP ----------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  -- electronics tech patch ---------------------------------------------------
  OV.remove_prereq("electronics","alloy-processing")
  if mods["bobelectronics"] then
    OV.add_prereq("electronics","angels-coal-processing")
  end
end

-------------------------------------------------------------------------------
-- ICON ADJUSTMENTS -----------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  -- liquid fuel --------------------------------------------------------------
  move_item("liquid-fuel", "petrochem-carbon-fluids", "dac", "fluid")
  data.raw["fluid"]["liquid-fuel"].icon = nil
  data.raw["fluid"]["liquid-fuel"].icons = angelsmods.functions.create_liquid_fluid_icon(
    nil,
    {{237, 212, 104}, {247, 216, 081}, {247, 216, 081}}
  )
  OV.barrel_overrides("liquid-fuel", "acid")
  
  data.raw["recipe"]["liquid-fuel"].always_show_products = true
  data.raw["recipe"]["liquid-fuel"].icon = nil
  data.raw["recipe"]["liquid-fuel"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {"liquid-fuel"},
    {{237, 212, 104}, {247, 216, 081}, {247, 216, 081}}
  )
  OV.patch_recipes(
    {
      {
        name = "liquid-fuel",
        ingredients = {
          {"!!"},
          {name = "liquid-fuel-oil", type = "fluid", amount = 40},
          {name = "gas-residual", type = "fluid", amount = 10}
        },
        results = {
          {name = "liquid-fuel", type = "fluid", amount = 50}
        },
        subgroup = "petrochem-carbon-oil-feed",
        order = "h"
      }
    }
  )
  OV.add_unlock("angels-oil-processing", "liquid-fuel")

end

-------------------------------------------------------------------------------
-- RESIN HANDLING -------------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  if angelsmods.trigger.resin then
    OV.global_replace_item({"solid-resin"}, "resin")
    angelsmods.functions.add_flag("solid-resin", "hidden")
    move_item("resin", "petrochem-solids", "a[petrochem-solids]-b[resin]")

    OV.patch_recipes(
      {
        {
          name = "bob-resin-wood",
          ingredients = {
            {name = "wood", type = "item", amount = "+4"}
          },
          subgroup = "petrochem-solids",
          order = "b[resin]-b[solid]-a",
          icons = angelsmods.functions.add_number_icon_layer(
            {
              {
                icon = "__bobplates__/graphics/icons/resin.png",
                icon_size = 32, icon_mipmaps = 1,
              }
            },
            1, angelsmods.petrochem.number_tint),
        },
        {
          name = "solid-resin",
          order = "b[resin]-b[solid]-b",
          icons = mods["angelsbioprocessing"] and {
            {
              icon = "__bobplates__/graphics/icons/resin.png",
              icon_size = 32, icon_mipmaps = 1,
            },
          } or angelsmods.functions.add_number_icon_layer({
            {
              icon = "__bobplates__/graphics/icons/resin.png",
              icon_size = 32, icon_mipmaps = 1,
            }
          },
          2, angelsmods.petrochem.number_tint),
        }
      }
    )

    if mods["angelsbioprocessing"] then
      OV.disable_recipe({"bob-resin-wood"})
    end

    OV.remove_unlock("plastics", "synthetic-wood")
    OV.disable_recipe({"synthetic-wood"})
  else
    angelsmods.functions.add_flag("resin", "hidden")
    OV.disable_recipe({
      "bob-resin-wood",
      "solid-resin",
    })
  end
end

-------------------------------------------------------------------------------
-- RUBBER HANDLING ------------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  if angelsmods.trigger.rubber then
    OV.global_replace_item("solid-rubber", "rubber")
    angelsmods.functions.add_flag("solid-rubber", "hidden")
    move_item("rubber", "petrochem-solids", "a[petrochem-solids]-c[rubber]-a")

    if mods["bobelectronics"] then
      OV.patch_recipes(
        {
          {
            name = "bob-rubber",
            enabled = false,
            ingredients = {
              {"!!"},
              {type = "item", name = "resin", amount = 3}
            },
            subgroup = "petrochem-solids-2",
            order = "b[rubber]-b[solid]-a",
            icons = angelsmods.functions.add_number_icon_layer(
              {
                {
                  icon = "__bobplates__/graphics/icons/rubber.png",
                  icon_size = 32, icon_mipmaps = 1,
                }
              },
              1, angelsmods.petrochem.number_tint),
          },
          {
            name = "solid-rubber",
            subgroup = "petrochem-solids-2",
            order = "b[rubber]-b[solid]-a",
            icons = angelsmods.functions.add_number_icon_layer(
              {
                {
                  icon = "__bobplates__/graphics/icons/rubber.png",
                  icon_size = 32, icon_mipmaps = 1,
                }
              },
              2, angelsmods.petrochem.number_tint),
          }
        }
      )
    else
      OV.disable_recipe("bob-rubber")
    end
  else
    angelsmods.functions.add_flag("rubber", "hidden")
    OV.disable_recipe("bob-rubber")
  end
end

-------------------------------------------------------------------------------
-- WATER ENRICHMENT -----------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  if data.raw.recipe["pure-water-pump"] then
    data.raw.recipe["pure-water-pump"].icon = nil
    data.raw.recipe["pure-water-pump"].icon_size = 32
    data.raw.recipe["pure-water-pump"].icons = {{icon = "__angelsrefining__/graphics/icons/water-purified.png"}}
  end
end
