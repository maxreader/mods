--------------------------------------------------------------------------------------------------
-- Key component functions --
--------------------------------------------------------------------------------------------------
local function new_fluid_burner_structure()
  return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
        priority = "high",
        width = 108,
        height = 110,
        frame_count = 32,
        line_length = 8,
        shift = util.by_pixel(0, 4),
        hr_version =
        {
          filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
          priority = "high",
          width = 214,
          height = 218,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
        priority = "high",
        width = 98,
        height = 82,
        frame_count = 32,
        line_length = 8,
        draw_as_shadow = true,
        shift = util.by_pixel(12, 5),
        hr_version =
        {
          filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
          priority = "high",
          width = 196,
          height = 163,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 4.75),
          scale = 0.5
        }
      }
    }
  }
end
local function new_fluid_generator_structure()
  return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
        priority = "high",
        width = 108,
        height = 110,
        frame_count = 32,
        line_length = 8,
        shift = util.by_pixel(0, 4),
        hr_version =
        {
          filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
          priority = "high",
          width = 214,
          height = 218,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
        priority = "high",
        width = 98,
        height = 82,
        frame_count = 32,
        line_length = 8,
        draw_as_shadow = true,
        shift = util.by_pixel(12, 5),
        hr_version =
        {
          filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
          priority = "high",
          width = 196,
          height = 163,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 4.75),
          scale = 0.5
        }
      }
    }
  }
end




local function new_fluid_generator_working_visualisations()
  return
  {
    {
      north_position = {0.0, 0.0},
      east_position = {0.0, 0.0},
      south_position = {0.0, 0.0},
      west_position = {0.0, 0.0},
      animation =
      {
        filename = "__bobpower__/graphics/fluid-generator/hr-fluid-generator-light.png",
        priority = "extra-high",
        frame_count = 1,
        width = 200,
        height = 257,
        shift = util.by_pixel(-1.25, 5.25 -6),
        blend_mode = "additive",
        scale = 0.5
      }
    },
    {
      north_position = {0.0, 0.0},
      east_position = {0.0, 0.0},
      south_position = {0.0, 0.0},
      west_position = {0.0, 0.0},
      animation =
      {
        filename = "__bobpower__/graphics/fluid-generator/hr-boiler-N-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 26,
        height = 26,
        animation_speed = 0.5,
        shift = util.by_pixel(0, -8.5 -16 -1),
        scale = 0.5
      },
    },
    {
      north_position = {0.0, 0.0},
      east_position = {0.0, 0.0},
      south_position = {0.0, 0.0},
      west_position = {0.0, 0.0},
      animation =
      {
        filename = "__bobpower__/graphics/fluid-generator/hr-boiler-S-fire.png",
        priority = "extra-high",
        frame_count = 64,
        line_length = 8,
        width = 26,
        height = 16,
        animation_speed = 0.5,
        shift = util.by_pixel(-1, -26.5 +16 -1),
        scale = 0.5
      },
    },
    {
      effect = "flicker",
      light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.9, b = 0.7}}
    }
  }
end
--------------------------------------------------------------------------------------------------
-- Tier 1 Direct Fuelled Boilers --
-- 2 fluid in, steam out
--------------------------------------------------------------------------------------------------
data:extend({
  util.merge{data.raw.boiler.boiler,
    {
      name = "fluid-burning-boiler",
      minable = {hardness = 0.2, mining_time = 0.5, result = "fluid-burning-boiler"},
      max_health = 300,
      target_temperature = 165,
      energy_consumption = "5.4MW",
    }
  },
})
data:extend({
  util.merge{data.raw.item.boiler,
    {
      name = "fluid-burning-boiler",
      place_result = "fluid-burning-boiler",
      stack_size = 10,
    }
  },
})
  
  
data.raw.boiler["fluid-burning-boiler"].energy_source =
{
  type = "fluid",
  emissions_per_minute = 22.5,
  fluid_box =
  {
    base_area = 10,
    height = 2,
    base_level = -1,
    pipe_connections =
    {
      {type = "input", position = {0, 1.5}}
    },
    pipe_covers = pipecoverspictures(),
    pipe_picture = assembler2pipepictures(),
    production_type = "input",
  },
  burns_fluid = true,
  scale_fluid_usage = true,
  destroy_non_fuel_fluid = false,
  smoke =
  {
    {
      name = "smoke",
      north_position = util.by_pixel(-38, -47.5),
      south_position = util.by_pixel(38.5, -32),
      east_position = util.by_pixel(20, -70),
      west_position = util.by_pixel(-19, -8.5),
      frequency = 15,
      starting_vertical_speed = 0.0,
      starting_frame_deviation = 60
    }
  }
}



