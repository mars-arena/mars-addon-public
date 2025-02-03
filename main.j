//! nocjass
//! zinc

	// engine

	//! import vjass    "mars-addon/config/origin/header.j"
	//! import zinc     "mars-addon/config/origin/constants.zn"

	//! import vjass    "mars-addon/engine/functions/CoordUtils.j"
	//! import zinc     "mars-addon/engine/functions/GameUtils.zn"
	//! import vjass    "mars-addon/engine/functions/TechUtils.j"
	//! import zinc     "mars-addon/engine/functions/TexttagUtils.zn"

	//! import zinc     "mars-addon/engine/hashtable/HashCleaner.zn"
	//! import zinc     "mars-addon/engine/hashtable/HashId.zn"

	//! import vjass    "mars-addon/engine/libraries/Armor.j"
	//! import vjass    "mars-addon/engine/libraries/Math.j"
	//! import vjass    "mars-addon/engine/libraries/NegateDamage.j"
	//! import vjass    "mars-addon/engine/libraries/SetUnitMaxState.j"
	//! import vjass    "mars-addon/engine/libraries/UnitDamaged.j"
	//! import vjass    "mars-addon/engine/libraries/UnitUnstuck.j"
	//! import zinc     "mars-addon/engine/libraries/Debug.zn"
	//! import zinc     "mars-addon/engine/libraries/Parabolas.zn"
	//! import zinc     "mars-addon/engine/libraries/Points.zn"
	//! import zinc     "mars-addon/engine/libraries/Rectangle.zn"
	//! import zinc     "mars-addon/engine/libraries/Attachment.zn"
	//! import zinc     "mars-addon/engine/libraries/JumpToPoint.zn"
	//! import zinc     "mars-addon/engine/libraries/FloatingText.zn"
	//! import zinc     "mars-addon/engine/libraries/Vector.zn"
	//! import zinc     "mars-addon/engine/libraries/VectorAPI.zn"
//	//!  import vjass    "mars-addon/engine/libraries/AntiMH.j"

	//! import zinc     "mars-addon/engine/systems/AreaSpells.zn"
	//! import zinc     "mars-addon/engine/systems/Auras.zn"
	//! import zinc     "mars-addon/engine/systems/Buffs.zn"
	//! import zinc     "mars-addon/engine/systems/Damage.zn"
	//! import zinc     "mars-addon/engine/systems/Heroes.zn"
	//! import zinc     "mars-addon/engine/systems/Modifiers.zn"
	//! import zinc     "mars-addon/engine/systems/MultiModifiers.zn"
	//! import zinc     "mars-addon/engine/systems/StaticProjectiles.zn"
	//! import zinc     "mars-addon/engine/systems/Stuns.zn"
	//! import zinc     "mars-addon/engine/systems/SpellGetters.zn"
	//! import zinc     "mars-addon/engine/systems/Events.zn"
	//! import zinc     "mars-addon/engine/systems/DynamicProjectiles.zn"
	//! import zinc     "mars-addon/engine/systems/Illusions.zn"
	//! import zinc     "mars-addon/engine/systems/Crystal.zn"

	// mars

	//! import zinc     "mars-addon/mars/auras/AurasActions.zn"
	//! import zinc     "mars-addon/mars/auras/AurasFilters.zn"
	//! import zinc     "mars-addon/mars/auras/AurasTypes.zn"

	//! import zinc     "mars-addon/mars/buffs/BuffActions.zn"
	//! import zinc     "mars-addon/mars/buffs/BuffFilters.zn"
	//! import zinc     "mars-addon/mars/buffs/BuffTypes.zn"

	//! import zinc     "mars-addon/mars/keys/HashIdGUI.zn"

	//! import zinc     "mars-addon/mars/modifiers/ModifiersList.zn"
	//! import zinc     "mars-addon/mars/modifiers/MultiModifiersList.zn"
	//! import zinc     "mars-addon/mars/modifiers/DodgeStaticModifiers.zn"
	//! import zinc     "mars-addon/mars/modifiers/PrecedingStaticModifiers.zn"
	//! import zinc     "mars-addon/mars/modifiers/UniqueStaticModifiers.zn"
	//! import zinc     "mars-addon/mars/modifiers/PostStaticModifiers.zn"

	//! import zinc     "mars-addon/mars/spells/heroes/Arthas/ArthasJump.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Arthas/ArthasDome.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Hort.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Stanley/StanleyMissiles.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Stanley/StanleyPiro.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Witcher.zn"
	//! import vjass    "mars-addon/mars/spells/heroes/Wisp.j"
	//! import vjass    "mars-addon/mars/spells/heroes/Wormy.j"
	//! import vjass    "mars-addon/mars/spells/heroes/Nomi.j"
	//! import vjass    "mars-addon/mars/spells/heroes/Hope.j"
	//! import zinc     "mars-addon/mars/spells/heroes/Gordon.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/James.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Fox.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Forg.zn"
//	//! import zinc     "mars-addon/mars/spells/heroes/DebugSpell.zn"
	//! import zinc     "mars-addon/mars/spells/heroes/Anna.zn"
	
	//! import zinc     "mars-addon/mars/spells/items/HiruzenSpear.zn"

	//! import zinc     "mars-addon/mars/spells/others/ChainHeal.zn"
	//! import zinc     "mars-addon/mars/spells/others/ChainLightning.zn"
	//! import zinc     "mars-addon/mars/spells/others/Chakram.zn"
	//! import zinc     "mars-addon/mars/spells/others/Doubles.zn"
	//! import zinc     "mars-addon/mars/spells/others/Hammer.zn"
	//! import zinc     "mars-addon/mars/spells/others/Lightning.zn"
	//! import zinc     "mars-addon/mars/spells/others/RectangleSplash.zn"
	//! import zinc     "mars-addon/mars/spells/others/CliffMiss.zn"

	//! import zinc     "mars-addon/mars/spells/Filters.zn"
	//! import zinc     "mars-addon/mars/spells/SpellsTypes.zn"

	// test
//	//! import zinc     "mars-addon/engine/tests/AurasTest.zn"

//! endzinc
//! endnocjass