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
		--[[01]] "a good",
		--[[02]] "a happy",
		--[[03]] "a pleasant",
		--[[04]] "an enjoyable",
	-- Drab
		--[[05]] "a boring",
		--[[06]] "an uneventful",
		--[[07]] "a mediocre",
		--[[08]] "a dull",
		--[[09]] "a humdrum",
	-- Easy
		--[[10]] "a comfortable",
		--[[11]] "a satisfied",
		--[[12]] "a soft",
		--[[13]] "an easy",
	-- Nominal
		--[[14]] "a normal",
		--[[15]] "an average",
		--[[16]] "an unremarkable",
	-- Diminutive
		--[[17]] "a restricted",
		--[[18]] "a narrow-horizoned",
		--[[19]] "a homely",
		--[[20]] "a constricted",
	-- Grievous
		--[[21]] "a frustrated",
		--[[22]] "an empty",
		--[[23]] "an unfulfilling",
		--[[24]] "a sorrowful",
		--[[25]] "a mournful",
		--[[26]] "a long-suffering",
	-- Toiling
		--[[27]] "an overburdened",
		--[[28]] "a hardworking",
		--[[29]] "a slave-like",
	-- Social
		--[[30]] "a family centred",
		--[[31]] "a communal",
		--[[32]] "a self-centred",
		--[[33]] "a selfless",
		--[[34]] "a solitary",
		--[[35]] "a low-born",
		--[[36]] "an aristocratic",
	-- Moral
		--[[37]] "a well respected",
		--[[38]] "an upstanding",
		--[[39]] "a patriotic",
		--[[40]] "an honorable",
	-- Wasted
		--[[41]] "a dissipated",
		--[[42]] "a dissolute",
		--[[43]] "a slothful",
		--[[44]] "an indulgent",
		--[[45]] "a misspent",
	-- Aberrant
		--[[46]] "an eccentric",
		--[[47]] "an oddball",
		--[[48]] "a strange"
}
-- What went wrong:
local woe = {
	-- bad business
		--[[01]] "made a bad bargain",
		--[[02]] "made a deal with the wrong people",
		--[[03]] "sold out and got swindled",
		--[[04]] "was made an offer too good to be true",
		--[[05]] "saw a fantastic opportunity",
		--[[06]] "took a gamble",
		--[[07]] "found a new way to make a living",
	-- emotion
		--[[08]] "lost all hope",
		--[[09]] "fell into despair",
		--[[10]] "discovered a great passion",
		--[[11]] "found a source of great joy",
		--[[12]] "was provoked to anger",
		--[[13]] "lashed out",
		--[[14]] "snapped",
		--[[15]] "couldn't take it anymore",
		--[[16]] "decided love was dead",
		--[[17]] "felt like the world didn't care",
		--[[18]] "was disgusted by life",
		--[[19]] "became obsessed",
	-- fight the power
		--[[20]] "stood up for the truth",
		--[[21]] "spoke truth to power",
		--[[22]] "took a stand",
		--[[23]] "picked a fight with the wrong people",
		--[[24]] "raged against the machine",
		--[[25]] "fought for justice",
		--[[26]] "put everything toward the cause",
		--[[27]] "rose up against the oppressor",
	-- wrong type of person/corruption
		--[[28]] "was persecuted by the intolerant",
		--[[29]] "refused to conform",
		--[[30]] "refused to hide anymore",
		--[[31]] "chose to live differently",
		--[[32]] "saw things others did not see",
	-- life change
		--[[33]] "decided not live that way anymore",
		--[[34]] "thought life needed shaking up",
		--[[35]] "made a few minor changes",
		--[[36]] "had an epiphany",
		--[[37]] "took up a new hobby",
	-- crime
		--[[38]] "got in too deep",
		--[[39]] "chose the wrong path",
		--[[41]] "thought no one would notice",
		--[[42]] "got caught",
		--[[43]] "got snitched on",
		--[[44]] "bungled a sure thing",
	-- poverty
		--[[45]] "fell on hard times",
		--[[46]] "did what needed to be done",
		--[[47]] "did what it took to feed the family",
	-- politics
		--[[48]] "picked the losing side",
		--[[49]] "took a chance to grab power",
		--[[50]] "ended up on the wrong side of history",
		--[[51]] "offended a powerful man",
		--[[52]] "offended a powerful woman",
		--[[53]] "provoked the jealousy a rival",
	-- random acts
		--[[54]] "was just passing by, when",
		--[[55]] "had an accident",
		--[[56]] "was mistaken for someone else",
		--[[57]] "was imprisoned on false charges",
		--[[58]] "got caught up in someone else's mess",
		--[[59]] "witnessed what was supposed to be a secret",
	-- one stupid mistake
		--[[60]] "made one bad decision",
		--[[61]] "said one wrong thing",
		--[[62]] "gave in to temptation",
		--[[63]] "had a momentary lapse of judgement",
		--[[64]] "started something too big",
		--[[65]] "lost control",
		--[[66]] "followed bad advice",
		--[[67]] "had too much to drink",
		--[[68]] "learned the truth too late",
		--[[69]] "committed a simple indiscretion",
		--[[70]] "had a great idea",
		--[[71]] "misjudged the situation entirely",
	-- romance/family
		--[[72]] "fell in love",
		--[[73]] "had an affair",
		--[[74]] "gave up everything for love",
		--[[75]] "had a son",
		--[[76]] "had a daughter",
		--[[77]] "discovered a long-lost relative",
		--[[78]] "got mixed up in a love triangle",
	-- weird
		--[[79]] "got involved with a travelling magician",
		--[[80]] "met a man with two heads",
		--[[81]] "found a bird that could predict the future",
		--[[82]] "ate some odd beans",
		--[[83]] "tried to learn the flute",
		--[[84]] "was given a secret map",
		--[[85]] "discovered a secret chamber",
		--[[86]] "saw a ghost",
		--[[87]] "received a vision from the other side",
		--[[88]] "had a dream that explained everything",
		--[[89]] "built a perpetual-motion machine",
		--[[90]] "learned the meaning of life"
}
lore.generate_bio = function(player)
	local text = ""
	
	local meta = player:get_meta()
	local gend = player_api.get_gender(player)
	
	local persona   = personality[random(#personality)]
	local virt      = virtue[random(#virtue)]
	local your_name = meta:get_string("char_name")
	local lif       = life[random(#life)]
	local your_woe  = woe[random(#woe)]
	
	
	text =
		"\n "..persona.." and "..virt..","..
		"\n "..your_name.." had lived "..lif.." life,"..
		"\n until one day "..gender[gend].." "..your_woe.."...."
	
		meta:set_string("bio", text)
		
	return text
end
