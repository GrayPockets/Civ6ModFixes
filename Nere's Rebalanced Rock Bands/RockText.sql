-- CUSTOM
INSERT OR REPLACE INTO EnglishText (Tag, Text)
VALUES
	-- Original Values
	--('LOC_PROMOTION_ALBUM_COVER_ART_DESCRIPTION', 'Performs as if 1 level more experienced on wonder tiles.'),
	--('LOC_PROMOTION_ARENA_ROCK_DESCRIPTION', 		'Performs as if 2 levels more experienced on Entertainment Complex district tiles.'),
	--('LOC_PROMOTION_GLAM_ROCK_DESCRIPTION', 		'Performs as if 2 levels more experienced on Theater Square district tiles.'),
	--('LOC_PROMOTION_GOES_TO_DESCRIPTION', 		'Civilizations within 10 tiles receive 50% of the [ICON_TOURISM] Tourism from this concert.'),
	--('LOC_PROMOTION_INDIE_DESCRIPTION', 			'Performing a concert causes that city to lose 40 Loyalty.'),
	--('LOC_PROMOTION_MUSIC_FESTIVAL_DESCRIPTION', 	'Performs at National Parks and Natural Wonders for expected 1000 [ICON_TOURISM] Tourism and 1 level more experienced.'),
	--('LOC_PROMOTION_POP_DESCRIPTION', 			'Earn [ICON_GOLD] Gold equal to 25% of the [ICON_Tourism] Tourism generated.'),
	--('LOC_PROMOTION_REGGAE_ROCK_DESCRIPTION', 	'Performs as if 2 levels more experienced on Water Park district tiles.'),
	--('LOC_PROMOTION_RELIGIOUS_ROCK_DESCRIPTION', 	'Performs a concert that converts the majority religion of that city to the religion founded by the player.'),
	--('LOC_PROMOTION_ROADIES_DESCRIPTION', 		'+4 [ICON_Movement] Movement.'),
	--('LOC_PROMOTION_SPACE_ROCK_DESCRIPTION', 		'Performs at Spaceports and Campuses for +500 [ICON_TOURISM] Tourism (+1000 [ICON_TOURISM] Tourism if Campus has a University) and 1 level more experienced.'),
	--('LOC_PROMOTION_SURF_ROCK_DESCRIPTION', 		'Performs at Seaside Resorts and Harbors for +500 [ICON_TOURISM] Tourism (+1000 [ICON_TOURISM] Tourism if Harbor has a Shipyard) and 1 level more experienced.'),
	--('LOC_TECH_COMPUTERS_DESCRIPTION', 			'Grants the ability to construct an additional Spy. +25% [ICON_Tourism] Tourism across your empire.');
	
	-- CUSTOM Updates
	('LOC_PROMOTION_ARENA_ROCK_DESCRIPTION', 		'Performs as if 1 level more experienced on Entertainment Complex district tiles.'),
	('LOC_PROMOTION_GLAM_ROCK_DESCRIPTION', 		'Performs as if 1 level more experienced on Theater Square district tiles.'),
	('LOC_PROMOTION_GOES_TO_DESCRIPTION', 			'Civilizations within 10 tiles receive 35% of the [ICON_TOURISM] Tourism from this concert.'),
	('LOC_PROMOTION_REGGAE_ROCK_DESCRIPTION', 		'Performs as if 1 level more experienced on Water Park district tiles.'),
	('LOC_PROMOTION_MUSIC_FESTIVAL_DESCRIPTION', 	'Performs at National Parks and Natural Wonders for expected 1000 [ICON_TOURISM] Tourism and 2 levels more experienced.'),
	('LOC_PROMOTION_ROADIES_DESCRIPTION', 			'+8 [ICON_Movement] Movement.'),
	('LOC_PROMOTION_SURF_ROCK_DESCRIPTION', 		'Performs at Seaside Resorts and Harbors for +500 [ICON_TOURISM] Tourism (+1000 [ICON_TOURISM] Tourism if Harbor has a Shipyard) and 2 levels more experienced.'),
	('LOC_TECH_COMPUTERS_DESCRIPTION', 				'Grants the ability to construct an additional Spy. +15% [ICON_Tourism] Tourism across your empire.');
