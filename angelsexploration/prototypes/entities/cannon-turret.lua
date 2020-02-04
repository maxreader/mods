require("util")

data:extend(
  {
    {
      type = "item",
      name = "angels-cannon-turret",
      icon = "__angelsexploration__/graphics/icons/cannon-turret.png",
      icon_size = 32,
      flags = {},
      subgroup = "defensive-structure",
      order = "b[turret]-a[gun-turret]",
      place_result = "angels-cannon-turret",
      stack_size = 50
    },
    {
      type = "ammo-turret",
      name = "angels-cannon-turret",
      icon = "__angelsexploration__/graphics/icons/cannon-turret.png",
      icon_size = 32,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "angels-cannon-turret"},
      max_health = 800,
      corpse = "medium-remnants",
      collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
      selection_box = {{-1, -1}, {1, 1}},
      rotation_speed = 0.015,
      preparing_speed = 0.08,
      folding_speed = 0.08,
      dying_explosion = "medium-explosion",
      inventory_size = 1,
      automated_ammo_count = 10,
      attacking_speed = 0.5,
      folded_animation = {
        layers = {
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension.png",
            priority = "medium",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-mask.png",
            flags = {"mask"},
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            apply_runtime_tint = true
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-shadow.png",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            draw_as_shadow = true
          }
        }
      },
      preparing_animation = {
        layers = {
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension.png",
            priority = "medium",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-mask.png",
            flags = {"mask"},
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            apply_runtime_tint = true
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-shadow.png",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "forward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            draw_as_shadow = true
          }
        }
      },
      prepared_animation = {
        layers = {
          {
            width = 160,
            height = 160,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            stripes = {
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-1.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-2.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-3.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-4.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-6.png",
                width_in_frames = 1,
                height_in_frames = 4
              }
            }
          },
          {
            width = 160,
            height = 160,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            apply_runtime_tint = true,
            stripes = {
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-6.png",
                width_in_frames = 1,
                height_in_frames = 4
              }
            }
          },
          {
            width = 160,
            height = 160,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            draw_as_shadow = true,
            stripes = {
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-1.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-2.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-3.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-4.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-6.png",
                width_in_frames = 1,
                height_in_frames = 4
              }
            }
          }
        }
      },
      attacking_animation = {
        layers = {
          {
            width = 160,
            height = 160,
            frame_count = 2,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            stripes = {
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-1.png",
                width_in_frames = 2,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-2.png",
                width_in_frames = 2,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-3.png",
                width_in_frames = 2,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-4.png",
                width_in_frames = 2,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-5.png",
                width_in_frames = 2,
                height_in_frames = 12
              },
              {
                filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-6.png",
                width_in_frames = 2,
                height_in_frames = 4
              }
            }
          },
          {
            width = 160,
            height = 160,
            frame_count = 2,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            apply_runtime_tint = true,
            stripes = util.multiplystripes(
              2,
              {
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-1.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-2.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-3.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-4.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-5.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-mask-6.png",
                  width_in_frames = 1,
                  height_in_frames = 4
                }
              }
            )
          },
          {
            width = 160,
            height = 160,
            frame_count = 2,
            axially_symmetrical = false,
            direction_count = 64,
            shift = {0, -11 / 32},
            draw_as_shadow = true,
            stripes = util.multiplystripes(
              2,
              {
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-1.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-2.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-3.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-4.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-5.png",
                  width_in_frames = 1,
                  height_in_frames = 12
                },
                {
                  filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-shadow-6.png",
                  width_in_frames = 1,
                  height_in_frames = 4
                }
              }
            )
          }
        }
      },
      folding_animation = {
        layers = {
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension.png",
            priority = "medium",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "backward",
            shift = {0, -11 / 32},
            axially_symmetrical = false
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-mask.png",
            flags = {"mask"},
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "backward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            apply_runtime_tint = true
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/cannon-turret-extension-shadow.png",
            width = 160,
            height = 160,
            direction_count = 4,
            frame_count = 1,
            line_length = 1,
            run_mode = "backward",
            shift = {0, -11 / 32},
            axially_symmetrical = false,
            draw_as_shadow = true
          }
        }
      },
      base_picture = {
        layers = {
          {
            filename = "__angelsexploration__/graphics/entity/turrets/turret-base.png",
            priority = "high",
            width = 160,
            height = 160,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = {0, 0}
          },
          {
            filename = "__angelsexploration__/graphics/entity/turrets/turret-base-mask.png",
            flags = {"mask"},
            line_length = 1,
            width = 160,
            height = 160,
            axially_symmetrical = false,
            direction_count = 1,
            frame_count = 1,
            shift = {0, 0},
            apply_runtime_tint = true
          }
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      attack_parameters = {
        type = "projectile",
        ammo_category = "cannon-turret",
        cooldown = 75,
        projectile_creation_distance = 1.75,
        projectile_center = {0, 0},
        damage_modifier = 1,
        --turn_range = 1.0/3.0,
        shell_particle = {
          name = "shell-particle",
          direction_deviation = 0.1,
          speed = 0.1,
          speed_deviation = 0.03,
          center = {0, 0},
          creation_distance = -1.925,
          starting_frame_speed = 0.2,
          starting_frame_speed_deviation = 0.1
        },
        range = 30,
        min_range = 10,
        sound = {
          {
            filename = "__base__/sound/fight/tank-cannon.ogg",
            volume = 1.0
          }
        }
      },
      call_for_help_radius = 40
    }
  }
)