--------------------------------------------------------------------------------------------------
-- Tier 2 Indirect Fuelled Turbine -- Tier 3 has 2 fluids out
-- 1 fluid in, rotational force out
-- -- Tier 3 has 2 fluids out, exhaust at various temps feed the Tier 1 boiler system
--------------------------------------------------------------------------------------------------
data:extend({
  util.merge{data.raw["furnace"]["electric-furnace"],
    {
      name = "fluid-burning-turbine",
      minable = {hardness = 0.2, mining_time = 0.5, result = "fluid-burning-turbine"},
      icon = "__base__/graphics/icons/electric-furnace.png",
      max_health = 300,
            crafting_speed = 1,
            icons = {
                {
                    icon = "__angelsrefining__/graphics/icons/void.png",
                    icon_size = 32 }
            },
            crafting_categories = {"angels-gas-turbine-burning"}
    }
  },
})
data:extend({
  util.merge{data.raw.item["electric-furnace"],
    {
      name = "fluid-burning-turbine",
      icon = "__base__/graphics/icons/electric-furnace.png",
      place_result = "fluid-burning-turbine",
      stack_size = 10
    }
  },
})
  
local turbo = data.raw["furnace"]["fluid-burning-turbine"]
turbo.energy_source =
{
  type = "void",
  --[[emissions_per_minute = 22.5,
  fluid_box =
  {
    base_area = 1,
    height = 2,
    base_level = -1,
    pipe_connections =
    {
      {type = "input", position = {0, 2}}
    },
    pipe_covers = pipecoverspictures(),
    pipe_picture = assembler2pipepictures(),
    production_type = "input",
  },
  burns_fluid = true,
  scale_fluid_usage = true,
  smoke =
  {
    {
      name = "smoke",
      north_position = util.by_pixel(-38, -47.5),
      south_position = util.by_pixel(38.5, -32),
      east_position = util.by_pixel(20, -70),
      west_position = util.by_pixel(-19, -8.5),
      frequency = 15,
      starting_vertical_speed = 0.0,
      starting_frame_deviation = 60
    }
  }]]
}
turbo.collision_box = {{-1.35, -1.35}, {1.35, 1.35}}
turbo.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
turbo.fluid_boxes = --for non-mechanical fluid
{{
  base_area = 10,
  height = 2,
  base_level = -1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    { type = "input", position = {2, 0} },
  },
  production_type = "input",
},{
  base_area = 20,
  height = 1,
  base_level = -2,
  pipe_covers = pipecoverspictures(),
  filter = "mechanical-rotary-power",
  pipe_connections =
  {
    { type = "output", position = {-2, 0} },
  },
  production_type = "output",
}}
turbo.next_upgrade = nil
turbo.fast_replaceable_group = nil
turbo.structure =
  { north = new_fluid_burner_structure(),
    east = new_fluid_burner_structure(),
    south = new_fluid_burner_structure(),
    west = new_fluid_burner_structure()
  }
