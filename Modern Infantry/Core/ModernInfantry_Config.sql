
-----------------------------------------------
-- Types
-----------------------------------------------	
	
INSERT INTO Types
		(Type,													Kind			)
VALUES	('UNIT_MODERN_INFANTRY',								'KIND_UNIT'		),
		('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',				'KIND_ABILITY'	),
		('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',	'KIND_MODIFIER'	),
		('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	'KIND_MODIFIER'	),
		('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	'KIND_MODIFIER'	);

-----------------------------------------------
-- Tags
-----------------------------------------------	
	
INSERT INTO Tags
		(Tag,						Vocabulary		)
VALUES	('CLASS_MODERN_INFANTRY',	'ABILITY_CLASS'	);

-----------------------------------------------
-- TypeTags
-----------------------------------------------		

INSERT INTO TypeTags
		(Type,										Tag						)
VALUES	('UNIT_MODERN_INFANTRY',					'CLASS_MODERN_INFANTRY'	),
		('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',	'CLASS_MODERN_INFANTRY'	);

INSERT INTO TypeTags (Type,		Tag)
SELECT 	'UNIT_MODERN_INFANTRY',	Tag
FROM 	TypeTags
WHERE 	Type = 'UNIT_MECHANIZED_INFANTRY';

-----------------------------------------------
-- Units
-----------------------------------------------	

UPDATE Units SET BaseMoves = 4 WHERE UnitType = 'UNIT_MECHANIZED_INFANTRY'; -- Mech Inf movement buff
	
INSERT INTO Units	(
		UnitType,
		Name,
		Description,
		BaseMoves,
		Cost,
		PurchaseYield,
		AdvisorType,
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		PrereqTech
		)
VALUES	('UNIT_MODERN_INFANTRY',	-- UnitType
		'LOC_UNIT_MODERN_INFANTRY_NAME',	-- Name
		'LOC_UNIT_MODERN_INFANTRY_DESCRIPTION', -- Description
		3, -- BaseMoves
		620, -- Cost
		'YIELD_GOLD', -- PurchaseYield
		'ADVISOR_CONQUEST', -- AdvisorType
		80, -- Combat
		2, -- BaseSightRange
		1, -- ZoneOfControl
		'DOMAIN_LAND', -- Domain
		'FORMATION_CLASS_LAND_COMBAT', -- FormationClass
		'PROMOTION_CLASS_RECON_HYBRID', -- PromotionClass
		7, -- Maintenance
		'TECH_SYNTHETIC_MATERIALS' -- PrereqTech
		);

/*
-----------------------------------------------
-- Units_XP2
-----------------------------------------------

INSERT INTO Units_XP2
		(UnitType,					ResourceCost	)
VALUES 	('UNIT_MODERN_INFANTRY',	10				);
*/

-----------------------------------------------
-- UnitAiInfos
-----------------------------------------------
		
INSERT INTO UnitAiInfos (UnitType,	AiType)
SELECT 	'UNIT_MODERN_INFANTRY',		AiType
FROM 	UnitAiInfos
WHERE 	UnitType = 'UNIT_MECHANIZED_INFANTRY';
		
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------

INSERT INTO UnitAbilities
		(UnitAbilityType,							Name,												Description													)
VALUES	('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',	'LOC_ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH_NAME',	'LOC_ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH_DESCRIPTION'	);

-----------------------------------------------
-- DynamicModifiers

-- This is where we start to define the Modifiers.
-----------------------------------------------

INSERT INTO	DynamicModifiers
		(ModifierType,												CollectionType,				EffectType								)
VALUES	('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',	'COLLECTION_UNIT_COMBAT',	'EFFECT_ADJUST_PLAYER_STRENGTH_MODIFIER'	),
		('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	'COLLECTION_UNIT_COMBAT',	'EFFECT_ADJUST_PLAYER_STRENGTH_MODIFIER'	),
		('MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	'COLLECTION_UNIT_COMBAT',	'EFFECT_ADJUST_PLAYER_STRENGTH_MODIFIER'	);

-----------------------------------------------
-- Modifiers

-- This is where we attach the ModType made in "DynamicModifiers" to our "ModifierID" mentioned in the first section.
-----------------------------------------------

INSERT INTO	Modifiers
		(ModifierId,											ModifierType,											OwnerRequirementSetId,	SubjectRequirementSetId,						Permanent,	RunOnce	)
VALUES	('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',	'MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',		NULL,					'REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',			0,			0		),
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	'MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	NULL,					'REQSET_MODERN_INFANTRY_PLOT_IS_JUNGLE',		0,			0		),
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	'MODTYPE_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	NULL,					'REQSET_MODERN_INFANTRY_PLOT_IS_FOREST',		0,			0		);
		-- This one has a ReqSetID which means that it identifies for this modifier to run - it needs a requirement.

-----------------------------------------------
-- UnitAbilityModifiers

-- These setup the modifers for your ability by hooking your specified modifiers into the ability.
-- "UnitAbilityType" is the Unit's Ability to which you are inserting the "ModifierID", or the modifier, into.
-----------------------------------------------
		
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,							ModifierId												)
VALUES	('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',	'MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS'		), -- Inserting the "More Strength on Hills Tiles" Modifier
		('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',	'MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE'	), -- Inserting the "More Strength in Rainforest Tiles" Modifier
		('ABILITY_MODERN_INFANTRY_RUGGED_STRENGTH',	'MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST'	); -- Inserting the "More Strength in Forest Tiles" Modifier

-----------------------------------------------
-- ModifierArguments

-- This is where we further define the Modifiers.
-----------------------------------------------

INSERT INTO	ModifierArguments		
		(ModifierId,											Name,		Value	)
VALUES	('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',	'Amount',	5		), -- States that you adjust the strength by 5.
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	'Amount',	5		), -- States that you adjust the strength by 5.
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	'Amount',	5		); -- States that you adjust the strength by 5.

-----------------------------------------------
-- ModifierStrings

-- This is where we are going to link the Localisation to the Unit's Ability
-----------------------------------------------

INSERT INTO ModifierStrings
        (ModifierId,											Context,	Text														)
VALUES  ('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS',	'Preview',	'LOC_MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_ON_HILLS'		),
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE',	'Preview',	'LOC_MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_JUNGLE'	),
		('MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST',	'Preview',	'LOC_MODIFIER_MODERN_INFANTRY_ADJUST_STRENGTH_IN_FOREST'	);
		-- Links the Unit to display his ability's text.

-----------------------------------------------
-- Requirements

-- This is where you define your Requirements
-----------------------------------------------

INSERT INTO Requirements
		(RequirementId,							RequirementType,				Likeliness,   Inverse,   Triggered)
--VALUES	('REQ_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
VALUES	('REQ_MODERN_INFANTRY_PLOT_IS_DESERT_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_PLAINS_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_GRASS_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_TUNDRA_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_SNOW_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Terrain) tile. -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_JUNGLE',	'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',	0,  0,  0			), -- Defines the Requirement as whenever you're in a (Feature) tile.
		('REQ_MODERN_INFANTRY_PLOT_IS_FOREST',	'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',	0,  0,  0			); -- Defines the Requirement as whenever you're in a (Feature) tile.
	
-------------------------------------
-- RequirementArguments
-------------------------------------

INSERT INTO RequirementArguments
		(RequirementId, 						Name,			Value 				)
--VALUES	('REQ_MODERN_INFANTRY_PLOT_IS_HILLS', 	'TerrainType',	'TERRAIN_HILLS'		), -- CUSTOM
VALUES	('REQ_MODERN_INFANTRY_PLOT_IS_DESERT_HILLS', 	'TerrainType',	'TERRAIN_DESERT_HILLS'		), -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_PLAINS_HILLS', 	'TerrainType',	'TERRAIN_PLAINS_HILLS'		), -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_GRASS_HILLS', 	'TerrainType',	'TERRAIN_GRASS_HILLS'		), -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_TUNDRA_HILLS', 	'TerrainType',	'TERRAIN_TUNDRA_HILLS'		), -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_SNOW_HILLS', 	'TerrainType',	'TERRAIN_SNOW_HILLS'		), -- CUSTOM
		('REQ_MODERN_INFANTRY_PLOT_IS_JUNGLE',	'FeatureType',	'FEATURE_JUNGLE'	),
		('REQ_MODERN_INFANTRY_PLOT_IS_FOREST', 	'FeatureType',	'FEATURE_FOREST'	);

