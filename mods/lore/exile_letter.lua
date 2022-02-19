----------------------------------------------------------
--EXILE LETTER
--[[
	sentence of exile.
	Unique, randomly generated, for each "life".
	i.e. Respawn means starting as someone new

	Sets the scene for the game.
	Explains why you are there, and where "there" is.
]]
local random = math.random
----------------------------------------------------------
local judger = {
	-- Monarchies
		"King",
		"Queen",
		"Emperor",
		"Empress",
		"Exalted Ruler",
		"Majestic Leader",
		"High King",
		"High Queen",
		"Nobles",
		"Lords",
		"Duke",
		"Duchess",
		"Lord",
		"Most Highly-Exalted Supreme Ruler",
		"Great Leader",
		"Golden King",
		"Jade Queen",
		"Prince",
		"Princess",
		"Regent",
		"Dictator",
	-- Officials
		"High Judge",
		"Tribunal",
		"Council",
		"Courts",
		"Presidium",
		"Law Giver's",
		"King's Justice",
		"Sheriff",
	-- Cultists
		"Brotherhood",
		"Sisterhood",
		"High Priest",
		"High Priestess",
		"Great Prophet",
		"Anointed One",
		"God-King",
		"Philosopher King",
		"Seers",
		"Sanctum",
		"Order",
		"Monks",
		"Priests",
		"Priestesses",
		"Enlightened Ones",
		"Great Sage",
		"Shaman",
	-- Tribals
		"Elders",
		"Wise Ones",
		"Clan Council",
		"Tribal Chiefs",
		"Great Chieftain",
		"United Clans",
		"Wise Man",
		"Wise Woman",
	-- Republicans
		"Citizenry",
		"People",
		"Senate",
		"Consul",
		"Senators",
		"Assembly",
		"Chief Minister",
	-- Geographic Polities
		"City State",
		"Empire",
		"Kingdom",
		"Principality",
		"Duchy",
		"Republic",
		"League",
		"Confederation",
		"Federation",
		"Alliance",
		"Coalition",
		"Nation",
		"Clan",
		"Chiefdom",
		"Tribe",
		"Monastic Order",
		"Merchant Republic",
		"Theocracy",
	-- Military
		"Generals",
		"Champion",
		"Mighty Warriors",
		"Admirals",
		"Legion",
		"Commander",
		"Commandant",
		"Warlord",
	-- Rogues
		"Pirates",
		"Bandits",
		"Company",
		"Horde",
		"Liberators",
		"Destroyers",
	-- Fantastical
		"All-Seeing Eye",
		"Old Children",
		"Spectre",
		"Dragon King",
		"Seven Hands",
		"Imperial Phlogistonist",
		"Sacred Snake-god",
		"Eternal Pyramid",
		"Towering Tree",
		"Viridian Magister",
		"Thousand-tongued All-speaker"
}
-- exile-worthy crime
local crime1 = {
	"treason",
	"betrayal",
	"murder",
	"heresy",
	"blasphemy",
	"betrayal",
	"regicide",
	"conspiracy",
	"kidnapping",
	"corruption",
	"abduction",
	"subversion",
	"mutiny",
	"rebellion",
	"usurpation",
	"espionage",
	"sabotage",
	"treachery",
	"sedition"
}
-- flavour-text crime
local crime2 = {
	--[[01]] "leading the youth astray",
	--[[02]] "smuggling contraband",
	--[[03]] "vagabondage",
	--[[04]] "banditry",
	--[[05]] "piracy absent a letter of marque",
	--[[06]] "drunkenness",
	--[[07]] "sinful living",
	--[[08]] "rabble rousing",
	--[[09]] "inciting violence",
	--[[10]] "unspeakable acts",
	--[[11]] "that of which we shall not speak",
	--[[12]] "endangering the survival of our people",
	--[[13]] "causing the great tragedy that befell us",
	--[[14]] "refusing to partake in the sacred rituals",
	--[[15]] "shameless acts",
	--[[16]] "willful sloth",
	--[[17]] "preaching foreign gods",
	--[[18]] "gross vanity",
	--[[19]] "wickedness",
	--[[20]] "assassination of one who was high-born",
	--[[21]] "sharing secrets with foreign powers",
	--[[22]] "black magic",
	--[[23]] "witchcraft afflicting the fertility of our crops",
	--[[24]] "placing curses upon the innocent",
	--[[25]] "shameful conduct",
	--[[26]] "cowardice in the face of glory",
	--[[27]] "tax evasion",
	--[[28]] "abusing their station for personal gain",
	--[[29]] "desecration of holy relics",
	--[[30]] "subverting the course of justice",
	--[[31]] "robbery",
	--[[32]] "attempted murder",
	--[[33]] "grave robbing",
	--[[34]] "cruelty to animals",
	--[[35]] "eating forbidden foods",
	--[[36]] "embezzlement",
	--[[37]] "questioning the gloriousness of our ways",
	--[[38]] "bearing false witness",
	--[[39]] "deception of those who must be obeyed",
	--[[40]] "fraud",
	--[[41]] "fakery",
	--[[42]] "consorting with disreputables",
	--[[43]] "trespassing upon the tall tower",
	--[[44]] "poaching on royal lands",
	--[[45]] "impersonation of an official",
	--[[46]] "insulting our great leaders",
	--[[47]] "disobedience toward rightful authority",
	--[[48]] "dealing in harmful potions",
	--[[49]] "pickpocketing pious pilgrims",
	--[[50]] "possession of stolen goods",
	--[[51]] "rioting",
	--[[52]] "racketeering",
	--[[53]] "arson",
	--[[54]] "soliciting assassins to commit murder",
	--[[55]] "stealing livestock",
	--[[56]] "usury",
	--[[57]] "aspirations to tyranny",
	--[[58]] "improper ambition",
	--[[59]] "failing to venerate the gods",
	--[[60]] "vandalism",
	--[[61]] "abidingly uncouth comportment",
	--[[62]] "adopting barbarian customs",
	--[[63]] "speaking a forbidden tongue",
	--[[64]] "harassment",
	--[[65]] "forgery",
	--[[66]] "bribery",
	--[[67]] "forsaking our ancestors",
	--[[68]] "mocking all that is good",
	--[[69]] "stubborn foolishness",
	--[[70]] "persistent idiocy",
	--[[71]] "failure to exercise one's duty",
	--[[72]] "disregard of honor",
	--[[73]] "breaking the faith",
	--[[74]] "touching the forbidden",
	--[[75]] "seeking banned knowledge",
	--[[76]] "slander",
	--[[77]] "rejecting common sense",
	--[[78]] "failing to appear for military service",
	--[[79]] "hoarding food during famine",
	--[[80]] "befouling the good reputation of our people",
	--[[81]] "sowing discord among the populace",
	--[[82]] "sleeping with unclean creatures",
	--[[83]] "violating the chastity of the priesthood",
	--[[84]] "marrying outside their caste",
	--[[85]] "cheating at dice",
	--[[86]] "gardening without a permit",
	--[[87]] "stealing priceless art",
	--[[88]] "aiding an adulterous princess",
	--[[89]] "leading an unauthorized military campaign",
	--[[90]] "claiming that the world is round",
	--[[91]] "claiming that the world is not round",
	--[[92]] "promoting belief in gravity"
}
--woe upon ye
local woe = {
	"May their name be forgotten.",
	"They are proscribed.",
	"Never suffer them to return.",
	"May the gods have mercy upon them.",
	"Let none come to their aid.",
	"May their weeping never cease.",
	"Their life is forfeit.",
	"It shall be as if they were never born.",
	"May their end be swift.",
	"May fortune forgive them.",
	"They shall live so long as they deserve.",
	"Let the beasts do with them as they wish.",
	"This is justice.",
	"Let none dispute it.",
	"May they wander fruitlessly.",
	"May their bones bleach in the sun.",
	"Thus we declare.",
	"For we are merciful.",
	"Let this be our kindness to them.",
	"Begone, evildoer.",
	"Thus do we cleanse ourselves.",
	"We wash our hands of them.",
	"Fortune shall be their final judge.",
	"They are disowned.",
	"We never knew them.",
	"They are cut off.",
	"Let them live with the beasts.",
	"Let the barbarians and wild folk have them.",
	"They are not fit for civilized lands.",
	"Thus we ensure our security.",
	"Only the righteous belong among us.",
	"May they toil in vain.",
	"So it is written. So it is done.",
	"Even the dogs despise them.",
	"We break no bread with traitors."
}
--Various corruptions of "Ozymandias"
local exile = {
	"Ochymadion",
	"Aseymedius",
	"Eshenadios",
	"Uzymandeos",
	"Isemendion",
	"Zymenios",
	"Hocheemundis",
	"Otemanediate",
	"Oisemondas",
	"Wazymdis",
	"Wazhmindas",
	"Okaemanadia",
	"Caemandior",
	"Oshaemediash",
	"Otzakantas",
	"Archanatus"
}
--what happened here? Lost to memory
local mythic_terror = {
	"Great Calamity",
	"Unending Curse",
	"Ancient Curse",
	"Curse",
	"Catastrophe",
	"Great Dying",
	"Mythic Terror",
	"Night",
	"Darkness",
	"Scourge",
	"Sleeping Evil",
	"Fiery Breath",
	"Great Burning",
	"Great Bleeding",
	"Ancient Exodus",
	"Fearful Horror",
	"Evil Spirits",
	"Ghosts",
	"Haunting",
	"Rumbling Earth",
	"Burning Rock",
	"Great Folly",
	"Old Tales",
	"Evil Wind",
	"Bitter Waters",
	"Howling Dust",
	"Hateful Sky",
	"Great Confusion",
	"Lost"
}
local generate_text = function(player)
	local letter_text = ""
	--
	local meta        = player:get_meta()
	--
	local judge       = judger[random(#judger)]
	local your_name   = meta:get_string("char_name")
	local origin_name = lore.generate_name(4)
	local polity_name = lore.generate_name(5)
	local cr1         = crime1[random(#crime1)]
	local cr2         = crime2[random(#crime2)]
	local your_woe    = woe[random(#woe)]
	local exile_land  = exile[random(#exile)]
	local terror      = mythic_terror[random(#mythic_terror)]
	letter_text =
		"By decree of the "..judge..
		" of "..polity_name..": "..
		"\n \n "..
		"\n "..your_name.." of "..origin_name..
		"\n \n "..
		"\nis hereby sentenced to exile for the crimes of "..
		"\n  "..
		"\n"..cr1..
		"\n  "..
		"\nand "..
		"\n  "..
		"\n"..cr2.."."..
		"\n \n \n"..
		"\nThey are banished to the land of "..exile_land.."."..
		"\n  "..
		"\nThe land of the "..terror.."."..
		"\n  \n \n"..
		"\n"..your_woe
	return letter_text
end
--------------------------------------------
local function get_formspec(meta, letter_text)
	local formspec = {
		"size[9,11]",
		"textarea[1.5,1.5;8.6,10.6;;" .. minetest.formspec_escape(letter_text) .. ";]",
		"button_exit[8.2,10.6;0.8,0.5;exit_form;X]",
		"background[0,0;18,11;lore_exile_letter_bg.png;true]"}
	return table.concat(formspec, "")
end
-----------------------------------------------
local after_place = function(pos, placer, itemstack, pointed_thing)
	local meta        = minetest.get_meta(pos)
	local stack_meta  = itemstack:get_meta()
	local letter_text = stack_meta:get_string("lore:letter_text")
	if letter_text == "" then
		letter_text = generate_text(placer)
	end
	local form = get_formspec(meta, letter_text )
	meta:set_string("formspec", form)
	meta:set_string("lore:letter_text", letter_text)

end
---------------------------------------------
--Placeable Node
minetest.register_node("lore:exile_letter", {
	description = "Sentence of Exile",
	tiles       = {"lore_exile_letter.png"},
	--inventory_image = {"lore_exile_letter_inv.png"},
	stack_max  = 1,
	paramtype  = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable   = false,
	drawtype   = "nodebox",
	node_box   = {
		type  = "fixed",
		fixed = {-0.35, -0.5, -0.4, 0.35, -0.45, 0.4},
	},
	groups = {dig_immediate = 3, temp_pass = 1, flammable = 1},
	sounds = nodes_nature.node_sound_leaves_defaults(),
	after_place_node  = after_place,
	preserve_metadata = function(pos, oldnode, oldmeta, drops)
		local letter_text = oldmeta["lore:letter_text"]
		local stack_meta  = drops[1]:get_meta()
		stack_meta:set_string("lore:letter_text", letter_text)
	end,
})
--------------------------------------
minetest.register_on_newplayer(function(player)
	local inv        = player:get_inventory()
	local letter     = ItemStack("lore:exile_letter")
	local stack_meta = letter:get_meta()
	stack_meta:set_string("lore:letter_text", generate_text(player))
	inv:add_item("main", letter)
end)
minetest.register_on_respawnplayer(function(player)
	local inv        = player:get_inventory()
	local letter     = ItemStack("lore:exile_letter")
	local stack_meta = letter:get_meta()
	stack_meta:set_string("lore:letter_text", generate_text(player))
	inv:add_item("main", letter)
end)
