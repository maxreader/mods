data:extend(
  {
    {
      type = "recipe",
      name = "water-mineralized",
      category = "liquifying",
      subgroup = "water-treatment",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water", amount = 100},
        {type = "item", name = "stone-crushed", amount = 10}
      },
      results = {
        {type = "fluid", name = "water-mineralized", amount = 100}
      },
      main_product = "water-mineralized",
      always_show_products = true,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water"--[[,"stone-crushed"]],"water-mineralised"}),--get_fluid_recipe_tint("water-mineralized"),
      order = "a[water-water-mineralized]"
    },
    {
      type = "recipe",
      name = "water-purification",
      category = "water-treatment",
      subgroup = "water-treatment",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water", amount = 150}
      },
      results = {
        {type = "fluid", name = "water-saline", amount = 20},
        {type = "fluid", name = "water-purified", amount = 100}
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-saline",
          "water-purified"
        },
        "WsWsWs"
      ),
      order = "b[water-purification]"
    },
    {
      type = "recipe",
      name = "thermal-water-purification",
      category = "water-treatment",
      subgroup = "water-treatment",
      energy_required = 1,
      enabled = false,
      hidden = true,
      ingredients = {
        {type = "fluid", name = "thermal-water", amount = 50}
      },
      results = {
        {type = "fluid", name = "mineral-sludge", amount = 20},
        {type = "fluid", name = "water-purified", amount = 30}
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-purified",
          "mineral-sludge"
        },
        {{238, 113, 022}, {203, 099, 015}, {167, 078, 013}}
      ),
      order = "c[thermal-water-purification]"
    },
    --WASTE WATER TREATMENT
    {
      type = "recipe",
      name = "yellow-waste-water-purification",
      category = "water-treatment",
      subgroup = "water-cleaning",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-yellow-waste", amount = 100}
      },
      results = {
        {type = "fluid", name = "water-mineralized", amount = 20},
        {type = "fluid", name = "water-purified", amount = 70},
        {type = "item", name = "sulfur", amount = 1}
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-mineralized",
          "water-purified",
          mods["angelspetrochem"] and {"__angelspetrochem__/graphics/icons/solid-sulfur.png", 32} or "sulfur"
        },
        "WsSS"
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-mineralised","water-yellow-waste","water-purified"}),
      order = "d[yellow-waste-water-purification]"
    },
    {
      type = "recipe",
      name = "red-waste-water-purification",
      category = "water-treatment",
      subgroup = "water-cleaning",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-red-waste", amount = 100}
      },
      results = {
        {type = "fluid", name = "water-mineralized", amount = 20},
        {type = "fluid", name = "water-purified", amount = 70}
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-mineralized",
          "water-purified",
          mods["angelspetrochem"] and {"__angelspetrochem__/graphics/icons/solid-sodium-nitrate.png", 32} or nil
        },
        "WsOO"
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-mineralised","water-red-waste","water-purified"}),
      order = "g[red-waste-water-purification]"
    },
    {
      type = "recipe",
      name = "green-waste-water-purification",
      category = "water-treatment",
      subgroup = "water-cleaning",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-green-waste", amount = 100}
      },
      results = {
        {type = "fluid", name = "water-saline", amount = 20},
        {type = "fluid", name = "water-purified", amount = 70}
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-saline",
          "water-purified",
          mods["angelspetrochem"] and "solid-salt" or nil
        },
        "WsClCl"
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","water-green-waste","water-purified"}),
      order = "f[green-waste-water-purification]"
    },
    {
      type = "recipe",
      name = "greenyellow-waste-water-purification",
      category = "water-treatment",
      subgroup = "water-cleaning",
      energy_required = 1,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-greenyellow-waste", amount = 100}
      },
      results = {
        {type = "fluid", name = "water-mineralized", amount = 20},
        {type = "fluid", name = "water-purified", amount = 70}
        --{type="item", name="fluorite-ore", amount=1},
      },
      always_show_products = true,
      icons = angelsmods.functions.create_liquid_recipe_icon(
        {
          "water-saline",
          "water-purified",
          mods["angelspetrochem"] and {"__angelspetrochem__/graphics/icons/ore-fluorite.png", 32} or nil
        },
        "WsFF"
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-mineralised","water-greenyellow-waste","water-purified"}),
      order = "e[greenyellow-waste-water-purification]"
    },
    --SALINATION
    {
      type = "recipe",
      name = "water-saline",
      category = "salination-plant",
      subgroup = "water-salination",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water", amount = 1000}
      },
      results = {
        {type = "fluid", name = "water-saline", amount = 400}
      },
      main_product = "water-saline",
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_recipe_icon(
        nil,
        {{039, 112, 194}, {168, 173, 173}, {070, 133, 232}, {185, 185, 185, 0.8}},
        {
          "water"
        }
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","water"}),
      order = "a[water-saline]-a[water]"
    },
    {
      type = "recipe",
      name = "solid-salt-dissolving",
      category = "salination-plant",
      subgroup = "water-salination",
      energy_required = 2,
      enabled = false,
      ingredients = {
        {type = "item", name = "solid-salt", amount = 10},
        {type = "fluid", name = "water-purified", amount = 1000}
      },
      results = {
        {type = "fluid", name = "water-saline", amount = 400}
      },
      main_product = "water-saline",
      always_show_products = true,
      icons = angelsmods.functions.create_viscous_liquid_recipe_icon(
        nil,
        {{039, 112, 194}, {168, 173, 173}, {070, 133, 232}, {185, 185, 185, 0.8}},
        {
          "solid-salt"
        }
      ),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","water-purified"}),
      order = "a[water-saline]-b[salt]"
    },
    {
      type = "recipe",
      name = "solid-salt-from-saline",
      category = "salination-plant",
      subgroup = "water-salination",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-saline", amount = 1000}
      },
      results = {
        {type = "item", name = "solid-salt", amount = 25}
      },
      main_product = "solid-salt",
      icons = angelsmods.functions.create_solid_recipe_icon(nil, "solid-salt", {"water-saline"}),
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("water-saline"),
      order = "b[solid-salt-from-saline]"
    },
    {
      type = "recipe",
      name = "solid-salt",
      category = "salination-plant",
      subgroup = "water-salination",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water", amount = 1000}
      },
      results = {
        {type = "item", name = "solid-salt", amount = 10}
      },
      main_product = "solid-salt",
      icons = angelsmods.functions.create_solid_recipe_icon(nil, "solid-salt", {"water"}),
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","water"}),
      order = "c[solid-salt]"
    },
    {
      type = "recipe",
      name = "solid-lithium",
      category = "salination-plant",
      subgroup = "water-salination",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "thermal-water", amount = 1000}
      },
      results = {
        {type = "item", name = "solid-lithium", amount = 20}
      },
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("thermal-water"),
      order = "d[solid-lithium]"
    },
    --WASHING
    {
      type = "recipe",
      name = "washing-1",
      category = "washing-plant",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-viscous-mud", amount = 200},
        {type = "fluid", name = "water", amount = 50}
      },
      results = {
        {type = "fluid", name = "water-heavy-mud", amount = 200},
        {type = "item", name = "solid-mud", amount_min = 0, amount_max = 3, probability = 0.5}
      },
      main_product = "water-heavy-mud",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-heavy-mud","water-viscous-mud","water"}),
      order = "b"
    },
    {
      type = "recipe",
      name = "washing-2",
      category = "washing-plant",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-heavy-mud", amount = 200},
        {type = "fluid", name = "water", amount = 50}
      },
      results = {
        {type = "fluid", name = "water-concentrated-mud", amount = 200},
        {type = "item", name = "solid-mud", amount_min = 0, amount_max = 3, probability = 0.5}
      },
      main_product = "water-concentrated-mud",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-concentrated-mud","water-heavy-mud","water"}),
      order = "c"
    },
    {
      type = "recipe",
      name = "washing-3",
      category = "washing-plant",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-concentrated-mud", amount = 200},
        {type = "fluid", name = "water", amount = 50}
      },
      results = {
        {type = "fluid", name = "water-light-mud", amount = 200},
        {type = "item", name = "solid-mud", amount_min = 0, amount_max = 3, probability = 0.5}
      },
      main_product = "water-light-mud",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-light-mud","water-concentrated-mud","water"}),
      order = "d"
    },
    {
      type = "recipe",
      name = "washing-4",
      category = "washing-plant",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-light-mud", amount = 200},
        {type = "fluid", name = "water", amount = 50}
      },
      results = {
        {type = "fluid", name = "water-thin-mud", amount = 200},
        {type = "item", name = "solid-mud", amount_min = 0, amount_max = 3, probability = 0.5}
      },
      main_product = "water-thin-mud",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-thin-mud","water-light-mud","water"}),
      order = "e"
    },
    {
      type = "recipe",
      name = "washing-5",
      category = "washing-plant",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-thin-mud", amount = 200},
        {type = "fluid", name = "water", amount = 50}
      },
      results = {
        {type = "fluid", name = "water-saline", amount = 200},
        {type = "item", name = "solid-mud", amount_min = 0, amount_max = 3, probability = 0.5}
      },
      main_product = "water-saline",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","water-thin-mud","water"}),
      order = "f"
    },
    {
      type = "recipe",
      name = "water-viscous-mud",
      category = "liquifying",
      subgroup = "water-washing",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "item", name = "solid-mud", amount = 10},
        {type = "fluid", name = "water", amount = 150}
      },
      results = {
        {type = "fluid", name = "water-viscous-mud", amount = 150}
      },
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-viscous-mud","water"}),
      order = "a"
    },
    {
      type = "recipe",
      name = "solid-mud-landfill",
      category = "crafting",
      subgroup = "water-washing-filtering",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "item", name = "solid-mud", amount = 25}
      },
      results = {
        {type = "item", name = "landfill", amount = 1}
      },
      icon_size = 32,
      order = "a"
    },
    --WASHING FILTERING
    {
      type = "recipe",
      name = "solid-geodes",
      category = "washing-plant",
      subgroup = "water-washing-filtering",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-heavy-mud", amount = 40},
        {type = "fluid", name = "water", amount = 25}
      },
      results = {
        {type = "item", name = "geode-blue", amount = 2, probability = 0.75},
        {type = "item", name = "geode-cyan", amount = 1, probability = 0.6},
        {type = "item", name = "geode-lightgreen", amount = 1, probability = 0.6},
        {type = "item", name = "geode-purple", amount = 1, probability = 0.75},
        {type = "item", name = "geode-red", amount = 2, probability = 0.75},
        {type = "item", name = "geode-yellow", amount = 1, probability = 1}
      },
      icon = "__angelsrefining__/graphics/icons/geode-blue.png",
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-heavy-mud",{r = 1, g = 0, b = 0},"water",{r = 0, g = 0, b = 1},{r = 0, g = 1, b = 0},{r = 0, g = 0.5, b = 0.5},{r = 0.5, g = 0, b = 0.5}}),--may need a better custom tint for "rainbow"
      order = "b"
    },
    {
      type = "recipe",
      name = "solid-clay",
      category = "washing-plant",
      subgroup = "water-washing-filtering",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-concentrated-mud", amount = 30},
        {type = "fluid", name = "water", amount = 25}
      },
      results = {
        {type = "item", name = "solid-clay", amount = 3}
      },
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({{r = 100/255, g = 065/255, b = 042/255},"water-concentrated-mud","water"}),
      order = "c"
    },
    {
      type = "recipe",
      name = "solid-limestone",
      category = "washing-plant",
      subgroup = "water-washing-filtering",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-light-mud", amount = 20},
        {type = "fluid", name = "water", amount = 25}
      },
      results = {
        {type = "item", name = "solid-limestone", amount = 3}
      },
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({{r = 185/255, g = 152/255, b = 126/255},"water-light-mud","water"}),
      order = "d"
    },
    {
      type = "recipe",
      name = "solid-sand",
      category = "washing-plant",
      subgroup = "water-washing-filtering",
      energy_required = 5,
      enabled = false,
      ingredients = {
        {type = "fluid", name = "water-thin-mud", amount = 10},
        {type = "fluid", name = "water", amount = 25}
      },
      results = {
        {type = "item", name = "solid-sand", amount = 5}
      },
      icon_size = 32,
      crafting_machine_tint = angelsmods.functions.get_recipe_tints({{r = 199/255, g = 192/255, b = 181/255},"water-thin-mud","water"}),
      order = "e"
    }
  }
)