--TERRAIN_DESERT_HILLS
--TERRAIN_PLAINS_HILLS
--TERRAIN_GRASS_HILLS
--TERRAIN_TUNDRA_HILLS
--TERRAIN_SNOW_HILLS

-----------------------------------------------
-- RequirementSets

-- This is where you define your Requirement Set
-----------------------------------------------

INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType			)
--VALUES	('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQUIREMENTSET_TEST_ALL'	), -- CUSTOM
VALUES	('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQUIREMENTSET_TEST_ANY'	), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_JUNGLE',	'REQUIREMENTSET_TEST_ALL'	),
		('REQSET_MODERN_INFANTRY_PLOT_IS_FOREST',	'REQUIREMENTSET_TEST_ALL'	);
		-- Defines the ReqSet.

-----------------------------------------------
-- RequirementSetRequirements

-- This is where you link your RequirementSet to your actual RequirementIDs
-----------------------------------------------

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId							)
--VALUES	('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_HILLS'		), -- CUSTOM
VALUES	('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_DESERT_HILLS'		), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_PLAINS_HILLS'		), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_GRASS_HILLS'		), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_TUNDRA_HILLS'		), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_HILLS',	'REQ_MODERN_INFANTRY_PLOT_IS_SNOW_HILLS'		), -- CUSTOM
		('REQSET_MODERN_INFANTRY_PLOT_IS_JUNGLE',	'REQ_MODERN_INFANTRY_PLOT_IS_JUNGLE'	),
		('REQSET_MODERN_INFANTRY_PLOT_IS_FOREST',	'REQ_MODERN_INFANTRY_PLOT_IS_FOREST'	);
		-- Defines the ReqSet by linking it to a RequirmentID
