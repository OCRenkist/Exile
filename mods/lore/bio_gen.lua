----------------------------------------------------------
--BIO GEN
--[[
	Biography.
	
	Who is the character for this life?
	Displayed on Char_tab.'
	
	Gives sense of character.
	
	Each life is a chance to behave different, try new strategies, methods, modes of being.
	The traits suggested are a primer to do things different than your normal patterns.
	
	"[Outgoing] and [diligent],
	[Bob] had lived a [miserable] life,
	until one day [he][picked a fight with the wrong people].... "
]]
local random = math.random
----------------------------------------------------------
local gender = {
	male   = "he",
	female = "she"
}
-- Big Five
-- (Try to make sure these are different from virtues!)
local personality = {
	-- openness
		--[[01]] "Conventional",
		--[[02]] "Unconventional",
		--[[03]] "Practical",
		--[[04]] "Imaginative",
		--[[05]] "Unadventurous",
		--[[06]] "Adventurous",
		--[[07]] "Traditional",
		--[[08]] "Rebellious",
	-- conscientiousness
		--[[09]] "Organized",
		--[[10]] "Disorganized",
		--[[11]] "Goal-driven",
		--[[12]] "Impulsive",
		--[[13]] "Dutiful",
		--[[14]] "Careless",
		--[[15]] "Precise",
		--[[16]] "Slapdash",
	-- extroversion
		--[[17]] "Shy",
		--[[18]1] "Gregarious",
		--[[19]] "Quiet",
		--[[20]] "Outgoing",
		--[[21]] "Withdrawn",
		--[[22]] "Sociable",
		--[[23]] "Reserved",
		--[[24]] "Expressive",
	-- agreeableness
		--[[25]] "Pleasant",
		--[[26]] "Argumentative",
		--[[27]] "Good-natured",
		--[[28]] "Critical",
		--[[29]] "Soft-hearted",
		--[[30]] "Suspicious",
		--[[31]] "Gullible",
		--[[32]] "Cynical",
	-- neuroticism
		--[[33]] "Calm",
		--[[34]] "Neurotic",
		--[[35]] "Steady",
		--[[36]] "Unstable",
		--[[37]] "Self-satisfied",
		--[[38]] "Moody",
		--[[39]] "Complacent",
		--[[40]] "Paranoid"
}
-- Miscellaneous Virtues
local virtue = {
	--[[01]] "courageous",
	--[[02]] "temperate",
	--[[03]] "charitable",
	--[[04]] "extravagant",
	--[[05]] "magnanimous",
	--[[06]] "patient",
	--[[07]] "honest",
	--[[08]] "witty",
	--[[09]] "friendly",
	--[[10]] "modest",
	--[[11]] "just",
	--[[12]] "ambitious",
	--[[13]] "assertive",
	--[[14]] "benevolent",
	--[[15]] "brave",
	--[[16]] "caring",
	--[[17]] "chaste",
	--[[18]] "cautious",
	--[[19]] "fastidious",
	--[[20]] "committed",
	--[[21]] "compassionate",
	--[[22]] "confident",
	--[[23]] "considerate",
	--[[24]] "contented",
	--[[25]] "cooperative",
	--[[26]] "courteous",
	--[[27]] "creative",
	--[[28]] "curious",
	--[[29]] "defiant",
	--[[30]] "dependable",
	--[[31]] "determined",
	--[[32]] "devoted",
	--[[33]] "diligent",
	--[[34]] "discerning",
	--[[35]] "discrete",
	--[[36]] "disciplined",
	--[[37]] "eloquent",
	--[[38]] "empathic",
	--[[39]] "enthusiastic",
	--[[40]] "faithful",
	--[[41]] "flexible",
	--[[42]] "focused",
	--[[43]] "tolerant",
	--[[44]] "forgiving",
	--[[45]] "strong",
	--[[46]] "frugal",
	--[[47]] "gentle",
	--[[48]] "graceful",
	--[[49]] "grateful",
	--[[50]] "helpful",
	--[[51]] "honorable",
	--[[52]] "hopeful",
	--[[53]] "humble",
	--[[54]] "comical",
	--[[55]] "idealistic",
	--[[56]] "virtuous",
	--[[57]] "impartial",
	--[[58]] "industrious",
	--[[59]] "innocent",
	--[[60]] "joyful",
	--[[61]] "kind",
	--[[62]] "knowledgeable",
	--[[63]] "loving",
	--[[64]] "loyal",
	--[[65]] "noble",
	--[[66]] "dignified",
	--[[67]] "merciful",
	--[[68]] "moderate",
	--[[69]] "peaceful",
	--[[70]] "persistent",
	--[[71]] "prudent",
	--[[72]] "purposeful",
	--[[73]] "reliable",
	--[[74]] "resolute",
	--[[75]] "resourceful",
	--[[76]] "respectful",
	--[[77]] "responsible",
	--[[78]] "reverent",
	--[[79]] "righteous",
	--[[80]] "selfless",
	--[[81]] "sensitive",
	--[[82]] "contemplative",
	--[[83]] "sincere",
	--[[84]] "sober",
	--[[85]] "spontaneous",
	--[[86]] "steadfast",
	--[[87]] "tactful",
	--[[88]] "thrifty",
	--[[89]] "tough",
	--[[90]] "tranquil",
	--[[91]] "trusting",
	--[[92]] "trustworthy",
	--[[93]] "understanding",
	--[[94]] "vigorous",
	--[[95]] "wise",
	--[[96]] "zealous"
}
-- State of former life:
-- (Ought to contrast with the world of Exile.)
local life = {
	-- Favorable
		"a good",
		"a happy",
		"a pleasant",
		"an enjoyable",
	-- Drab
		"a boring",
		"an uneventful",
		"a mediocre",
		"a dull",
		"a humdrum",
	-- Easy
		"a comfortable",
		"a satisfied",
		"a soft",
		"an easy",
	-- Nominal
		"a normal",
		"an average",
		"an unremarkable",
	-- Diminutive
		"a restricted",
		"a narrow-horizoned",
		"a homely",
		"a constricted",
	-- Grievous
		"a frustrated",
		"an empty",
		"an unfulfilling",
		"a sorrowful",
		"a mournful",
		"a long-suffering",
	-- Toiling
		"an overburdened",
		"a hardworking",
		"a slave-like",
	-- Social
		"a family centred",
		"a communal",
		"a self-centred",
		"a selfless",
		"a solitary",
		"a low-born",
		"an aristocratic",
	-- Moral
		"a well respected",
		"an upstanding",
		"a patriotic",
		"an honorable",
	-- Wasted
		"a dissipated",
		"a dissolute",
		"a slothful",
		"an indulgent",
		"a misspent",
	-- Aberrant
	"an eccentric",
	"an oddball",
	"a strange"
}
-- What went wrong:
local woe = {
	-- bad business
		"made a bad bargain",
		"made a deal with the wrong people",
		"sold out and got screwed",
		"was made an offer too good to be true",
		"saw a fantastic opportunity",
		"took a gamble",
		"found a new way to make a living",
	-- emotion
		"lost all hope",
		"fell into despair",
		"discovered a great passion",
		"found a source of great joy",
		"was provoked to anger",
		"lashed out",
		"snapped",
		"couldn't take it anymore",
		"decided love was dead",
		"felt like the world didn't care",
		"was disgusted by life",
		"became obsessed",
	-- fight the power
		"stood up for the truth",
		"spoke truth to power",
		"took a stand",
		"picked a fight with the wrong people",
		"raged against the machine",
		"fought for justice",
		"gave everything for the cause",
		"rose up against the oppressor",
	-- wrong type of person/corruption
		"refused to conform",
		"refused to hide anymore",
		"chose to live differently",
		"saw things others did not see",
	-- life change
		"decided not live that way anymore",
		"thought life needed shaking up",
		"made a few minor changes",
		"had an epiphany",
		"took up a new hobby",
	-- crime
		"got in too deep",
		"chose the wrong path",
		"thought no one would notice",
		"got caught",
		"got snitched on",
		"screwed up a sure thing",
	-- poverty
		"fell on hard times",
		"done what needed to be done",
		"did what it took to feed the family",
	-- politics
		"took a chance to grab power",
		"ended up on the losing side of history",
		"offended a powerful man",
		"offended a powerful woman",
		"provoked the jealousy a rival",
	-- random acts
		"had an accident",
		"was mistaken for someone else",
		"was imprisoned on false charges",
		"got caught up in someone else's mess",
		"witnessed what was supposed to be a secret",
	-- one stupid mistake
		"made one bad decision",
		"said one wrong thing",
		"gave into temptation",
		"had a momentary lapse of judgement",
		"started something too big",
		"lost control",
		"followed bad advice",
		"had too much to drink",
		"learnt the truth too late",
		"committed a simple indiscretion",
		"had a great idea",
		"misjudged the situation entirely",
	-- romance/family
		"fell in love",
		"had an affair",
		"gave everything for love",
		"had a son",
		"had a daughter",
		"discovered a long lost relative",
		"got mixed up in a love triangle",
	-- weird
		"got involved with a travelling magician",
		"met a man with two heads",
		"found a bird that could predict the future",
		"ate some weird beans",
		"tried to learn the flute",
		"was given a secret map",
		"discovered a secret chamber",
		"saw a ghost",
		"received a vision from the other side",
		"had a dream that explained everything",
		"built a perpetual motion machine",
		"learned the meaning of life"
}
lore.generate_bio = function(player)
	local text = ""
	
	local meta = player:get_meta()
	local gend = player_api.get_gender(player)
	
	local persona = personality[random(#personality)]
	local virt = virtue[random(#virtue)]
	local your_name = meta:get_string("char_name")
	local lif = life[random(#life)]
	local your_woe = woe[random(#woe)]
	
	
	text =
		"\n "..persona.." and "..virt..","..
		"\n "..your_name.." had lived "..lif.." life,"..
		"\n until one day "..gender[gend].." "..your_woe.."...."
	
		meta:set_string("bio", text)
		
	return text
end
