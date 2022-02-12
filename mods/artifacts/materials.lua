----MATERIALS----
--exotic building materials
----MOON GLASS
--glowing glass
minetest.register_node("artifacts:moon_glass", {
	description  = "Moon Glass",
	drawtype     = "glasslike",
	tiles        = {"artifacts_moon_glass.png"},
	stack_max    = minimal.stack_max_bulky *4,
	light_source = 5,
	paramtype    = "light",
	sounds       = nodes_nature.node_sound_glass_defaults(),
	groups       = {cracky = 1,},
	use_texture_alpha = "clip",
})
----SUN STONE----
-- bright glowing glass, with warming effect
minetest.register_node("artifacts:sun_stone", {
	description = "Sun Stone",
	tiles       = {"artifacts_sun_stone.png"},
	stack_max   = 1,
	drawtype    = "nodebox",
	node_box    = {
		type  = "fixed",
		fixed = {
			{-0.2500, -0.5000, -0.2500,  0.2500, -0.4375,  0.2500}, -- NodeBox1
			{-0.0625, -0.5000,  0.2500,  0.0625, -0.4375,  0.5000}, -- NodeBox2
			{-0.0625, -0.5000, -0.5000,  0.0625, -0.4375, -0.2500}, -- NodeBox3
			{ 0.2500, -0.5000, -0.0625,  0.5000, -0.4375,  0.0625}, -- NodeBox4
			{-0.5000, -0.5000, -0.0625, -0.2500, -0.4375,  0.0625}, -- NodeBox5
			{-0.1875, -0.4375, -0.1875,  0.1875, -0.3750,  0.1875}, -- NodeBox6
			{ 0.2500, -0.5000, -0.3125,  0.3125, -0.4375, -0.2500}, -- NodeBox8
			{ 0.2500, -0.5000,  0.2500,  0.3125, -0.4375,  0.3125}, -- NodeBox9
			{-0.3125, -0.5000,  0.2500, -0.2500, -0.4375,  0.3125}, -- NodeBox10
			{-0.3125, -0.5000, -0.3125, -0.2500, -0.4375, -0.2500}, -- NodeBox11
		}
	},
	light_source        = 13,
	paramtype           = "light",
	paramtype2          = "wallmounted",
	is_ground_content   = false,
	sunlight_propagates = true,
	use_texture_alpha   = "clip",
	temp_effect         =  4,
	temp_effect_max     = 40,
	sounds              = nodes_nature.node_sound_glass_defaults(),
	groups              = {cracky = 3, oddly_breakable_by_hand = 3, attached_node = 1, temp_effect = 1, temp_pass = 1},
})
----MOON STONE----
-- glowing glass, with cooling effect
minetest.register_node("artifacts:moon_stone", {
	description = "Moon Stone",
	tiles       = {"artifacts_moon_glass.png"},
	stack_max   = 1,
	drawtype    = "nodebox",
	node_box    = {
		type  = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625,  0.0625, -0.3750,  0.0625}, -- NodeBox1
			{ 0.0625, -0.5,  0.0625,  0.1250, -0.3750,  0.1250}, -- NodeBox2
			{ 0.0625, -0.5, -0.1250,  0.1250, -0.3750, -0.0625}, -- NodeBox3
			{-0.1250, -0.5, -0.1250, -0.0625, -0.3750, -0.0625}, -- NodeBox4
			{-0.1250, -0.5,  0.0625, -0.0625, -0.3750,  0.1250}, -- NodeBox5
			{ 0.1250, -0.5, -0.1250,  0.2500, -0.4375,  0.1250}, -- NodeBox6
			{-0.2500, -0.5, -0.1250, -0.1250, -0.4375,  0.1250}, -- NodeBox7
			{-0.1250, -0.5,  0.1250,  0.1250, -0.4375,  0.2500}, -- NodeBox8
			{-0.1250, -0.5, -0.2500,  0.1250, -0.4375, -0.1250}, -- NodeBox9
			{ 0.1250, -0.5, -0.3750,  0.2500, -0.4375, -0.2500}, -- NodeBox10
			{ 0.2500, -0.5, -0.2500,  0.3750, -0.4375, -0.1250}, -- NodeBox11
			{ 0.2500, -0.5,  0.1250,  0.3750, -0.4375,  0.2500}, -- NodeBox12
			{ 0.1250, -0.5,  0.2500,  0.2500, -0.4375,  0.3750}, -- NodeBox13
			{-0.2500, -0.5,  0.2500, -0.1250, -0.4375,  0.3750}, -- NodeBox14
			{-0.3750, -0.5,  0.1250, -0.2500, -0.4375,  0.2500}, -- NodeBox15
			{-0.3750, -0.5, -0.2500, -0.2500, -0.4375, -0.1250}, -- NodeBox16
			{-0.2500, -0.5, -0.3750, -0.1250, -0.4375, -0.2500}, -- NodeBox17
			{-0.1250, -0.5, -0.5000,  0.1250, -0.4375, -0.3750}, -- NodeBox18
			{-0.1250, -0.5,  0.3750,  0.1250, -0.4375,  0.5000}, -- NodeBox19
			{-0.5000, -0.5, -0.1250, -0.3750, -0.4375,  0.1250}, -- NodeBox20
			{ 0.3750, -0.5, -0.1250,  0.5000, -0.4375,  0.1250}, -- NodeBox21
		}
	},
	light_source        =  7,
	paramtype           = "light",
	paramtype2          = "wallmounted",
	is_ground_content   = false,
	sunlight_propagates = true,
	use_texture_alpha   = "blend",
	temp_effect         = -4,
	temp_effect_max     =  0,
	sounds              = nodes_nature.node_sound_glass_defaults(),
	groups              = {
		cracky = 3, 
		oddly_breakable_by_hand = 3, 
		attached_node = 1, 
		temp_effect = 1, 
		temp_pass = 1
	},
})
----STAR STONE----
--small glowing glass
minetest.register_node("artifacts:star_stone", {
	description = "Star Stone",
	tiles       = {"artifacts_moon_glass.png"},
	stack_max   = minimal.stack_max_medium * 2,
	drawtype    = "nodebox",
	node_box    = {
		type  = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625,  0.0625, -0.4375,  0.0625}, -- NodeBox1
			{ 0.0625, -0.5,  0.0625,  0.1250, -0.4375,  0.1250}, -- NodeBox2
			{ 0.0625, -0.5, -0.1250,  0.1250, -0.4375, -0.0625}, -- NodeBox3
			{-0.1250, -0.5, -0.1250, -0.0625, -0.4375, -0.0625}, -- NodeBox4
			{-0.1250, -0.5,  0.0625, -0.0625, -0.4375,  0.1250}, -- NodeBox5
		}
	},
	light_source        = 3,
	paramtype           = "light",
	paramtype2          = "wallmounted",
	use_texture_alpha   = "clip",
	sunlight_propagates = true,
	sounds              = nodes_nature.node_sound_glass_defaults(),
	groups              = {oddly_breakable_by_hand = 3, attached_node = 1, temp_pass = 1},
})
----ANTIQUORIUM----
--the super material of the ancients
minetest.register_node("artifacts:antiquorium", {
	description = "Antiquorium",
	tiles       = {"artifacts_antiquorium.png"},
	stack_max   = minimal.stack_max_bulky *4,
	sounds      = nodes_nature.node_sound_glass_defaults(),
	groups      = {cracky = 1,},
})
----ANTIQUORIUM LADDER----
minetest.register_node("artifacts:antiquorium_ladder", {
	description       = "Antiquorium Ladder",
	drawtype          = "signlike",
	stack_max         = minimal.stack_max_medium,
	tiles             = {"artifacts_antiquorium_ladder.png"},
	inventory_image   = "artifacts_antiquorium_ladder.png",
	wield_image       = "artifacts_antiquorium_ladder.png",
	paramtype         = "light",
	paramtype2        = "wallmounted",
	sunlight_propagates = true,
	walkable          = false,
	climbable         = true,
	is_ground_content = false,
	sounds            = nodes_nature.node_sound_glass_defaults(),
	groups            = {cracky = 2},
	selection_box     = {
		type = "wallmounted",
		--wall_top == <default>
		--wall_bottom == <default>
		--wall_side == <default>
	},
})
----ANTIQUORIUM DOOR----
doors.register("door_antiquorium", {
	description      = "Antiquorium Door",
	inventory_image  = "artifacts_antiquorium_door_item.png",
	groups           = {cracky = 2},
	sounds           = nodes_nature.node_sound_glass_defaults(),
	tiles            = {{
		name             = "artifacts_antiquorium_door.png", 
		backface_culling = true
	}},
})
doors.register_trapdoor("artifacts:trapdoor_antiquorium", {
	description     = "Antiquorium Trapdoor",
	inventory_image = "artifacts_antiquorium_chest_top.png",
	wield_image     = "artifacts_antiquorium_chest_top.png",
	tile_front      = "artifacts_antiquorium_chest_top.png",
	tile_side       = "artifacts_antiquorium_chest_top.png",
	groups          = {cracky = 2},
	sounds          = nodes_nature.node_sound_wood_defaults(),
})
----TRAMPOLINE----
minetest.register_node('artifacts:trampoline', {
	description = 'Trampoline',
	tiles       = {'artifacts_antiquorium_chest_top.png'},
	stack_max   = minimal.stack_max_bulky,
	drawtype    = "nodebox",
	paramtype   = "light",
	paramtype2  = "wallmounted",
	groups      = {fall_damage_add_percent = -70, bouncy = 85, oddly_breakable_by_hand = 3, temp_pass = 1},
	sounds      = nodes_nature.node_sound_defaults({footstep = {name = "artifacts_bouncy", gain = 0.8}}),
	node_box    = {
		type  = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, 0.5000, -0.3125, 0.5000}, -- NodeBox1
			{-0.5000,  0.3125, -0.5000, 0.5000,  0.5000, 0.5000}, -- NodeBox2
			{-0.1875, -0.3125, -0.1875, 0.1875, -0.1875, 0.1875}, -- NodeBox3
			{-0.1875,  0.1875, -0.1875, 0.1875,  0.3125, 0.1875}, -- NodeBox4
			{-0.1250,  0.0625, -0.1250, 0.1250,  0.1875, 0.1250}, -- NodeBox5
			{-0.1250, -0.1875, -0.1250, 0.1250, -0.0625, 0.1250}, -- NodeBox6
			{-0.1875, -0.0625, -0.1875, 0.1875,  0.0625, 0.1875}, -- NodeBox7
		}
	},
})
----TRAMPOLINE----
minetest.register_node('artifacts:conveyor', {
	description  = 'Conveyor',
	tiles        = {'artifacts_antiquorium_chest_top.png'},
	stack_max    = minimal.stack_max_medium *2,
	drawtype     = "nodebox",
	light_source = 2,
	paramtype    = "light",
	groups       = {slippery = 1000, oddly_breakable_by_hand = 3, temp_pass = 1},
	sounds       = nodes_nature.node_sound_defaults({footstep = {name="artifacts_transport_fail", gain = 0.5}}),
	node_box     = {
		type  = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}, -- NodeBox1
		}
	},
})
