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
		--[[001]] "King",
		--[[002]] "Queen",
		--[[003]] "Emperor",
		--[[004]] "Empress",
		--[[005]] "Exalted Ruler",
		--[[006]] "Majestic Leader",
		--[[007]] "High King",
		--[[008]] "High Queen",
		--[[009]] "Nobles",
		--[[010]] "Lords",
		--[[011]] "Duke",
		--[[012]] "Duchess",
		--[[013]] "Lord",
		--[[014]] "Most Highly-Exalted Supreme Ruler",
		--[[015]] "Great Leader",
		--[[016]] "Golden King",
		--[[017]] "Jade Queen",
		--[[018]] "Prince",
		--[[019]] "Princess",
		--[[020]] "Regent",
		--[[021]] "Dictator",
	-- Officials
		--[[022]] "High Judge",
		--[[023]] "Tribunal",
		--[[024]] "Council",
		--[[025]] "Courts",
		--[[026]] "Presidium",
		--[[027]] "Law Giver's",
		--[[028]] "King's Justice",
		--[[029]] "Sheriff",
		"Crown Steward and Bailiff of the Three Chiltern Hundreds",
	-- Cultists
		--[[030]] "Brotherhood",
		--[[031]] "Sisterhood",
		--[[032]] "High Priest",
		--[[033]] "High Priestess",
		--[[034]] "Great Prophet",
		--[[035]] "Anointed One",
		--[[036]] "God-King",
		--[[037]] "Philosopher King",
		--[[039]] "Seers",
		--[[040]] "Sanctum",
		--[[041]] "Order",
		--[[042]] "Monks",
		--[[043]] "Priests",
		--[[044]] "Priestesses",
		--[[045]] "Enlightened Ones",
		--[[046]] "Great Sage",
		--[[047]] "Shaman",
	-- Tribals
		--[[048]] "Elders",
		--[[049]] "Wise Ones",
		--[[050]] "Clan Council",
		--[[051]] "Tribal Chiefs",
		--[[052]] "Great Chieftain",
		--[[053]] "United Clans",
		--[[054]] "Wise Man",
		--[[055]] "Wise Woman",
	-- Republicans
		--[[056]] "Citizenry",
		--[[057]] "People",
		--[[058]] "Senate",
		--[[059]] "Consul",
		--[[060]] "Senators",
		--[[061]] "Assembly",
		--[[062]] "Chief Minister",
	-- Geographic Polities
		--[[063]] "City State",
		--[[064]] "Empire",
		--[[065]] "Kingdom",
		--[[066]] "Principality",
		--[[067]] "Duchy",
		--[[068]] "Republic",
		--[[069]] "League",
		--[[070]] "Confederation",
		--[[071]] "Federation",
		--[[072]] "Alliance",
		--[[073]] "Coalition",
		--[[074]] "Nation",
		--[[075]] "Clan",
		--[[076]] "Chiefdom",
		--[[077]] "Tribe",
		--[[078]] "Monastic Order",
		--[[079]] "Merchant Republic",
		--[[080]] "Theocracy",
	-- Military
		--[[081]] "Generals",
		--[[082]] "Champion",
		--[[083]] "Mighty Warriors",
		--[[084]] "Admirals",
		--[[085]] "Legion",
		--[[086]] "Commander",
		--[[087]] "Commandant",
		--[[088]] "Warlord",
	-- Rogues
		--[[089]] "Pirates",
		--[[090]] "Bandits",
		--[[091]] "Company",
		--[[092]] "Horde",
		--[[093]] "Liberators",
		--[[094]] "Destroyers",
	-- Fantastical
		--[[095]] "All-Seeing Eye",
		--[[096]] "Old Children",
		--[[097]] "Spectre",
		--[[098]] "Dragon King",
		--[[099]] "Seven Hands",
		--[[100]] "Imperial Phlogistonist",
		--[[101]] "Sacred Snake-god",
		--[[102]] "Eternal Pyramid",
		--[[103]] "Towering Tree",
		--[[104]] "Viridian Magister",
		--[[105]] "Thousand-tongued All-speaker"
}
-- exile-worthy crime
local crime1 = {
	--[[01]] "treason",
	--[[02]] "betrayal",
	--[[03]] "murder",
	--[[04]] "heresy",
	--[[05]] "blasphemy",
	--[[06]] "betrayal",
	--[[07]] "regicide",
	--[[08]] "conspiracy",
	--[[09]] "kidnapping",
	--[[10]] "corruption",
	--[[11]] "abduction",
	--[[12]] "subversion",
	--[[13]] "mutiny",
	--[[14]] "rebellion",
	--[[15]] "usurpation",
	--[[16]] "espionage",
	--[[17]] "sabotage",
	--[[18]] "treachery",
	--[[19]] "sedition"
}
-- flavour-text crime
local crime2 = {
	--[[01 - piety    ]] "leading the youth astray",
	--[[02 - perfidy  ]] "smuggling contraband",
	--[[03 - paucity  ]] "vagabondage",
	--[[04 - property ]] "banditry",
	--[[05 - perfidy  ]] "piracy absent a letter of marque",
	--[[06 - paucity  ]] "drunkenness",
	--[[07 - purity   ]] "sinful living",
	--[[08 - perfidy  ]] "rabble rousing",
	--[[09 - power    ]] "inciting violence",
	--[[10 - purity   ]] "unspeakable acts",
	--[[11 - purity   ]] "that of which we shall not speak",
	--[[12 - power    ]] "endangering the survival of our people",
	--[[13 - power    ]] "causing the great tragedy that befell us",
	--[[14 - piety    ]] "refusing to partake in the sacred rituals",
	--[[15 - purity   ]] "shameless acts",
	--[[16 - paucity  ]] "willful sloth",
	--[[17 - piety    ]] "preaching foreign gods",
	--[[18 - paucity  ]] "gross vanity",
	--[[19 - purity   ]] "wickedness",
	--[[20 - power    ]] "assassination of one who was high-born",
	--[[21 - perfidy  ]] "sharing secrets with foreign powers",
	--[[22 - piety    ]] "black magic",
	--[[23 - presage  ]] "witchcraft afflicting the fertility of our crops",
	--[[24 - presage  ]] "placing curses upon the innocent",
	--[[25 - purity   ]] "shameful conduct",
	--[[26 - perfidy  ]] "cowardice in the face of glory",
	--[[27 - perfidy  ]] "tax evasion",
	--[[28 - perfidy  ]] "abusing their station for personal gain",
	--[[29 - piety    ]] "desecration of holy relics",
	--[[30 - perfidy  ]] "subverting the course of justice",
	--[[31 - property ]] "robbery",
	--[[32 - power    ]] "attempted murder",
	--[[33 - property ]] "grave robbing",
	--[[34 - power    ]] "cruelty to animals",
	--[[35 - piety    ]] "eating forbidden foods",
	--[[36 - property ]] "embezzlement",
	--[[37 - piety    ]] "questioning the gloriousness of our ways",
	--[[38 - deceit   ]] "bearing false witness",
	--[[39 - perfidy  ]] "deception of those who must be obeyed",
	--[[40 - property ]] "fraud",
	--[[41 - property ]] "fakery",
	--[[42 - purity   ]] "consorting with disreputables",
	--[[43 - perfidy  ]] "trespassing upon the tall tower",
	--[[44 - perfidy  ]] "poaching on royal lands",
	--[[45 - perfidy  ]] "impersonation of an official",
	--[[46 - piety    ]] "insulting our great leaders",
	--[[47 - perfidy  ]] "disobedience toward rightful authority",
	--[[48 - power    ]] "dealing in harmful potions",
	--[[49 - property ]] "pickpocketing pious pilgrims",
	--[[50 - property ]] "possession of stolen goods",
	--[[51 - power    ]] "rioting",
	--[[52 - property ]] "racketeering",
	--[[53 - power    ]] "arson",
	--[[54 - power    ]] "soliciting assassins to commit murder",
	--[[55 - property ]] "stealing livestock",
	--[[56 - property ]] "usury",
	--[[57 - perfidy  ]] "aspirations to tyranny",
	--[[58 - piety    ]] "improper ambition",
	--[[59 - piety    ]] "failing to venerate the gods",
	--[[60 - property ]] "vandalism",
	--[[61 - paucity  ]] "abidingly uncouth comportment",
	--[[62 - paucity  ]] "adopting barbarian customs",
	--[[63 - piety    ]] "speaking a forbidden tongue",
	--[[64 - power    ]] "harassment",
	--[[65 - property ]] "forgery",
	--[[66 - perfidy  ]] "bribery",
	--[[67 - piety    ]] "forsaking our ancestors",
	--[[68 - piety    ]] "mocking all that is good",
	--[[69 - paucity  ]] "stubborn foolishness",
	--[[70 - paucity  ]] "persistent idiocy",
	--[[71 - perfidy  ]] "failure to exercise one's duty",
	--[[72 - piety    ]] "disregard of honor",
	--[[73 - piety    ]] "breaking the faith",
	--[[74 - piety    ]] "touching the forbidden",
	--[[75 - piety    ]] "seeking banned knowledge",
	--[[76 - property ]] "slander",
	--[[77 - paucity  ]] "rejecting common sense",
	--[[78 - perfidy  ]] "failing to appear for military service",
	--[[79 - perfidy  ]] "hoarding food during famine",
	--[[80 - piety    ]] "befouling the good reputation of our people",
	--[[81 - piety    ]] "sowing discord among the populace",
	--[[82 - purity   ]] "sleeping with unclean creatures",
	--[[83 - piety    ]] "violating the chastity of the priesthood", 
	--[[84 - purity   ]] "marrying outside their caste",
	--[[85 - property ]] "cheating at dice",
	--[[86 - perfidy  ]] "gardening without a permit", 
	--[[87 - property ]] "stealing priceless art",
	--[[88 - purity   ]] "aiding an adulterous princess",
	--[[89 - perfidy  ]] "leading an unauthorized military campaign",
	--[[90 - piety    ]] "claiming that the world is round",
	--[[91 - piety    ]] "claiming that the world is not round",
	--[[92 - piety    ]] "promoting belief in gravity"
}
-- woe upon ye
local woe = {}
local genderSU = {male = "He"     , female = "She"    } -- subjective + uppercase
local genderSL = {male = "he"     , female = "she"    } -- subjective + lowercase
local genderOU = {male = "Him"    , female = "Her"    } -- objective  + uppercase
local genderOL = {male = "him"    , female = "her"    } -- objective  + lowercase
local genderPU = {male = "His"    , female = "Her"    } -- possessive + uppercase
local genderPL = {male = "his"    , female = "her"    } -- possessive + lowercase
local genderRU = {male = "Himself", female = "Herself"} -- reflexive  + uppercase
local genderRL = {male = "himself", female = "herself"} -- reflexive  + lowercase
local populate_woe = function(player)
	local gend = player_api.get_gender(player)
	return {
		--[[01]] "May "..genderPL[gend].." name be forgotten.",
		--[[02]] genderSU[gend].."is proscribed.",
		--[[03]] "Never suffer"..genderOL[gend].." to return.",
		--[[04]] "May the gods have mercy upon "..genderOL[gend]..".",
		--[[05]] "Let none come to "..genderPL[gend].." aid.",
		--[[06]] "May "..genderPL[gend].." weeping never cease.",
		--[[07]] genderPU[gend].." life is forfeit.",
		--[[08]] "It shall be as if "..genderSL[gend].." were never born.",
		--[[09]] "May "..genderPL[gend].." end be swift.",
		--[[10]] "May fortune forgive "..genderOL[gend]..".",
		--[[11]] genderSU[gend].." shall live so long as "..genderSL[gend].." deserve.",
		--[[12]] "Let the beasts do with "..genderOL[gend].." as "..genderSL[gend].." wish.",
		--[[13]] "This is justice.",
		--[[14]] "Let none dispute it.",
		--[[15]] "May "..genderSL[gend].." wander fruitlessly.",
		--[[16]] "May "..genderPL[gend].." bones bleach in the sun.",
		--[[17]] "Thus we declare.",
		--[[18]] "For we are merciful.",
		--[[19]] "Let this be our kindness to "..genderOL[gend]..".",
		--[[20]] "Begone, evildoer.",
		--[[21]] "Thus do we cleanse ourselves.",
		--[[22]] "We wash our hands of "..genderOL[gend]..".", -- Perhaps a reference to Pontius Pilate
		--[[23]] "Fortune shall be "..genderPL[gend].." final judge.",
		--[[24]] genderSU[gend].." is disowned.",
		--[[25]] "We never knew "..genderOL[gend]..".",
		--[[26]] genderSU[gend].." is cut off.",
		--[[27]] "Let "..genderOL[gend].." live with the beasts.",
		--[[28]] "Let the barbarians and wild folk have "..genderOL[gend]..".",
		--[[29]] genderSU[gend].." is not fit for civilized lands.",
		--[[30]] "Thus we ensure our security.", -- Perhaps a reference to Sheev Palpatine
		--[[31]] "Only the righteous belong among us.",
		--[[32]] "May "..genderSL[gend].." toil in vain.",
		--[[33]] "So it is written. So it is done.", -- Now a reference to Cecil B. DeMille
		--[[34]] "Even the dogs despise "..genderOL[gend]..".",
		--[[35]] "We break no bread with traitors.",
		--[[36 - new]] "Let this be "..genderPL[gend].." journey to cleanse "..genderRL[gend].."."
	}
