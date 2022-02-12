----BED REST FUNCTIONS----
local pi    = math.pi
local store = minetest.get_mod_storage()
function load_bedrest()
	local loaded = minetest.deserialize(store:get_string("bedrest"), true)
	return loaded
end
----Break taker----
local quote_list = {
	"'Sometimes even to live is an act of courage.'\n- Seneca",
	"'Humor keeps us alive. Humor and food. Don't forget food. You can go a week without laughing.'\n- Joss Whedon",
	"'Extinction is the rule. Survival is the exception.'\n- Carl Sagan",
	"'You don't drown by falling in the water; you drown by staying there.'\n- Edwin Louis Cole",
	"'It has yet to be proven that intelligence has any survival value.'\n- Arthur C. Clarke",
	"'If quick, I survive. If not quick, I am lost.'\n- Sun Tzu",
	"'That fine line between bravery and stupidity is endlessly debated – the difference really doesn’t matter.'\n- Bear Grylls",
	"'My approach is to look for what I’m interested in using and if it’s there I use it.'\n- John Plant",
	"'The only way of discovering the limits of the possible is to venture a little way past them into the impossible.'\n- Arthur C. Clarke",
	"'The point is not how we use a tool, but how it uses us.'\n- Nick Joaquín",
	"'The ultimate goal of farming is not the growing of crops, but the cultivation and perfection of human beings.'\n- Masanobu Fukuoka",
	"'Never confuse movement with action.'\n- Ernest Hemmingway",
	"'A step backward, after making a wrong turn, is a step in the right direction.'\n-Kurt Vonnegut",
	"'If you're going through hell, keep going'\n-Winston Churchill",
	"'It is not by muscle, speed, or physical dexterity that great things are achieved, \nbut by reflection, force of character, and judgment.'\n- Cicero",
	"'Progress is not an illusion; it happens, but it is slow and invariably disappointing.'\n- George Orwell",
	"'Whatever is produced in haste goes hastily to waste.'\n- Saadi",
	"'Perhaps nothing is so fraught with significance as the human hand, \nthis oldest tool with which man has dug his way from savagery, and with which he is constantly groping forward.'\n- Jane Addams",
	"'Any technology distinguishable from magic is insufficiently advanced.'\n- Barry Gehm",
	"'Tis but a scratch!'\n- The Black Knight.",
	"'Emergencies have always been necessary to progress.'\n- Victor Hugo",
	"'I only fear danger where I want to fear it.'\n- Franz Kafka",
	"'Fill your bowl to the brim and it will spill. Keep sharpening your knife and it will blunt.'\n- Lao Tzu",
	"'Artist's need the world.'\n- Kazuaki Tanahashi",
	"'Lets build a happy little cloud. Lets build some happy little trees.'\n- Bob Ross",
	"'The mountains are calling and I must go.'\n- John Muir",
	"'I like this place and could willingly waste my time in it.'\n- William Shakespeare",
	"'Adopt the pace of nature: her secret is patience.'\n- Ralph Waldo Emerson",
	"'Nature is pleased with simplicity. And nature is no dummy.'\n- Isaac Newton",
	"'There are rules to luck, not everything is chance for the wise; luck can be helped by skill.'\n- Balthasar Gracian",
	"'Life can only be understood backwards; but it must be lived forwards.'\n- Soren Kierkegaard",
	"'All truly great thoughts are conceived while walking.'\n- Friedrich Nietzsche",
	"'Learning without thought is labour lost; thought without learning is perilous'\n- Confucius",
	"'There is scarcely any passion without struggle.'\n- Albert Camus",
	"'O snail\nClimb Mount Fuji\nBut slowly, slowly!'\n-  Kobayashi Issa",
	"'Not all those who wander are lost.'\n- Tolkien",
	"'I've never been lost, but I was mighty turned around for three days once.'\n- Daniel Boone",
	"'Dripping water hollows out stone, not through force but through persistence.'\n- Ovid",
	"'I have not failed. I've just found 10, 000 ways that won't work.'\n- Thomas Edison",
	"'I'm not afraid of death; I just don't want to be there when it happens.'\n- Woody Allen",
	"'Reality continues to ruin my life.'\n- Bill Watterson",
	"'Give a man a fire and he's warm for a day, but set fire to him and he's warm for the rest of his life.'\n- Terry Pratchett",
	"'There's a fine line between genius and insanity. I have erased this line.'\n- Oscar Levant",
	"'Let's think the unthinkable, let's do the undoable.\nLet us prepare to grapple with the ineffable itself, and see if we may not eff it after all.'\n- Douglas Adams",
	"'When we are tired, we are attacked by ideas we conquered long ago.'\n- Friedrich Nietzsche",
	"'One cannot think well, love well, sleep well, if one has not dined well.'\n- Virginia Woolf",
	"'Do not go gentle into that good night.\nRage, rage against the dying of the light.'\n- Dylan Thomas",
	"'If you think you are too small to make a difference, try sleeping with a mosquito.'\n- The Dalai Lama",
	"'Each night, when I go to sleep, I die. And the next morning, when I wake up, I am reborn.'\n- Mahatma Gandhi",
	"'Be careful about reading health books. Some fine day you'll die of a misprint.'\n- Markus Herz",
	"'Let food be thy medicine and medicine be thy food.'\n- Hippocrates",
	"'Somewhere, something incredible is waiting to be known.'\n- Carl Sagan",
	"'If you wish to make an apple pie from scratch, you must first invent the universe.'\n- Carl Sagan",
	"'Time you enjoy wasting is not wasted time.'\n- Marthe Troly-Curtin",
	"'They say I'm old-fashioned, and live in the past, but sometimes I think progress progresses too fast!'\n- Dr. Seuss",
	"'He who has a strong enough why can bear any how.'\n- Friedrich Nietzsche",
	"'The greatest threat to our planet is the belief that someone else will save it.'\n- Robert Swan",
	"'Life is a struggle and wandering in a foreign country.'\n- Marcus Aurelius",
	"'It will be a sinister day when computers start to laugh, \nbecause that will mean they are capable of a lot of other things as well'\n- Edward de Bono",
	"'Po converts what might otherwise be taken as madness into a perfectly reasonable illogical procedure.'\n- Edward de Bono"
}
local function get_formspec()
	local title    = "BREAK TIME!"
	local message1 = "You've been here long enough to justify a real break.\nThink of this as a reminder from your better self.\nGo get some rest. Leave Exile behind. You can come back any time."
	local quote    = quote_list[math.random(1, #quote_list)]
	local formspec = {
		"size[19.5, 13]"..
		"real_coordinates[true]",
		"label[9.375, 1.5;", minetest.formspec_escape(title), "]",
		"label[2.375, 3.5;", minetest.formspec_escape(message1), "]",
		"label[2.375, 7.5;", minetest.formspec_escape(quote), "]"
	}
	return table.concat(formspec, "")
end
--check session length and encourage player to take a real break
local function break_taker(name)
	local ts     = bed_rest.session_start[name]
	local sess_l = bed_rest.session_limit[name]
	local tn     = os.time()
	if minetest.settings:get("exile_nobreaktaker") then
		return
	end
	if os.difftime(tn, ts) > sess_l then
		--show form
		minetest.show_formspec(name, "bed_rest:break_taker", get_formspec())
		minetest.sound_play("bed_rest_breakbell", {to_player = name, gain = 0.8})
		--reset clock, with a diminishing limit
		--if ignored too long it will eventually become a constant nag
		--e.g. 30 + 15 + 7.5 + 3.25 + 1.125 = ~ 1hr max
		bed_rest.session_start[name] = tn
		bed_rest.session_limit[name] = sess_l/2
	end
end
--grab_blanket(inv = clothing_inv, list = "clothing") for removal
-----------------------------------------------------------------
local function wear_blanket(player, donning)
	local name     = player:get_player_name()
	local plyrinv  = player:get_inventory()
	local frominvl = "cloths"  local toinvl = "main"
	if donning then
		frominvl = "main"
		toinvl   = "cloths"
	end
	local cinv     = plyrinv:get_list(frominvl)
	local newstack = ItemStack("")
	for i = 1, #cinv do
		local stack = ItemStack(cinv[i])
		if stack:get_count() > 0 then
			local def = stack:get_definition()
			if def.groups.blanket and def.groups.blanket > 0 then
				newstack = ItemStack(def.name)
				plyrinv:remove_item(frominvl, newstack)
				break
			end
		end
	end
	if plyrinv:room_for_item(toinvl, newstack) then
		local tinv = plyrinv:get_list(toinvl)
		local pointer = 0 -- find the last empty slot, put it there, not first
		for i = 1, #tinv do
			if ItemStack(tinv[i]):item_fits(newstack) then
				pointer = i
			end
		end
		newstack:add_item(ItemStack(tinv[pointer]))
		plyrinv:set_stack(toinvl, pointer, newstack)
	elseif donning then -- can't put it on, return it to main inv
		plyrinv:add_item(frominvl, newstack)
	else -- or drop it at our feet if there's no room when taking it off
		local ppos = player:get_pos()
		minetest.item_drop(newstack, player, ppos)
		minetest.chat_send_player(name, "You have no room to hold your blanket, so you drop it.")
		minetest.sound_play("nodes_nature_dig_snappy",
			{pos = ppos, gain = .8, max_hear_distance = 2})
	end
	clothing:update_temp(player)
	player_api.set_texture(player)
end
-----------------------------------------------------------------
local function get_look_yaw(pos)
	local rotation = minetest.get_node(pos).param2
	if rotation > 3 then
		rotation = rotation % 4 -- Mask colorfacedir values
	end
	if rotation == 1 then
		return pi / 2, rotation
	elseif rotation == 3 then
		return -pi / 2, rotation
	elseif rotation == 0 then
		return pi, rotation
	else
		return 0, rotation
	end
end
-----------------------------------------------------------------
local function lay_down(player, level, pos, bed_pos, state, skip)
	local name      = player:get_player_name()
	local hud_flags = player:hud_get_flags()
	local po        = player:get_physics_override()
	if not player or not name then
		return
	end
	-- stand up
	if state ~= nil and not state then
		local p = bed_rest.pos[name] or nil
		local bedp = bed_rest.bed_position[name] or nil
		if bedp ~= nil then
			minetest.get_meta(bedp):set_string("infotext", "")
		end
		bed_rest.player[name] = nil
		bed_rest.bed_position[name] = nil
		bed_rest.level[name] = nil
		-- skip here to prevent sending player specific changes (used for leaving players)
		if skip then
			return
		end
		if p then
			player:set_pos(p)
		end
		--remove blanket
		wear_blanket(player, false)
		-- physics, eye_offset, etc
		player:set_eye_offset({x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0})
		player:set_look_horizontal(math.random(1, 180) / 100)
		player_api.player_attached[name] = false
		po.speed   = 1
		po.jump    = 1
		po.sneak   = true
		po.gravity = 1
		player:set_physics_override(po)
		hud_flags.wielditem = true
		player_api.set_animation(player, "stand")
	-- lay down
	else
		local velo = player:get_velocity()
		if velo.x ~= 0 then return end
		if velo.z ~= 0 then return end
		-- Check if bed is occupied
		for nm, other_pos in pairs(bed_rest.bed_position) do
			if vector.distance(bed_pos, other_pos) < 0.1 then
				minetest.chat_send_player(name, ("This bed is already occupied!"))
				local meta = minetest.get_meta(bed_pos)
				if meta:get_string("infotext") == "" then
					meta:set_string("infotext",
						nm.."'s bed")
				end
				return false
			end
		end
		bed_rest.pos[name] = pos
		bed_rest.bed_position[name] = bed_pos
		bed_rest.player[name] = 1
		bed_rest.level[name]  = level
		if not minetest.is_singleplayer() then
			minetest.get_meta(bed_pos):set_string("infotext",
				name.."'s bed")
		end
		--check with break taker
		break_taker(name)
		--wear a blanket from inventory
		wear_blanket(player, true)
		-- physics, eye_offset, etc
		player:set_eye_offset({x = 0, y = -12, z = 0}, {x = 0, y = 0, z = 0})
		local yaw, param2 = get_look_yaw(bed_pos)
		player:set_look_horizontal(yaw)
		local dir = minetest.facedir_to_dir(param2)
		local p   = {x = bed_pos.x + dir.x / 2, y = bed_pos.y, z = bed_pos.z + dir.z / 2}
		--clear physics
		player_monoids.speed:del_change(player, "health:physics")
		player_monoids.jump:del_change(player, "health:physics")
		player_monoids.speed:del_change(player, "health:physics_HE")
		player_monoids.jump:del_change(player, "health:physics_HE")
		po.speed = 0
		po.jump = 0
		po.sneak = false
		po.gravity = 0
		player:set_physics_override(po)
		player:set_pos(p)
		player_api.player_attached[name] = true
		hud_flags.wielditem = false
		player_api.set_animation(player, "lay")
	end
	store:set_string("bedrest", minetest.serialize(bed_rest))
	player:hud_set_flags(hud_flags)
end
--------------------------------------------
function bed_rest.on_rightclick(pos, player, level)
	local name = player:get_player_name()
	local ppos = player:get_pos()
	local tod = minetest.get_timeofday()
	if bed_rest.player[name] then
		lay_down(player, nil, nil, nil, false)
	else
		-- move to bed
		lay_down(player, level, ppos, pos)
	end
end
--------------------------------------------
function bed_rest.can_dig(bed_pos, player)
	if minetest.check_player_privs(player, "protection_bypass") then
		return true
	end
	-- Check all players in bed which one is at the expected position
	for _, player_bed_pos in pairs(bed_rest.bed_position) do
		if vector.equals(bed_pos, player_bed_pos) then
			return false
		end
	end
	return true
end
jtimer = 0
--------------------------------------------
--Jump out of bed
minetest.register_globalstep(function(dtime)
	jtimer = jtimer + dtime
	if jtimer > 0.2 then
		for _, player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if bed_rest.player[name] then
				if math.floor(player:get_player_control_bits() / 16) % 2 == 1 then
					lay_down(player, nil, nil, nil, false)
				end
			end
		end
		jtimer = 0
	end
end)
--------------------------------------------
--clear attachment etc
--[[
minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	lay_down(player, nil, nil, nil, false)
	bed_rest.player[name] = nil
end)
]]
minetest.register_on_dieplayer(function(player)
	local name = player:get_player_name()
	local hud_flags = player:hud_get_flags()
	bed_rest.player[name] = nil
	bed_rest.bed_position[name] = nil
	bed_rest.level[name] = nil
	-- physics, eye_offset, etc
	player:set_eye_offset({x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0})
	player:set_look_horizontal(math.random(1, 180) / 100)
	player_api.player_attached[name] = false
	player:set_physics_override(1, 1, 1)
	hud_flags.wielditem = true
	player_api.set_animation(player, "stand")
end)
--get start time of session
minetest.register_on_joinplayer(function(player)
		local name = player:get_player_name()
		if bed_rest.player[name] then
			lay_down(player, nil, nil, nil, false)
		end
	bed_rest.session_start[name] = os.time()
	-- 30 minutes is 1800 ticks, so multiply by 60
	bed_rest.session_limit[name] = minetest.settings:get("exile_breaktime") * 60
end
)