log(serpent.block(turbo))
data:extend(
{
  { -- generator
    type = "generator",
    name = "mechanical-rotary-generator",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "mechanical-rotary-generator"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 1000/60, -- 10 MW / 60 ticks
    maximum_temperature = 125,
    burns_fluid = false,
    scale_fluid_usage = true,
    max_power_output = "10MW",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fluid_box =
    {
      base_area = 10,
      height = 1,
      base_level = -2,
      filter = "mechanical-rotary-power",
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { type = "input-output", position = {0, 2} },
        { type = "input-output", position = {0, -2} },
        --{ type = "input-output", position = {2, 0} },
        --{ type = "input-output", position = {-2, 0} },
      },
      production_type = "input-output",
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      emissions_per_minute = 20,
    },
    horizontal_animation = new_fluid_generator_structure(),
    vertical_animation = new_fluid_generator_structure(),
    working_visualisations = new_fluid_generator_working_visualisations(),
    smoke =
    {
      {
        name = "smoke",
        position = util.by_pixel(38.5, -16),
        north_position = util.by_pixel(38.5, -16),
        east_position = util.by_pixel(38.5, -16),
        frequency = 1/6,--0.205,
        starting_vertical_speed = 0.0,
        starting_frame_deviation = 60
      },
      {
        name = "smoke",
        position = util.by_pixel(-38, -63.5),
        north_position = util.by_pixel(-38, -63.5),
        east_position = util.by_pixel(-38, -63.5),
        frequency = 1/4,--0.195,
        starting_vertical_speed = 0.0,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
})
data:extend({
  util.merge{data.raw.item["assembling-machine-2"],
    {
      name = "mechanical-rotary-generator",
      icon = "__base__/graphics/icons/assembling-machine-2.png",
      icon_size = 64,
      icon_mipmaps = 4,
      place_result = "mechanical-rotary-generator",
      stack_size = 10,
    }
  },
})

--------------------------------------------------------------------------------------------------
-- Tier 3 Combined Cycle Power Generation --
-- Combined Cycle Gas Turbine - Burnable fluid in, rotary power and exhaust out
-- Combined Cycle Exhaust Heat Exchanger - exhaust + water in, steam out
--------------------------------------------------------------------------------------------------
data:extend({
    util.merge { data.raw["furnace"]["electric-furnace"],
        {
            name = "combined-cycle-gas-turbine",
            minable = { hardness = 0.2, mining_time = 0.5, result = "combined-cycle-gas-turbine" },
            icon = "__base__/graphics/icons/electric-furnace.png",
            max_health = 300,
            crafting_speed = 1,
            crafting_categories = { "angels-ccgt-burning" }
        }
    },
})
data:extend({
    util.merge { data.raw.item["electric-furnace"],
        {
            name = "combined-cycle-gas-turbine",
            icon = "__base__/graphics/icons/electric-furnace.png",
            place_result = "combined-cycle-gas-turbine",
            stack_size = 10
        }
    },
})

local turbo2 = data.raw["furnace"]["combined-cycle-gas-turbine"]
turbo2.energy_source = {
    type = "void"
}
turbo2.collision_box = { { -1.35, -1.35 }, { 1.35, 1.35 } }
turbo2.selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } }
turbo2.fluid_boxes = --for non-mechanical fluid
{ {
    base_area = 10,
    height = 2,
    base_level = -1,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
        { type = "input", position = { 2, 0 } },
    },
    production_type = "input",
}, {
    base_area = 40,
    height = 1,
    base_level = -2,
    pipe_covers = pipecoverspictures(),
    filter = "mechanical-rotary-power", --change to mechanical fluid
    pipe_connections = {
        { type = "output", position = { -2, 0 } },
    },
    production_type = "output",
}, {
    base_area = 40,
    height = 1,
    base_level = 1,
    pipe_covers = pipecoverspictures(),
    filter = "gas-exhaust", 
    pipe_connections = {
        { type = "output", position = { 0, 2 } },
    },
    production_type = "output",
} }
turbo2.next_upgrade = nil
turbo2.fast_replaceable_group = nil
turbo2.structure = { north = new_fluid_burner_structure(),
    east = new_fluid_burner_structure(),
    south = new_fluid_burner_structure(),
    west = new_fluid_burner_structure()
}


data:extend({
    util.merge { data.raw.boiler.boiler,
        {
            name = "combined-cycle-heat-exchanger",
            minable = { hardness = 0.2, mining_time = 0.5, result = "combined-cycle-heat-exchanger" },
            max_health = 300,
            target_temperature = 165,
            energy_consumption = "10.8MW",
        }
    },
})
data:extend({
    util.merge { data.raw.item.boiler,
        {
            name = "combined-cycle-heat-exchanger",
            place_result = "combined-cycle-heat-exchanger",
            stack_size = 10,
        }
    },
})
data.raw.boiler["combined-cycle-heat-exchanger"].energy_source = {
    type = "fluid",
    emissions_per_minute = 22.5,
    fluid_box = {
        base_area = 10,
        height = 2,
        base_level = -1,
        pipe_connections = {
            { type = "input", position = { 0, 1.5 } }
        },
        pipe_covers = pipecoverspictures(),
        pipe_picture = assembler2pipepictures(),
        production_type = "input",
        filter = "gas-exhaust"
    },
    burns_fluid = false,
    scale_fluid_usage = true,
    destroy_non_fuel_fluid = false,
    smoke = {
        {
            name = "smoke",
            north_position = util.by_pixel(-38, -47.5),
            south_position = util.by_pixel(38.5, -32),
            east_position = util.by_pixel(20, -70),
            west_position = util.by_pixel(-19, -8.5),
            frequency = 15,
            starting_vertical_speed = 0.0,
            starting_frame_deviation = 60
        }
    }
}