end
-- Various corruptions of "Ozymandias"
local exile = {
	--[[01]] "Ochymadion",
	--[[02]] "Aseymedius",
	--[[03]] "Eshenadios",
	--[[04]] "Uzymandeos",
	--[[05]] "Isemendion",
	--[[06]] "Zymenios",
	--[[07]] "Hocheemundis",
	--[[08]] "Otemanediate",
	--[[09]] "Oisemondas",
	--[[10]] "Wazymdis",
	--[[11]] "Wazhmindas",
	--[[12]] "Okaemanadia",
	--[[13]] "Caemandior",
	--[[14]] "Oshaemediash",
	--[[15]] "Otzakantas",
	--[[16]] "Archanatus"
}
-- What happened here? Lost to memory.
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
	woe               = populate_woe(player)
	local your_woe    = woe[random(#woe)]
	local exile_land  = exile[random(#exile)]
	local terror      = mythic_terror[random(#mythic_terror)]
	local gend        = player_api.get_gender(player)
	letter_text =
		"By decree of the "..judge..
		" of "..polity_name..": "..
		"\n \n "..
		"\n  "..your_name.." of "..origin_name..
		"\n \n "..
		"\nis hereby sentenced to exile for the crimes of "..
		"\n  "..
		"\n"..cr1..
		"\n    "..
		"\nand "..
		"\n  "..
		"\n"..cr2.."."..
		"\n \n \n"..
		"\n"..genderSU[gend].." is banished to the land of "..exile_land.."."..
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
