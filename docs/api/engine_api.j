	//===================================
	//=========== AREA SPELLS ===========
	type AreaSpell extends integer

	//==================================
	//=========== ATTACHMENT ===========
	type Attachment extends integer

	//=============================
	//=========== AURAS ===========
	type Aura extends integer

	//=============================
	//=========== BUFFS ===========
	type Buff extends integer

	//==============================
	//=========== DAMAGE ===========
	type DamageEvent extends integer

	//===========================================
	//=========== DYNAMIC PROJECTILES ===========
	type DynamicProjectile extends integer

	//==============================
	//=========== EVENTS ===========
	type DebugEventBuilder extends integer
	type Event extends integer

	//=================================
	//=========== ILLUSIONS ===========

	// Instance Structure
	type Illusion extends integer

	//==========================================
	//=========== STATIC PROJECTILES ===========
	type StaticProjectile extends integer

	//======================================
	//=========== SUMMATIVE TEXT ===========
	type SummativeText extends integer

	//=================================
	//=========== UNIT DATA ===========
	type UnitData extends integer
	type ArrowData extends integer
	type RegenerationData extends integer

	//=================================
	//=========== PARABOLAS ===========
	type Parabola extends integer

	//==============================
	//=========== POINTS ===========
	type Point2D extends integer

	//=================================
	//=========== RECTANGLE ===========
	type Rectangle extends integer

	//==============================
	//=========== VECTOR ===========
	type Vec2 extends integer
	type Vec3 extends integer

	//===============================
	//=========== DOUBLES ===========
	type Doubles extends integer
	type Double extends integer

	//============================
	//=========== ANNA ===========
	type Arrows extends integer

	//========================================
	//=========== STANLEY MISSILES ===========
	type StanleyE extends integer

	//===============================
	//=========== WITCHER ===========
	type Traces extends integer


globals
	//=================================
	//=========== CONSTANTS ===========

	// максимальное количество игроков
	constant integer MAX_PLAYERS = 16

	// DamageEventEngine
	constant integer BUFF_1_ID = 'B06H'
	constant integer BUFF_2_ID = 'B06I'
	constant integer BUFF_S1_ID = 'B02P'
	constant integer BUFF_S2_ID = 'sat2'

	// NegateDamage
	constant integer MAX_LIFE_BONUS_ABILITY = 'A08F'

	// AntiMH
	// public constant rect ANTI_MH_RECT = gg_rct________________038;
	constant integer ANTI_MH_UNIT_ID = 'h00R'

	// StunSystem
	constant integer STUN_ABILITY_ID = 'A21Y'
	constant integer STUN_BUFF_ID = 'B08Q'
	constant integer IMMUN_STUN_ABILITY_ID = 'A1S0'

	// Illusions
	constant integer ILLUSION_ABILITY_ID = 'A1GP'

	// Invulnerability
	constant integer INVUL_ABILITY_ID = 'A22H'

	// Disarm
	constant integer DISARM_BUFF_ID = 'A1YH'

	// ModifierEngine
	constant real INC_OUT_HEAL_BY_INT = 0.000
	constant real INC_ENTER_HEAL_BY_STR = 0.000
	constant real INC_LIFESTEAL_BY_STR = 0.001

	// TechUtils
	constant integer INV_ID = 'AInv'

	// Hex
	constant integer MAX_HEXES = 2
	constant integer HEX_FROG_ABILITY_ID = 'A01Y'
	constant integer HEX_FROG_BUFF_ID = 'BOhx'
	constant integer HEX_SNOWMAN_ABILITY_ID = 'A0QY'
	constant integer HEX_SNOWMAN_BUFF_ID = 'B028'

	// даммики
	constant integer DUMMY_EFF_ID = 'h00O'
	constant integer DUMMY_ID = 'h00N'
	constant integer DUMMY_ATC_ID = 'o00Z'
	constant integer DUMMY_VSN_300 = 'e001'
	constant integer DUMMY_VSN_500 = 'e02E'
	constant integer DUMMY_VSN_500l = 'e04O'
	constant integer DUMMY_VSN_600 = 'e03F'
	constant integer MEFISTO_ID = 'B04D'

	//==============================
	//=========== HEADER ===========
	constant unit TempUnit = undefined
	constant real TempX = undefined
	constant real TempY = undefined
	constant timer TempTimer = undefined
	constant group TempGroup = undefined
	constant trigger TempTrigger = undefined
	constant integer Index = undefined
	constant integer This = undefined
	constant integer AbilityID = undefined
	constant unit FilterUnit = undefined
	constant unit TriggerUnit = undefined
	constant unit EnumUnit = undefined
	constant unit ReturnedUnit = undefined
	constant unit FilteredUnit = undefined
	constant boolean WantDelay = false

	// deprecated
	constant integer SplashType = 0
	constant real SplashChance = 0
	constant real SplashPercent = 0
	constant real SplashRadius = 0
	constant real SplashAngle = 0
	constant integer dummyEffId = 'h00O'
	constant integer dummyId = 'h00N'
	constant integer dummyAtcId = 'o00Z'
	constant integer IntTemp = undefined
	constant group GroupTemp = CreateGroup()
	constant group bGroup = CreateGroup()
	constant group retGroup = undefined
	constant group tGroup = undefined
	constant unit bUnit = undefined
	constant unit bUnit01 = undefined
	constant unit bUnit02 = undefined
	constant unit bUnit03 = undefined
	constant real bReal = undefined
	constant real bReal01 = undefined
	constant real bReal02 = undefined
	constant real bReal03 = undefined
	constant real bReal04 = undefined
	constant real bX = undefined
	constant real bY = undefined
	constant integer bInt = undefined
	constant integer bInt01 = undefined
	constant integer bInt02 = undefined
	constant integer iS = undefined
	constant integer iE = undefined
	constant boolexpr bFilter = undefined
	constant region bRegion = CreateRegion()
	constant item bItem = undefined
	constant timer bTimer = undefined
	constant unit CasterUnit = undefined
	constant unit OwnerUnit = undefined
	constant unit TargetUnit = undefined
	constant real Value = undefined
	constant integer ActionsId = undefined
	constant integer BuffId = undefined
	constant timer BuffStack = undefined
	constant real TIMER_PERIOD = 0.03125

	//==================================
	//=========== ATTACHMENT ===========
	constant Attachment TempAttachment = undefined

	//====================================
	//=========== ATTACK SPEED ===========

	// Событие модификатора скорости боя
	//
	// GetASUnit() -> unit
	// GetASBonus() -> real
	// GetASPenalty() -> real
	// GetASIncrease() -> real
	// GetASDecrease() -> real
	// AddASBonus(real asBonus)
	// AddASPenalty(real asPenalty)
	// AddASIncrease(real asIncrease)
	// AddASDecrease(real asDecrease)
	// SetASBonus(real asBonus)
	// SetASPenalty(real asPenalty)
	// SetASIncrease(real asIncrease)
	// SetASDecrease(real asDecrease)
	constant Event EVENT_ATTACK_SPEED = undefined

	//=============================
	//=========== AURAS ===========
	constant Aura TempAura = undefined

	// Событие ауры
	//
	// GetAuraOwnerUnit() -> unit
	// GetAuraTargetUnit() -> unit
	// IsAuraEntered() -> boolean
	// IsAuraOut() -> boolean
	// IsAuraActions() -> boolean
	// GetAuraActionsId() -> integer
	constant Event EVENT_AURA = undefined

	//=============================
	//=========== BUFFS ===========
	constant Buff TempBuff = undefined

	// Событие баффа
	//
	// GetTriggerBuffOwner() -> unit
	// GetTriggerBuffTarget() -> unit
	// GetTriggerBuffIsEntered() -> boolean
	// GetTriggerBuffIsOut() -> boolean
	// GetTriggerBuffIsActions() -> boolean
	// GetTriggerBuffIsTransfer() -> boolean
	// GetTriggerBuffActionsId() -> integer
	// GetTriggerBuffId() -> integer
	// GetTriggerBuffStack() -> timer
	constant Event EVENT_BUFF = undefined
	constant boolean FILTER_BOOLEAN_GET = undefined

	//==============================
	//=========== COMBAT ===========

	// Событие при входе или выходе юнита из боя
	//
	// GetCombatUnit() -> unit
	// IsCombatEntering() -> boolean
	// IsCombatLeaving() -> boolean
	constant Event EVENT_COMBAT = undefined

	//==============================
	//=========== DAMAGE ===========
	constant boolean DebugDmg = false
	constant DamageEvent TempDamage = 0

	// @const максимальное количество типов cтакающегося урона
	constant integer MAX_COUNT_TYPE_AMPLIFIERS = 5

	// @const типы мультипликаторов текста
	constant integer ATTACK_AMPLIFIER = 1
	constant integer SIMPLE_AMPLIFIER = 2
	constant integer DAMAGE_MULTIPLIER = 3
	constant integer AMPLIFIER_4 = 4
	constant integer AMPLIFIER_5 = 5

	// Событие модификатора уворота
	//
	// AddModifierDodgeChance(real dodgeChance)
	// AddModifierMissChance(real missChance)
	// AddModifierTrueStrikeChance(real trueStrikeChance)
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// GetModifierDodgeChance() -> real
	// GetModifierMissChance() -> real
	// GetModifierTrueStrikeChance() -> real
	// IsModifierAttack() -> boolean
	// SetModifierDodgeChance(real dodgeChance)
	// SetModifierMissChance(real missChance)
	// SetModifierTrueStrikeChance(real trueStrikeChance)
	constant Event EVENT_DODGE_MODIFIER = undefined

	// Событие предществующего модификатора урона
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// AddModifierPierceRate(real pierceRate)
	// GetModifierPierceRate() -> real
	// SetModifierPierceRate(real pierceRate)
	// SetModifierPierceType(integer pierceType)
	//
	// AddModifierDMGAdd(real dmgAdd)
	// GetModifierDMGAdd() -> real
	// SetModifierDMGAdd(real dmgAdd)
	//
	// AddModifierDMGAmplifier(integer typeAmplifier, real dmgAmplifier)
	// GetModifierDMGAmplifier(integer typeAmplifier) -> real
	// SetModifierDMGAmplifier(integer typeAmplifier, real dmgAmplifier)
	constant Event EVENT_PRECEDING_MODIFIER = undefined

	// Событие уникальных модификаторов (работает один из)
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// AddModifierBash(integer typeId, real bashDamage, real duration)
	// AddModifierCriticalDamage(integer typeId, real criticalDamage)
	// AddModifierCriticalRate(integer typeId, real criticalRate)
	// GetModifierCriticalType() -> integer
	// PlusModifierCriticalRate(real criticalRate)
	constant Event EVENT_UNIQUE_MODIFIER = undefined

	// Событие пост модификатора урона
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierCritical() -> boolean
	// IsModifierDodge() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// GetBlockedFromAmount(real amount) -> real
	//
	// GetModifierDamageGiven() -> real
	// SetModifierDamageGiven(real dmgGiven)
	//
	// GetModifierDamageTaken() -> real
	// SetModifierDamageTaken(real dmgTaken)
	//
	// GetModifierDamageMax() -> real
	// SetModifierDamageMax(real dmgMax)
	//
	// GetModifierArmorReduction();
	constant Event EVENT_POST_MODIFIER_INDEX_DAMAGE = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_PERCENT = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_AMOUNT = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_PASS = undefined

	// Событие любого урона
	//
	// GetDamageAttackedUnit() -> unit
	// GetDamageAttackingUnit() -> unit
	// GetDamageBash() -> real
	// GetDamageBashDuration() -> real
	// GetDamageBlocked() -> real
	// GetDamageGiven() -> real
	// GetDamageIgnoreBlock() -> boolean
	// GetDamageIsAttack() -> boolean
	// GetDamageIsBlocked() -> boolean
	// GetDamageIsCritical() -> boolean
	// GetDamageIsDodge() -> boolean
	// GetDamageIsMagical() -> boolean
	// GetDamageIsNoRepeat() -> boolean
	// GetDamageIsPhysical() -> boolean
	// GetDamageIsPure() -> boolean
	// GetDamageIsReflection() -> boolean
	// GetDamageIsSimulate() -> boolean
	// GetDamageIsSpecAttack() -> boolean
	// GetDamageLifeAttackedUnit() -> real
	constant Event EVENT_DAMAGE = undefined

	// Событие смерти юнита
	//
	// GetDeathKillingUnit() -> unit
	// GetDeathKilledUnit() -> unit
	constant Event EVENT_DEATH = undefined

	//==============================
	//=========== EVENTS ===========
	constant Event EVENT_NATIVE_GAME_VICTORY = GetHandleId(EVENT_GAME_VICTORY)
	constant Event EVENT_NATIVE_GAME_END_LEVEL = GetHandleId(EVENT_GAME_END_LEVEL)
	constant Event EVENT_NATIVE_GAME_STATE_LIMIT = GetHandleId(EVENT_GAME_STATE_LIMIT)
	constant Event EVENT_NATIVE_GAME_TIMER_EXPIRED = GetHandleId(EVENT_GAME_TIMER_EXPIRED)
	constant Event EVENT_NATIVE_GAME_ENTER_REGION = GetHandleId(EVENT_GAME_ENTER_REGION)
	constant Event EVENT_NATIVE_GAME_LEAVE_REGION = GetHandleId(EVENT_GAME_LEAVE_REGION)
	constant Event EVENT_NATIVE_GAME_TRACKABLE_HIT = GetHandleId(EVENT_GAME_TRACKABLE_HIT)
	constant Event EVENT_NATIVE_GAME_TRACKABLE_TRACK = GetHandleId(EVENT_GAME_TRACKABLE_TRACK)
	constant Event EVENT_NATIVE_GAME_SHOW_SKILL = GetHandleId(EVENT_GAME_SHOW_SKILL)
	constant Event EVENT_NATIVE_GAME_BUILD_SUBMENU = GetHandleId(EVENT_GAME_BUILD_SUBMENU)
	constant Event EVENT_NATIVE_ALLIANCE_CHANGED = GetHandleId(EVENT_PLAYER_ALLIANCE_CHANGED)
	constant Event EVENT_NATIVE_DEFEAT = GetHandleId(EVENT_PLAYER_DEFEAT)
	constant Event EVENT_NATIVE_VICTORY = GetHandleId(EVENT_PLAYER_VICTORY)
	constant Event EVENT_NATIVE_LEAVE = GetHandleId(EVENT_PLAYER_LEAVE)
	constant Event EVENT_NATIVE_END_CINEMATIC = GetHandleId(EVENT_PLAYER_END_CINEMATIC)
	constant Event EVENT_NATIVE_UNIT_ATTACKED = GetHandleId(EVENT_PLAYER_UNIT_ATTACKED)
	constant Event EVENT_NATIVE_UNIT_RESCUED = GetHandleId(EVENT_PLAYER_UNIT_RESCUED)
	constant Event EVENT_NATIVE_UNIT_DEATH = GetHandleId(EVENT_PLAYER_UNIT_DEATH)
	constant Event EVENT_NATIVE_UNIT_DECAY = GetHandleId(EVENT_PLAYER_UNIT_DECAY)
	constant Event EVENT_NATIVE_UNIT_DETECTED = GetHandleId(EVENT_PLAYER_UNIT_DETECTED)
	constant Event EVENT_NATIVE_UNIT_HIDDEN = GetHandleId(EVENT_PLAYER_UNIT_HIDDEN)
	constant Event EVENT_NATIVE_UNIT_SELECTED = GetHandleId(EVENT_PLAYER_UNIT_SELECTED)
	constant Event EVENT_NATIVE_UNIT_DESELECTED = GetHandleId(EVENT_PLAYER_UNIT_DESELECTED)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_START = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_START)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_FINISH = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_START = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_START)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_FINISH = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	constant Event EVENT_NATIVE_UNIT_TRAIN_START = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_START)
	constant Event EVENT_NATIVE_UNIT_TRAIN_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_CANCEL)
	constant Event EVENT_NATIVE_UNIT_TRAIN_FINISH = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_FINISH)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_START = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_START)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_CANCEL)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_FINISH = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_FINISH)
	constant Event EVENT_NATIVE_UNIT_ISSUED_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_POINT_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_TARGET_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_UNIT_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER)
	constant Event EVENT_NATIVE_HERO_LEVEL = GetHandleId(EVENT_PLAYER_HERO_LEVEL)
	constant Event EVENT_NATIVE_HERO_SKILL = GetHandleId(EVENT_PLAYER_HERO_SKILL)
	constant Event EVENT_NATIVE_HERO_REVIVABLE = GetHandleId(EVENT_PLAYER_HERO_REVIVABLE)
	constant Event EVENT_NATIVE_HERO_REVIVE_START = GetHandleId(EVENT_PLAYER_HERO_REVIVE_START)
	constant Event EVENT_NATIVE_HERO_REVIVE_CANCEL = GetHandleId(EVENT_PLAYER_HERO_REVIVE_CANCEL)
	constant Event EVENT_NATIVE_HERO_REVIVE_FINISH = GetHandleId(EVENT_PLAYER_HERO_REVIVE_FINISH)
	constant Event EVENT_NATIVE_UNIT_SUMMON = GetHandleId(EVENT_PLAYER_UNIT_SUMMON)
	constant Event EVENT_NATIVE_UNIT_DROP_ITEM = GetHandleId(EVENT_PLAYER_UNIT_DROP_ITEM)
	constant Event EVENT_NATIVE_UNIT_PICKUP_ITEM = GetHandleId(EVENT_PLAYER_UNIT_PICKUP_ITEM)
	constant Event EVENT_NATIVE_UNIT_USE_ITEM = GetHandleId(EVENT_PLAYER_UNIT_USE_ITEM)
	constant Event EVENT_NATIVE_UNIT_LOADED = GetHandleId(EVENT_PLAYER_UNIT_LOADED)
	constant Event EVENT_NATIVE_GAME_LOADED = GetHandleId(EVENT_GAME_LOADED)
	constant Event EVENT_NATIVE_GAME_TOURNAMENT_FINISH_SOON = GetHandleId(EVENT_GAME_TOURNAMENT_FINISH_SOON)
	constant Event EVENT_NATIVE_GAME_TOURNAMENT_FINISH_NOW = GetHandleId(EVENT_GAME_TOURNAMENT_FINISH_NOW)
	constant Event EVENT_NATIVE_GAME_SAVE = GetHandleId(EVENT_GAME_SAVE)
	constant Event EVENT_NATIVE_ARROW_LEFT_DOWN = GetHandleId(EVENT_PLAYER_ARROW_LEFT_DOWN)
	constant Event EVENT_NATIVE_ARROW_LEFT_UP = GetHandleId(EVENT_PLAYER_ARROW_LEFT_UP)
	constant Event EVENT_NATIVE_ARROW_RIGHT_DOWN = GetHandleId(EVENT_PLAYER_ARROW_RIGHT_DOWN)
	constant Event EVENT_NATIVE_ARROW_RIGHT_UP = GetHandleId(EVENT_PLAYER_ARROW_RIGHT_UP)
	constant Event EVENT_NATIVE_ARROW_DOWN_DOWN = GetHandleId(EVENT_PLAYER_ARROW_DOWN_DOWN)
	constant Event EVENT_NATIVE_ARROW_DOWN_UP = GetHandleId(EVENT_PLAYER_ARROW_DOWN_UP)
	constant Event EVENT_NATIVE_ARROW_UP_DOWN = GetHandleId(EVENT_PLAYER_ARROW_UP_DOWN)
	constant Event EVENT_NATIVE_ARROW_UP_UP = GetHandleId(EVENT_PLAYER_ARROW_UP_UP)
	constant Event EVENT_NATIVE_UNIT_SELL = GetHandleId(EVENT_PLAYER_UNIT_SELL)
	constant Event EVENT_NATIVE_UNIT_CHANGE_OWNER = GetHandleId(EVENT_PLAYER_UNIT_CHANGE_OWNER)
	constant Event EVENT_NATIVE_UNIT_SELL_ITEM = GetHandleId(EVENT_PLAYER_UNIT_SELL_ITEM)
	constant Event EVENT_NATIVE_UNIT_SPELL_CHANNEL = GetHandleId(EVENT_PLAYER_UNIT_SPELL_CHANNEL)
	constant Event EVENT_NATIVE_UNIT_SPELL_CAST = GetHandleId(EVENT_PLAYER_UNIT_SPELL_CAST)
	constant Event EVENT_NATIVE_UNIT_SPELL_EFFECT = GetHandleId(EVENT_PLAYER_UNIT_SPELL_EFFECT)
	constant Event EVENT_NATIVE_UNIT_SPELL_FINISH = GetHandleId(EVENT_PLAYER_UNIT_SPELL_FINISH)
	constant Event EVENT_NATIVE_UNIT_SPELL_ENDCAST = GetHandleId(EVENT_PLAYER_UNIT_SPELL_ENDCAST)
	constant Event EVENT_NATIVE_UNIT_PAWN_ITEM = GetHandleId(EVENT_PLAYER_UNIT_PAWN_ITEM)

	// Cобытие входа в карту (игнорирует дамми-юниты)
	//
	// GetTriggerUnit() -> unit
	constant Event EVENT_ENTER = undefined
	constant DebugEventBuilder DebugEvent = undefined

	//===============================
	//=========== FATIGUE ===========
	constant real FATIGUE_MAX = 1.0

	// Событие при изменении уровня усталости юнита
	//
	// GetFatigueUnit() -> unit
	constant Event EVENT_FATIGUE_CHANGE = undefined

	//============================
	//=========== GOLD ===========

	// Событие модификатора золота
	// GetGoldModifierBonus() -> real
	// GetGoldModifierPenalty() -> real
	// GetGoldModifierIncrease() -> real
	// GetGoldModifierDecrease() -> real
	// AddGoldModifierBonus(real goldBonus)
	// AddGoldModifierPenalty(real goldPenalty)
	// AddGoldModifierIncrease(real goldIncrease)
	// AddGoldModifierDecrease(real goldDecrease)
	// GetGoldPlayer() -> player
	// GetGoldSourceUnit() -> unit
	constant Event EVENT_GOLD_MODIFIER = undefined

	// GetGoldPlayer() -> player
	// GetGoldSourceUnit() -> unit
	// GetGoldAmount() -> real
	constant Event EVENT_GOLD = undefined

	//==============================================
	//=========== HEAL LIFESTEAL RESTORE ===========
	constant Event EVENT_HEAL_MODIFIER = undefined
	constant Event EVENT_HEAL = undefined
	constant Event EVENT_LIFESTEAL_MODIFIER = undefined
	constant Event EVENT_LIFESTEAL = undefined
	constant Event EVENT_RESTORE_MODIFIER = undefined
	constant Event EVENT_RESTORE = undefined

	// Debug Variables
	constant boolean DebugHeal = false

	//==============================
	//=========== HEROES ===========

	// Debug Variables
	constant boolean DebugHero = false

	//=================================
	//=========== ILLUSIONS ===========
	constant Illusion TempIllusion = undefined

	//==================================
	//=========== MOVE SPEED ===========

	// Событие модификатора скорости перемешения
	//
	// GetMSUnit() -> unit
	// GetMSBonus() -> real
	// GetMSPenalty() -> real
	// GetMSIncrease() -> real
	// GetMSDecrease() -> real
	// GetMSMinCap() -> real
	// GetMSMaxCap() -> real
	// GetMSSlowResist() -> real
	// AddMSBonus(real v)
	// AddMSPenalty(real v)
	// AddMSIncrease(real v)
	// AddMSDecrease(real v)
	// AddMSSlowResist(real v)
	// AddMSCap(real cap, boolean isMin)
	constant Event EVENT_MOVE_SPEED = undefined

	//=======================================
	//=========== MULTI MODIFIERS ===========
	constant integer TypeMod = undefined
	constant real ValueMod2 = undefined
	constant real ValueMod3 = undefined
	constant real ValueMod4 = undefined
	constant real ValueMod5 = undefined
	constant real ValueMod6 = undefined

	//==============================
	//=========== PICKUP ===========

	// Событие получения предмета
	//
	// GetPickedUpUnit() -> unit
	// GetPickingUnit() -> unit
	constant Event EVENT_PICK_UP = undefined

	//====================================
	//=========== REGENERATION ===========

	// Событие модификатора регенерации здоровья
	//
	// GetRegenModifierUnit() -> unit
	// GetRegenModifierFlat() -> real
	// GetRegenModifierPenalty() -> real
	// GetRegenModifierIncrease() -> real
	// GetRegenModifierDecrease() -> real
	// AddRegenModifierFlat(real regenFlat)
	// AddRegenModifierPenalty(real regenPenalty)
	// AddRegenModifierIncrease(real regenIncrease)
	// AddRegenModifierDecrease(real regenDecrease)
	// SetRegenModifierFlat(real regenFlat)
	// SetRegenModifierPenalty(real regenPenalty)
	// SetRegenModifierIncrease(real regenIncrease)
	// SetRegenModifierDecrease(real regenDecrease)
	constant Event EVENT_HP_REGENERATION_MODIFIER = undefined

	// Событие регенерации здоровья
	//
	// GetRegenUnit() -> unit
	// GetRegenValue() -> real
	constant Event EVENT_HP_REGENERATION = undefined

	// Событие модификатора регенерации маны
	//
	// GetRegenModifierUnit() -> unit
	// GetRegenModifierFlat() -> real
	// GetRegenModifierPenalty() -> real
	// GetRegenModifierIncrease() -> real
	// GetRegenModifierDecrease() -> real
	// AddRegenModifierFlat(real regenFlat)
	// AddRegenModifierPenalty(real regenPenalty)
	// AddRegenModifierIncrease(real regenIncrease)
	// AddRegenModifierDecrease(real regenDecrease)
	// SetRegenModifierFlat(real regenFlat)
	// SetRegenModifierPenalty(real regenPenalty)
	// SetRegenModifierIncrease(real regenIncrease)
	// SetRegenModifierDecrease(real regenDecrease)
	constant Event EVENT_MP_REGENERATION_MODIFIER = undefined

	// Событие регенерации маны
	//
	// GetRegenUnit() -> unit
	// GetRegenValue() -> real
	constant Event EVENT_MP_REGENERATION = undefined

	//=====================================
	//=========== SPELL GETTERS ===========

	// событие заклинаний
	constant string TRIG_EVENT_SPELLS = "EventSpells"

	// Getters Variables
	constant integer SPELL_OBJECT_GET = 0
	constant unit SPELL_OWNER_UNIT_GET = null
	constant unit SPELL_DUMMY_UNIT_GET = null
	constant unit SPELL_TARGET_UNIT_GET = null
	constant boolean SPELL_IS_ENTERED_GET = false
	constant boolean SPELL_IS_OUT_GET = false
	constant integer SPELL_ACTIONS_ID_GET = 0
	constant real SPELL_COMPLETION_GET = 0
	constant integer SPELL_COUNT_TARGETS_GET = 0
	constant boolean SPELL_IS_FOCUSED_GET = false
	constant real SPELL_X_GET = 0
	constant real SPELL_Y_GET = 0
	constant boolean SPELL_IS_BOUNCE_GET = false
	constant boolean SPELL_IS_STOPPED_GET = false
	constant boolean SPELL_IS_COLLIDE_GET = false

	//=============================
	//=========== STUNS ===========

	// Событие оглушения юнита
	//
	// GetTriggerStun() -> Stun
	// GetStunningUnit() -> unit
	// GetStunnedUnit() -> unit
	// GetStunTypeId() -> integer
	// GetStunDuration() -> real
	// GetStunIsEnter() -> boolean
	// GetStunIsOut() -> boolean
	// GetStunIsFirst() -> boolean
	constant Event EVENT_STUN = undefined

	// @const идентификаторы типов оглушения
	constant integer NORMAL_STUN = 1
	constant integer LOST_CONTROL_STUN = 2
	constant integer FROST_STUN = 3
	constant integer CHAINS_STUN = 4
	constant integer AQUA_STUN = 5
	constant integer STANLEY_STUN = 6
	constant integer GOLD_STUN = 7
	constant integer ILLIDAN_STUN = 8
	constant integer BOLA_STUN = 9
	constant integer ARTHAS_STUN = 10

	// Debug Variables
	constant boolean DebugStun = false

	//======================================
	//=========== SUMMATIVE TEXT ===========

	// @const плавающий текст урона будет работать для юнитов
	constant boolean FLOATING_DMG_ON_UNITS = true

	// @const настройки критического текста
	constant real CRITICAL_INIT_SIZE = 9.
	constant real CRITICAL_BONUS_SIZE = 4.25
	constant real CRITICAL_TIME_LIFE = 1.
	constant real CRITICAL_TIME_FADE = 0.6
	constant real CRITICAL_OFFSET_Z = 90.
	constant real CRITICAL_MIN_SPEED = 50.
	constant real CRITICAL_MAX_SPEED = 70.
	constant real CRITICAL_MIN_ANGLE = 0.
	constant real CRITICAL_MAX_ANGLE = 360.

	// @const цвета урона
	constant string CRITICAL_PHYS_COLOR = "|cffff0303"
	constant string CRITICAL_MAGIC_COLOR = "|cffeb2a74"
	constant string CRITICAL_PURE_COLOR = "|cffff8420"

	//public constant string CRITICAL_DMG_COLOR ="|cffd33933";
	constant string PURE_DMG_COLOR = "|cfff5f82b"
	constant string MAGICAL_DMG_COLOR = "|cffb76bff"

	// @const типы суммирующего текста
	constant integer HEAL_TEXT = 1
	constant integer MANA_TEXT = 2
	constant integer BLOCK_TEXT = 3
	constant integer DMG_TEXT = 4
	constant integer REGULAR_TEXT = 5
	constant integer GOLD_TEXT = 5

	//==============================
	//=========== TALENT ===========
	constant Event EVENT_TALENT_CHOSEN = undefined

	//==================================
	//=========== TECH UTILS ===========
	constant integer array MODIFIERS = undefined
	constant string array MODIFIERS_NAME = undefined
	constant integer array MULTI_MODIFIERS = undefined
	constant string array MULTI_MODIFIERS_NAME = undefined

	// @const группа всех инициализированных юнитов
	constant group INIT_UNITS = undefined

	//=================================
	//=========== UNIT DATA ===========
	constant UnitData TempData = 0

	//====================================
	//=========== HASH CLEANER ===========

	// Событие при очистке хэш-таблицы для юнита
	//
	// GetTriggerHandleId() -> integer
	constant Event EVENT_CLEAR_HASH = undefined

	//===============================
	//=========== HASH ID ===========
	constant hashtable HT = InitHashtable()

	//============================
	//=========== MATH ===========

	// ln(2)
	constant real LN2 = 0.693147

	// ln(10)
	constant real LN10 = 2.302585

	// Pi number
	constant real PI_NUM = 3.14159265

	// Euler number
	constant real EULER = 2.7182818

	// (M_E)^(1/4)
	constant real FOURTH_EULER = 1.2840254

	// sqrt(2)
	constant real SQRT2 = 1.4142136

	// sqrt(3)
	constant real SQRT3 = 1.7320508

	//==============================
	//=========== POINTS ===========
	constant Point2D TempPoint = undefined

	//============================================
	//=========== MULTI MODIFIERS LIST ===========
	constant integer ABSOLUTE_FORM = 'E039'

	//============================
	//=========== FORG ===========
	constant integer FORG_IMMUNE_ID = 'A0O2'

endglobals

	//===================================
	//=========== AREA SPELLS ===========

	// Прикрепляет эффект к заклинанию.
	// Следующий вызов заменит эффект.
	//
	// @arg effect `stunned` эффект.
	// @arg AreaSpell `whichSpell` заклинание.
	native AttachEffectToAreaSpell takes effect whichEffect, AreaSpell whichSpell returns nothing

	// Добавляет заклинание области к юниту.
	//
	// @arg unit `ownerUnit` юнит, владеющий заклинанием.
	// @arg unit `dummyUnit` юнит, применяющий заклинание (может быть таким же как и  `unit ownerUnit`).
	// @arg integer `actionsId` идентификатор действий заклинания.
	// @arg real `duration` длительность действия заклинания.
	// @arg boolean `pierceDeath` работает ли заклинание сквозь смерть `unit dummyUnit`.
	// @arg boolexpr `filter` функция-фильтр.
	// @arg real `rangeStart` начальный радиус области действия заклинания.
	// @arg real `rangeEnd` конечный радиус области действия заклинания.
	// @arg real `interval` интервал регистрации юнитов в области.
	// @return object `AreaSpell` - возвращает объект заклинания области.
	native AddAreaSpellToUnit takes unit ownerUnit, unit dummyUnit, integer actionsId, real duration, boolean pierceDeath, boolexpr filter, real rangeStart, real rangeEnd, real interval returns AreaSpell

	//==================================
	//=========== ATTACHMENT ===========
	native AttachUnitToUnit takes unit attached, unit target, real offsetX, real offsetY, real offsetZ returns Attachment
	native DetachUnit takes unit attached returns nothing

	//====================================
	//=========== ATTACK SPEED ===========
	native GetASUnit takes nothing returns unit
	native GetASBonus takes nothing returns real
	native GetASPenalty takes nothing returns real
	native GetASIncrease takes nothing returns real
	native GetASDecrease takes nothing returns real
	native AddASBonus takes real asBonus returns nothing
	native AddASPenalty takes real asPenalty returns nothing
	native AddASIncrease takes real asIncrease returns nothing
	native AddASDecrease takes real asDecrease returns nothing
	native SetASBonus takes real asBonus returns nothing
	native SetASPenalty takes real asPenalty returns nothing
	native SetASIncrease takes real asIncrease returns nothing
	native SetASDecrease takes real asDecrease returns nothing

	// Возвращает кэшированную скорость атаки юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость атаки юнита
	native GetUnitAttackSpeed takes unit whichUnit returns real

	// Обновляет скорость атаки юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость атаки юнита
	native UpdateUnitAttackSpeed takes unit whichUnit returns real

	//=============================
	//=========== AURAS ===========
	native GetAuraOwnerUnit takes nothing returns unit
	native GetAuraTargetUnit takes nothing returns unit
	native IsAuraEntered takes nothing returns boolean
	native IsAuraOut takes nothing returns boolean
	native IsAuraActions takes nothing returns boolean
	native GetAuraActionsId takes nothing returns integer

	// Возвращает ауру типа `typeId`, которая действует на юнита
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return Aura объект ауры или 0
	native GetTargetAuraByType takes unit u, integer typeId returns Aura

	// Возвращает ауру типа `typeId`, которую излучает юнит
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return Aura объект ауры или 0
	native GetOwnerAuraByType takes unit u, integer typeId returns Aura

	// Считает количество аур данного типа, которые излучает юнит
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return integer количество активных аур
	native GetCountOwnerAuraByType takes unit u, integer typeId returns integer

	// Считает количество аур данного типа, которые действуют на юнита
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return integer количество активных аур
	native GetCountTargetAuraByType takes unit u, integer typeId returns integer

	// Возвращает юнита-владельца ауры типа `typeId`, которая действует на `u`
	// @arg unit u — цель
	// @arg integer typeId — тип ауры
	// @return unit — владелец ауры или null
	native GetUnitOwnerForTargetAuraByType takes unit u, integer typeId returns unit

	// Проверяет, действует ли на юнита цель аура с указанным типом
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return boolean true, если такая аура действует
	native IsUnitTargetAddedTypeAura takes unit u, integer typeId returns boolean

	// Проверяет, излучает ли юнит ауру с указанным типом
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return boolean true, если юнит излучает ауру этого типа
	native IsUnitOwnerAddedTypeAura takes unit u, integer typeId returns boolean

	// Удаляет все ауры указанного типа у юнита
	// @arg unit u владелец аур
	// @arg integer typeId тип ауры
	// @arg boolean AllowMultiType если true, то не удаляет multi-type ауры
	native DestroyUnitAurasByType takes unit u, integer typeId, boolean AllowMultiType returns nothing

	// Удаляет все ауры, излучаемые объектом с данным hashId
	// @arg integer hashId ID объекта (юнит, итем и т.д.)
	// @return nothing
	native DestroyAllAurasByHashId takes integer hashId returns nothing

	// Добавляет ауру к юниту с заданными параметрами
	// @arg unit auraUnit владелец ауры
	// @arg integer typeId тип ауры
	// @arg item itemAura предмет, к которому привязана аура (опционально)
	// @arg boolean multiAurasToTarget стакается ли аура по целям
	// @arg integer priority приоритет (для нестакуемых аур)
	// @arg boolean multiAurasForOwner стакается ли аура в инвентаре
	// @arg boolean refreshOutEnter обновлять ли вход/выход при удалении
	// @arg boolean hardRefresh насильно обновлять вход/выход
	// @arg integer actionsId ID набора действий для ауры
	// @arg boolexpr filter фильтр целей ауры (опционально)
	// @arg real radiusMax радиус действия ауры
	// @arg real endDuration длительность действия после выхода из зоны
	// @arg boolean periodActions включить периодические действия
	// @arg real period интервал периодических действий
	// @return Aura ссылка на созданную ауру
	native AddAuraToUnit takes unit auraUnit, integer typeId, item itemAura, boolean multiAurasToTarget, integer priority, boolean multiAurasForOwner, boolean refreshOutEnter, boolean hardRefresh, integer actionsId, boolexpr filter, real radiusMax, real endDuration, boolean periodActions, real period returns nothing

	// GUI-версия AddAuraToUnit использует глобальные переменные udg_AS_*
	// @return Aura ссылка на созданную ауру
	native AddAuraToUnitGUI takes nothing returns Aura

	//=============================
	//=========== BUFFS ===========
	native GetTriggerBuffOwner takes nothing returns unit
	native GetTriggerBuffTarget takes nothing returns unit
	native GetTriggerBuffIsEntered takes nothing returns boolean
	native GetTriggerBuffIsOut takes nothing returns boolean
	native GetTriggerBuffIsActions takes nothing returns boolean
	native GetTriggerBuffIsTransfer takes nothing returns boolean
	native GetTriggerBuffActionsId takes nothing returns integer
	native GetTriggerBuffId takes nothing returns integer
	native GetTriggerBuffStack takes nothing returns timer
	native GetBuffDataInt takes Buff buf returns integer
	native GetBuffDataReal takes Buff buf returns real
	native GetBuffOwnerUnit takes Buff buf returns unit
	native GetBuffTargetUnit takes Buff buf returns unit
	native GetBuffActionsId takes Buff buf returns integer
	native GetBuffMaxDuration takes Buff buf returns real
	native GetBuffDefaultDuration takes Buff buf returns real
	native GetBuffRemainingTimeToAction takes Buff buf returns real
	native GetBuffRemainingDuration takes Buff buf returns real
	native GetBuffRank takes Buff buf returns integer
	native GetBuffDispelDifficulty takes Buff buf returns integer
	native GetBuffStackable takes Buff buf returns boolean
	native GetBuffSingleDuration takes Buff buf returns boolean
	native GetBuffSingleOutEnter takes Buff buf returns boolean
	native GetBuffSinglePeriod takes Buff buf returns boolean
	native GetBuffPierceSpellImmun takes Buff buf returns boolean
	native GetBuffPierceInvul takes Buff buf returns boolean
	native GetBuffPierceDeath takes Buff buf returns boolean
	native GetBuffPeriodActions takes Buff buf returns boolean
	native GetBuffPeriod takes Buff buf returns real
	native SetBuffDataInt takes Buff buf, integer dataInt returns nothing
	native SetBuffDataReal takes Buff buf, real dataReal returns nothing
	native SetBuffOwner takes Buff buf, unit ownerUnit returns nothing
	native SetBuffTarget takes Buff buf, unit targetUnit returns nothing
	native SetBuffActionsId takes Buff buf, integer actionsId returns nothing
	native SetBuffDuration takes Buff buf, real duration returns nothing
	native ReduceBuffRemainingDuration takes Buff buf, real coef returns nothing
	native AddBuffRemainingDuration takes Buff buf, real duration returns nothing
	native SetBuffRank takes Buff buf, integer rank returns nothing
	native SetBuffDispelDifficulty takes Buff buf, integer dispelDifficulty returns nothing
	native SetBuffStackable takes Buff buf, boolean stackable returns nothing
	native SetBuffSingleDuration takes Buff buf, boolean singleDuration returns nothing
	native SetBuffSingleOutEnter takes Buff buf, boolean singleOutEnter returns nothing
	native SetBuffSinglePeriod takes Buff buf, boolean singlePeriod returns nothing
	native SetBuffPierceSpellImmun takes Buff buf, boolean pierceSpellImmun returns nothing
	native SetBuffPierceInvul takes Buff buf, boolean pierceInvul returns nothing
	native SetBuffPierceDeath takes Buff buf, boolean pierceDeath returns nothing
	native SetBuffPeriod takes Buff buf, real period returns nothing

	// Возвращает первый активный бафф нужного типа
	// @arg unit u - юнит
	// @arg integer typeId - тип баффа
	// @return Buff - бафф или 0
	native GetUnitBuffByType takes unit u, integer typeId returns Buff

	// Удаляет все баффы у объекта с указанным hashId
	// @arg hashId - хэндл юнита/объекта
	// @return nothing
	native DestroyAllBuffsByHashId takes integer hashId returns nothing

	// Удаляет все баффы заданного ранга и допустимой сложности развеивания
	// Срабатывают выходные действия
	// @arg unit u - юнит
	// @arg rank - ранг баффа
	// @arg dispelDifficulty - макс. сложность развеивания
	native DestroyUnitBuffs takes unit u, integer rank, integer dispelDifficulty returns nothing

	// Удаляет конкретный бафф у юнита
	// @arg unit u - юнит
	// @arg Buff buf - бафф
	// @arg boolean onOut - запускать ли выходные действия
	native DestroyUnitBuff takes unit u, Buff buf, boolean onOut returns nothing

	// Проверяет наличие баффа указанного типа
	// @arg unit u - юнит
	// @arg integer typeId - тип баффа
	// @return boolean - true, если есть
	native IsUnitBuffByType takes unit u, integer typeId returns boolean

	// Проверяет наличие баффа с указанным actionsId
	// @arg unit u - юнит
	// @arg integer actionsId - ID действия
	// @return boolean - true, если есть
	native IsUnitBuffByActionId takes unit u, integer actionsId returns boolean

	// Обновляет время жизни баффа (обнуляет таймер)
	// @arg Buff buf - бафф
	native RefreshDurationBuff takes Buff buf returns nothing

	// Выполняет периодические действия баффа вручную
	// @arg Buff buf - бафф
	native ExecuteBuffActions takes Buff buf returns nothing

	// Выполняет периодические действия стака баффа вручную
	// @arg Buff buf - бафф
	// @arg timer buffStack - таймер стака
	native ExecuteBuffStackActions takes Buff buf, timer buffStack returns nothing

	// Активирует периодические действия баффа
	// Если таймер уже есть - просто рестартует
	// @arg Buff buf - бафф
	native EnableBuffPeriod takes Buff buf returns nothing

	// Возвращает количество стаков у баффа
	// @arg Buff buf - бафф
	// @return integer - число стаков
	native GetBuffStacks takes Buff buf returns integer

	// Обновляет длительность у всех стаков баффа
	// Учитывает модификаторы от ранга
	// @arg Buff buf - бафф
	native RefreshDurationBuffStacks takes Buff buf returns nothing

	// Возвращает целочисленное значение, привязанное к конкретному стаку баффа
	// Используется для хранения индивидуальных параметров стака
	// @arg timer buffStack - таймер стака баффа
	// @return integer - целочисленное значение, сохранённое в стаке
	native GetBuffStackDataInt takes timer buffStack returns integer

	// Возвращает вещественное значение, привязанное к конкретному стаку баффа
	// Используется для хранения индивидуальных параметров стака
	// @arg timer buffStack - таймер стака баффа
	// @return real - вещественное значение, сохранённое в стаке
	native GetBuffStackDataReal takes timer buffStack returns real

	// Возвращает оставшееся время до окончания жизни стака
	// Работает как TimerGetRemaining()
	// @arg timer buffStack - таймер стака баффа
	// @return real - оставшееся время
	native GetBuffStackRemainingDuration takes timer buffStack returns real

	// Устанавливает целочисленное значение стака и корректирует общее значение баффа
	// Вычитает старое значение, прибавляет новое — позволяет точно трекать вклад стаков
	// @arg Buff buf - бафф
	// @arg timer buffStack - стак, которому назначается значение
	// @arg integer dataInt - новое значение
	native SetBuffStackDataInt takes Buff buf, timer buffStack, integer dataInt returns nothing

	// Устанавливает вещественное значение стака и корректирует общее значение баффа
	// Вычитает старое значение, прибавляет новое — синхронизирует вклад стаков
	// @arg Buff buf - бафф
	// @arg timer buffStack - стак, которому назначается значение
	// @arg real dataReal - новое значение
	native SetBuffStackDataReal takes Buff buf, timer buffStack, real dataReal returns nothing

	// Добавляет кастомный бафф на цель с множеством параметров контроля
	// @arg ownerUnit - юнит, который наложил бафф
	// @arg targetUnit - юнит, на которого вешается бафф
	// @arg typeId - уникальный тип баффа
	// @arg actionsId - ID набора действий
	// @arg duration - базовая длительность
	// @arg rank - ранг (0 - дебафф, 1 - бафф, ≥2 - спец)
	// @arg dispelDifficulty - сложность развеивания баффа (рассеиваются баффы равны или ниже этому значению)
	// @arg stackable - true - бафф получает стаки в случае если бафф такого же типа уже активен, false - бафф замещается новым
	// @arg singleDuration - true - стаки используют единую длительность баффа, false - стаки используют независимую длительность (для стакабельных) (для нестакабельных true будет обновлять параметры и длительность баффа)
	// @arg singleOutEnter - true - дополнительные стаки стакабельного баффа не будут триггерить действия входа/выхода, для нестакабельных действия входа/выхода не будут запущены при замещении баффа
	// @arg singlePeriod - true - бафф имеет единый таймер периодических действий, false - стаки имеют свои таймеры периодических действий (только для stackable)
	// @arg countStacks - /максимальное количество стаков (при переполненности уничтожает стак с самой маленькой длительностью (с действием выхода) и создает новый стак (с действием входа))
	// @arg pierceSpellImmun - false - бафф автоматически снимется, если юнит станет неуязвимым к магии, true - игнорирует неуязвимость к магии
	// @arg pierceInvul - false - бафф автоматически снимется, если юнит станет неуязвимым, true - игнорирует неуязвимость
	// @arg pierceDeath - false - бафф автоматически снимется, если юнит умрет, true - игнорирует смерть юнита
	// @arg periodActions - включить периодические действия (true - вкл, false - выкл)
	// @arg period - промежуток времени между периодическими действиями
	// @return Buff - созданный объект баффа
	native AddBuffToUnit takes unit ownerUnit, unit targetUnit, integer typeId, integer actionsId, real duration, integer rank, integer dispelDifficulty, boolean stackable, boolean singleDuration, boolean singleOutEnter, boolean singlePeriod, integer countStacks, boolean pierceSpellImmun, boolean pierceInvul, boolean pierceDeath, boolean periodActions, real period returns nothing

	// Упрощённый вызов AddBuffToUnit, использующий глобальные GUI переменные (udg_BS_*)
	// @return Buff - созданный объект баффа
	native AddBuffToUnitGUI takes nothing returns Buff

	// Переносит активные баффы от ownerUnit на targetUnit
	// Только баффы указанного ранга и с dispelDifficulty ≤ указанного
	// @arg ownerUnit - юнит-источник
	// @arg targetUnit - юнит-получатель
	// @arg rank - целевой ранг
	// @arg dispelDifficulty - макс. сложность развеивания
	native TransferUnitBuffsToUnit takes unit ownerUnit, unit targetUnit, integer rankC, integer dispelDifficultyC returns nothing

	// Возвращает текущий бафф цикла фильтрации
	// Используется внутри условной функции фильтрации
	// @return Buff - текущий обрабатываемый бафф
	native GetFilterBuff takes nothing returns Buff

	// Возвращает i-й бафф, попавший под фильтрацию в InitBuffsLoop
	// @arg integer i - индекс (от 1 до GetCountSelectedBuffs())
	// @return Buff - выбранный бафф
	native GetSelectedBuff takes integer i returns Buff

	// Возвращает количество выбранных баффов, прошедших фильтрацию
	// Используется для обхода SELECTED_BUFF_GET[]
	// @return integer - число выбранных баффов
	native GetCountSelectedBuffs takes nothing returns integer

	// Инициализирует цикл фильтрации баффов юнита
	// Перед каждым баффом устанавливает FILTER_BUFF_GET, затем вызывает функцию condition
	// Если FILTER_BOOLEAN_GET = true — бафф записывается в SELECTED_BUFF_GET
	// @arg unit u - юнит, чьи баффы проверяются
	// @arg string condition - имя функции-фильтра (использует ExecuteFunc)
	native InitBuffsLoop takes unit u, string condition returns nothing

	//==============================
	//=========== COMBAT ===========
	native GetCombatUnit takes nothing returns unit
	native IsCombatEntering takes nothing returns boolean
	native IsCombatLeaving takes nothing returns boolean

	// Проверяет, находится ли юнит в сражении
	// @arg unit whichUnit целевой юнит
	// @return boolean true, если юнит в бою
	native IsUnitInCombat takes unit whichUnit returns boolean

	//==================================
	//=========== CONDITIONS ===========
	native GetFilterOwnerUnit takes nothing returns unit
	native GetFilterTargetUnit takes nothing returns unit
	native GetFilterReal takes nothing returns real

	// Инициализирует условие вместе с передачей параметров
	// @arg code func код фильтрации
	// @arg unit ownerUnit юнит-владелец условия
	// @return conditionfunc
	native ConditionWithOwner takes code func, unit ownerUnit returns conditionfunc

	// Инициализирует условие вместе с передачей параметров
	// @arg code func код фильтрации
	// @arg unit ownerUnit юнит-владелец условия
	// @arg unit targetUnit юнит-цель условия
	// @return conditionfunc
	native ConditionParameters takes code func, unit ownerUnit, unit targetUnit, real filterReal returns conditionfunc

	// Проверяет, может ли юнит быть перемещён
	// @arg unit initiator инициатор проверки
	// @arg unit target целевой юнит
	// @return boolean
	native IsUnitCanBeMoved takes unit initiator, unit target returns boolean

	// Проверяет, является ли юнит разоружённым
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitDisarmed takes unit whichUnit returns boolean

	// Проверяет, может ли юнит выполнять действия
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitCanDoActions takes unit whichUnit returns boolean

	// Проверяет, может ли юнит атаковать
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitCanAttack takes unit whichUnit returns boolean

	// Проверяет, есть ли у юнита атака
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitHasAttack takes unit whichUnit returns boolean

	// Проверяет, является ли юнит строением
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitStructure takes unit whichUnit returns boolean

	//===============================
	//=========== CRYSTAL ===========
	native GetCapturingPlayer takes nothing returns player

	// Устанавливает основной объект "crystal" (визуальный юнит внутри кольца)
	// Используется для отслеживания и убийства при захвате
	// @arg unit crystal - юнит, представляющий кристалл
	native SetCrystal takes unit crystal returns nothing

	// Инициализирует центральный кристалл захвата по переданному кольцу
	// Создаёт структуру, регистрирует триггер на вход, запускает таймер логики
	// @arg unit ring - юнит-кольцо (вокруг кристалла), определяющее зону захвата
	native InitCrystal takes unit ring returns nothing

	//==============================
	//=========== DAMAGE ===========

	// Отключает детект урона
	native DisableDetectDamage takes nothing returns nothing

	// Включает детект урона
	native EnableDetectDamage takes nothing returns nothing
	native GetModifierAttackedUnit takes nothing returns unit
	native GetModifierAttackingUnit takes nothing returns unit
	native GetModifierSourceUnit takes nothing returns unit
	native GetModifierSourcePosition takes nothing returns Point2D
	native IsModifierIgnoreBlock takes nothing returns boolean
	native IsModifierAttack takes nothing returns boolean
	native IsModifierCritical takes nothing returns boolean
	native IsModifierDodge takes nothing returns boolean
	native IsModifierMagical takes nothing returns boolean
	native IsModifierNoRepeat takes nothing returns boolean
	native IsModifierPhysical takes nothing returns boolean
	native IsModifierPure takes nothing returns boolean
	native IsModifierReflection takes nothing returns boolean
	native IsModifierSimulate takes nothing returns boolean
	native IsModifierSpecAttack takes nothing returns boolean
	native AddModifierDodgeChance takes real dodgeChance returns nothing
	native GetModifierDodgeChance takes nothing returns real
	native SetModifierDodgeChance takes real dodgeChance returns nothing
	native AddModifierMissChance takes real missChance returns nothing
	native GetModifierMissChance takes nothing returns real
	native SetModifierMissChance takes real missChance returns nothing
	native AddModifierTrueStrikeChance takes real trueStrikeChance returns nothing
	native GetModifierTrueStrikeChance takes nothing returns real
	native SetModifierTrueStrikeChance takes real trueStrikeChance returns nothing
	native AddModifierPierceRate takes real pierceRate returns nothing
	native GetModifierPierceRate takes nothing returns real
	native SetModifierPierceRate takes real pierceRate returns nothing
	native SetModifierPierceType takes integer pierceType returns nothing
	native AddModifierDMGAdd takes real dmgAdd returns nothing
	native GetModifierDMGAdd takes nothing returns real
	native SetModifierDMGAdd takes real dmgAdd returns nothing
	native AddModifierDMGAmplifier takes integer typeAmplifier, real dmgAmplifier returns nothing
	native GetModifierDMGAmplifier takes integer typeAmplifier returns real
	native SetModifierDMGAmplifier takes integer typeAmplifier, real dmgAmplifier returns nothing
	native GetModifierCriticalType takes nothing returns integer
	native AddModifierCriticalRate takes integer typeId, real criticalRate returns nothing
	native PlusModifierCriticalRate takes real criticalRate returns nothing
	native AddModifierCriticalDamage takes integer typeId, real criticalDamage returns nothing
	native AddModifierBash takes integer typeId, real bashDamage, real duration returns nothing
	native GetBlockedFromAmount takes real amount returns real
	native GetModifierDamageGiven takes nothing returns real
	native SetModifierDamageGiven takes real dmgGiven returns nothing
	native GetModifierDamageTaken takes nothing returns real
	native SetModifierDamageTaken takes real dmgTaken returns nothing
	native GetModifierDamageMax takes nothing returns real
	native SetModifierDamageMax takes real dmgMax returns nothing
	native GetModifierArmorReduction takes nothing returns real
	native GetDamageAttackedUnit takes nothing returns unit
	native GetDamageAttackingUnit takes nothing returns unit
	native GetDamageSourceUnit takes nothing returns unit
	native GetDamageSourcePosition takes nothing returns Point2D
	native GetDamageBash takes nothing returns real
	native GetDamageBashDuration takes nothing returns real
	native GetDamageBlocked takes nothing returns real
	native GetDamageGiven takes nothing returns real
	native GetDamageIgnoreBlock takes nothing returns boolean
	native GetDamageIsAttack takes nothing returns boolean
	native GetDamageIsBlocked takes nothing returns boolean
	native GetDamageIsCritical takes nothing returns boolean
	native GetDamageIsDodge takes nothing returns boolean
	native GetDamageIsMagical takes nothing returns boolean
	native GetDamageIsNoRepeat takes nothing returns boolean
	native GetDamageIsPhysical takes nothing returns boolean
	native GetDamageIsPure takes nothing returns boolean
	native GetDamageIsReflection takes nothing returns boolean
	native GetDamageIsSimulate takes nothing returns boolean
	native GetDamageIsSpecAttack takes nothing returns boolean
	native GetDamageLifeAttackedUnit takes nothing returns real
	native GetDamageIsRunPass takes nothing returns boolean
	native GetDeathKillingUnit takes nothing returns unit
	native GetDeathKilledUnit takes nothing returns unit

	//==================================
	//=========== DAMAGE API ===========

	// Нанести урон юниту
	// Можно вызывать .run(), .magic(), .pure(), .phys() и т.д. после вызова
	// @arg unit whichUnit - атакующий
	// @arg unit target - цель
	// @arg real value - количество урона
	// @return DamageEvent - объект урона
	native Damage takes unit whichUnit, unit target, real value returns DamageEvent

	// deprecated use Damage(whichUnit, target, value).run instead
	native UnitAttackToTarget takes unit whichUnit, unit target, real value, attacktype attackType, damagetype damageType, boolean isSpecAttack, boolean ignoreBlock, boolean ignoreMiss, boolean ignorePierce, boolean isNoRepeat returns nothing

	// deprecated use Damage(whichUnit, target, value).run instead
	native UnitDamageToTarget takes unit whichUnit, unit target, real value, attacktype attackType, damagetype damageType, boolean onTrigger, boolean isNoRepeat, boolean isReflection, boolean ignoreBlock, boolean isHide returns nothing

	// deprecated use Damage(whichUnit, target, value).run instead
	native UnitDamageMagicToTarget takes unit whichUnit, unit target, real value returns nothing

	// deprecated use Damage(whichUnit, target, value).run instead
	native UnitDamagePureToTarget takes unit whichUnit, unit target, real value returns nothing

	// deprecated use Damage(whichUnit, target, value).run instead
	native UnitDamagePhysToTarget takes unit whichUnit, unit target, real value returns nothing

	//==============================
	//=========== EVENTS ===========

	// Создаёт новое пользовательское событие и возвращает его ID
	// @arg string name - название события (для отладки и логов)
	// @return Event новое событие
	native CreateEvent takes string name returns Event

	// Проверяет, активно ли сейчас выполнение данного события
	// @arg Event eventId событие
	// @return boolean true если сейчас выполняется
	native IsEventRun takes Event eventId returns boolean

	// Возвращает имя события по его ID
	// @arg Event eventId - ID события
	// @return string - имя события (устанавливается в CreateEvent)
	native GetEventName takes Event eventId returns string

	// Возвращает ID текущего выполняемого события
	// Не работает для триггеров, созданных через EventRegisterTrigger()
	// @return Event - ID выполняемого события
	native GetTriggeringEvent takes nothing returns Event

	// Принудительно выполняет событие (вызов всех его обработчиков)
	// @arg Event eventId событие
	native ExecuteEvent takes Event eventId returns nothing

	// Регистрирует действие на указанное событие
	// Автоматически вешает `code` на единый триггер для всех игроков
	// @arg Event eventId - ID события (GetHandleId(EVENT_PLAYER_...) или кастомный событие (EVENT_AURA_...))
	// @arg code action - функция, которую нужно выполнят при срабатывании события
	// @return triggeraction - ссылка на зарегистрированное действие
	native EventRegisterAction takes Event eventId, code action returns triggeraction
	native RegisterAction takes Event eventId, code action returns nothing

	// Удаляет ранее зарегистрированное действие с события
	// @arg Event eventId - ID события
	// @arg triggeraction action - ссылка на действие, полученное из EventRegisterAction
	native EventUnregisterAction takes Event eventId, triggeraction action returns nothing

	// Регистрирует GUI-триггер на указанное событие (со всеми его условиями/действиями).
	// Работает и для системных EVENT_GAME/PLAYER/PLAYER_UNIT, и для кастомных CreateEvent().
	// @arg trigger trg триггер из GUI (или созданный кодом), который должен срабатывать на eventId
	// @arg Event eventId ID события
	native EventRegisterTrigger takes trigger trg, Event eventId returns nothing

	//===============================
	//=========== FATIGUE ===========
	native GetFatigueUnit takes nothing returns unit

	// Возвращает текущий уровень усталости юнита
	// @arg unit whichUnit - целевой юнит
	// @return real - уровень усталости (0.0 ... FATIGUE_MAX)
	native GetUnitFatigue takes unit whichUnit returns real

	// Принудительно устанавливает уровень усталости юнита
	// Значение будет ограничено от 0.0 до FATIGUE_MAX
	// @arg unit whichUnit - целевой юнит
	// @arg real fatigue - желаемый уровень усталости
	native SetUnitFatigue takes unit whichUnit, real fatigue returns nothing

	// Проверяет, достиг ли юнит максимального уровня усталости
	// @arg unit whichUnit - целевой юнит
	// @return boolean - true, если усталость >= FATIGUE_MAX
	native IsUnitFatigued takes unit whichUnit returns boolean

	//============================
	//=========== GOLD ===========

	// Event Modifier Getters
	native GetGoldModifierBonus takes nothing returns real
	native GetGoldModifierPenalty takes nothing returns real
	native GetGoldModifierIncrease takes nothing returns real
	native GetGoldModifierDecrease takes nothing returns real

	// Event Modifier Adders
	native AddGoldModifierBonus takes real goldBonus returns nothing
	native AddGoldModifierPenalty takes real goldPenalty returns nothing
	native AddGoldModifierIncrease takes real goldIncrease returns nothing
	native AddGoldModifierDecrease takes real goldDecrease returns nothing

	// Event Gold and Modifier Getters
	native GetGoldPlayer takes nothing returns player
	native GetGoldSourceUnit takes nothing returns unit
	native GetGoldAmount takes nothing returns real

	// Добавляет золото игроку с возможностью модификации суммы через EVENT_GOLD_MODIFIER
	// Если итоговая сумма больше 0 - добавляет золото и вызывает событие EVENT_GOLD
	// @arg player whichPlayer - игрок, которому начисляется золото
	// @arg unit sourceUnit - юнит-источник (например, убитый враг)
	// @arg real amount - базовая сумма золота (до модификаторов)
	native AddGold takes player whichPlayer, unit sourceUnit, real amount returns nothing

	//==============================================
	//=========== HEAL LIFESTEAL RESTORE ===========
	native GetHealAmount takes nothing returns real
	native GetHealedUnit takes nothing returns unit
	native GetHealingUnit takes nothing returns unit
	native GetOverHeal takes nothing returns real
	native GetLifestealAmount takes nothing returns real
	native GetLifestealedUnit takes nothing returns unit
	native GetOverLifesteal takes nothing returns real
	native GetRestoredAmount takes nothing returns real
	native GetRestoredUnit takes nothing returns unit
	native GetRestoringUnit takes nothing returns unit
	native GetOverRestore takes nothing returns real
	native SetHealAmount takes real healAmount returns nothing
	native SetLifestealAmount takes real lifestealAmount returns nothing
	native SetRestoredAmount takes real restoredAmount returns nothing

	// Лечит юнита с возможностью модификации значения через EVENT_HEAL_MODIFIER
	// Если итоговое значение положительное - применяет лечение и вызывает EVENT_HEAL
	// @arg unit healingUnit - юнит, выполняющий лечение
	// @arg unit healedUnit - юнит, получающий лечение
	// @arg real amount - базовое значение лечения
	native HealUnit takes unit healingUnit, unit healedUnit, real amount returns nothing

	// Применяет лайфстил к юниту с возможностью модификации значения через EVENT_LIFESTEAL_MODIFIER
	// Если итоговое значение положительное - восстанавливает здоровье и вызывает EVENT_LIFESTEAL
	// @arg unit whichUnit - юнит, получающий лайфстил
	// @arg real amount - базовое значение лайфстила
	native LifestealUnit takes unit whichUnit, real amount returns nothing

	// Восстанавливает ману юниту с возможностью модификации значения через EVENT_RESTORE_MODIFIER
	// Если итоговое значение положительное - восстанавливает ману и вызывает EVENT_RESTORE
	// @arg unit restoringUnit - юнит, выполняющий восстановление
	// @arg unit restoredUnit - юнит, получающий восстановление маны
	// @arg real amount - базовое значение восстановления маны
	native RestoreManaUnit takes unit restoringUnit, unit restoredUnit, real amount returns nothing

	//==============================
	//=========== HEROES ===========

	// Event Getters
	native GetBrokenStreak takes nothing returns integer

	// Обрабатывает событие убийства одним героем другого.
	//
	// @arg unit `killingHero` герой, совершивший убийство.
	// @arg unit `killedHero` герой, который был убит.
	native KillingEvent takes unit killingHero, unit killedHero returns nothing

	// Проверяет, активен ли режим обнаружения величины атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @return boolean true, если режим обнаружения величины атаки активен.
	native IsHeroDetectAttack takes unit whichHero returns boolean

	// Устанавливает режим обнаружения величины атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @arg boolean `isDetectAttack` true, если режим обнаружения величины атаки должен быть активен.
	native SetHeroDetectAttack takes unit whichHero, boolean isDetectAttack returns nothing

	// Возвращает величину атаки героя.
	//
	// @arg unit `whichHero` герой.
	// @return real величину атаки героя.
	native GetHeroAttackValue takes unit whichHero returns real

	// Устанавливает величину атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @arg real `attackValue` новое величину атаки.
	native SetHeroAttackValue takes unit whichHero, real attackValue returns nothing

	// Возвращает общую серию убийств героя.
	//
	// @arg unit `whichHero` герой.
	// @return integer общее количество последовательных убийств.
	native GetHeroTotalStreak takes unit whichHero returns integer

	// Возвращает короткую серию убийств героя.
	//
	// @arg unit `whichHero` герой.
	// @return integer количество убийств в текущей короткой серии.
	native GetHeroShortStreak takes unit whichHero returns integer

	// Возвращает количество убийств игрока одного героя другим.
	//
	// @arg unit `originHero` герой, совершивший убийства.
	// @arg unit `targetHero` герой, который был убит.
	// @return integer количество убийств одного игрока другим.
	native GetHeroPlayerStreak takes unit originHero, unit targetHero returns integer

	//=================================
	//=========== ILLUSIONS ===========

	// Создает иллюзию для указанного игрока на основе юнита.
	//
	// @arg player `owner` владелец иллюзии.
	// @arg unit `source` юнит, на основе которого создается иллюзия.
	// @arg real `x` координата X для создания иллюзии.
	// @arg real `y` координата Y для создания иллюзии.
	// @arg real `facing` угол поворота иллюзии.
	// @return Illusion объект иллюзии.
	native CreateIllusion takes player owner, unit source, real x, real y, real facing returns Illusion

	// Возвращает последний созданный объект иллюзии.
	//
	// @return Illusion объект иллюзии.
	native GetLastCreatedIllusion takes nothing returns Illusion

	// Возвращает объект иллюзии юнита.
	//
	// @arg unit `u` юнит иллюзии.
	// @return Illusion объект иллюзии.
	native GetUnitIllusion takes unit u returns Illusion

	// Возвращает юнита объекта иллюзии.
	//
	// @arg Illusion `illusion` объект юнита иллюзии.
	// @return юнит иллюзии.
	native GetIllusionUnit takes Illusion illusion returns unit

	// Проверяет, является ли указанный юнит расширенной иллюзией.
	//
	// @arg unit `u` проверяемый юнит.
	// @return boolean `true`, если юнит является иллюзией, иначе `false`.
	native IsUnitIllusionEx takes unit u returns boolean

	// Устанавливает оставшееся время жизни для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается время жизни.
	// @arg real `time` время жизни в секундах.
	// @return boolean `true`, если время жизни успешно установлено, иначе `false`.
	native SetIllusionRemainingTime takes Illusion illusion, real time returns boolean

	// Устанавливает количество получаемого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается получаемый урон.
	// @arg real `damageTaken` количество получаемого урона.
	// @return boolean `true`, если получаемый урон успешно установлен, иначе `false`.
	native SetIllusionDamageTaken takes Illusion illusion, real damageTaken returns boolean

	// Устанавливает количество наносимого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается наносимый урон.
	// @arg real `damageGiven` количество наносимого урона.
	// @return boolean `true`, если наносимый урон успешно установлен, иначе `false`.
	native SetIllusionDamageGiven takes Illusion illusion, real damageGiven returns boolean

	// Возвращает количество получаемого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой возвращается получаемый урон.
	// @return real количество получаемого урона.
	native GetIllusionDamageTaken takes Illusion illusion returns real

	// Возвращает количество наносимого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой возвращается наносимый урон.
	// @return real количество наносимого урона.
	native GetIllusionDamageGiven takes Illusion illusion returns real
	native GetHeroStatHook takes integer whichStat, unit whichHero, boolean includeBonuses returns integer

	//=====================================
	//=========== JUMP TO POINT ===========

	// Перемещает юнита в указанную позицию с помощью прыжка
	// @arg unit caster юнит, который будет прыгать
	// @arg real x позиция по X, куда будет прыгать юнит
	// @arg real y позиция по Y, куда будет прыгать юнит
	native JumpUnitToXY takes unit caster, real x, real y returns nothing

	// Перемещает юнита в указанную точку с помощью прыжка
	// @arg unit caster юнит, который будет прыгать
	// @arg Point2D end новая позиция, куда будет прыгать юнит
	native JumpUnitToPoint takes unit caster, Point2D end returns nothing

	//=================================
	//=========== LIGHTNING ===========

	// Создаёт графическую молнию между двумя юнитами
	// @arg unit caster юнит-источник молнии
	// @arg unit target юнит-цель молнии
	// @arg string lightningType тип молнии
	// @arg string effectCasterModel модель эффекта источника молнии
	// @arg string effectCasterAttach точка прикрепления эффекта источника молнии
	// @arg string effectTargetModel модель эффекта цели молнии
	// @arg string effectTargetAttach точка прикрепления эффекта цели молнии
	// @arg real duration время жизни молнии
	// @arg real maxDistance максимальная дистанция молнии
	// @arg real lightningZ высота молнии над землёй
	// @arg real decayTime время затухания молнии
	// @arg boolean destroyEffects уничтожать ли эффекты молнии
	// @return integer идентификатор молнии
	native CreateUnitLightningTarget takes unit caster, unit target, string lightningType, string effectCasterModel, string effectCasterAttach, string effectTargetModel, string effectTargetAttach, real duration, real maxDistance, real lightningZ, real decayTime, boolean destroyEffects returns integer

	//=================================
	//=========== MODIFIERS ===========

	// Добавляет модификатор юниту.
	// Поддерживает как аддитивные, так и мультипликативные модификаторы.
	// Для мультипликативных значений сохраняет каждый эффект отдельно (для поддержки стакинга/нестак).
	// @arg unit u — целевой юнит
	// @arg integer modifier — тип модификатора
	// @arg real value — значение модификатора
	native AddUnitModifier takes unit u, integer modifier, real value returns nothing

	// Удаляет модификатор у юнита (точно по значению).
	// Для мультипликативных — удаляет только один экземпляр совпадающего значения.
	// Если модификатор не найден — вызывает ошибку.
	// @arg unit u — целевой юнит
	// @arg integer modifier — тип модификатора
	// @arg real value — значение, которое нужно убрать
	native SubUnitModifier takes unit u, integer modifier, real value returns nothing

	// Возвращает итоговое значение модификатора у юнита.
	// Учитывает тип модификатора, проценты, нестак и бонус от статов.
	// @arg unit u — целевой юнит
	// @arg integer modifier — тип модификатора
	// @return real — итоговое значение (с учётом всех источников)
	native GetUnitModifier takes unit u, integer modifier returns real

	// Полностью удаляет модификатор у юнита (все значения).
	// @arg integer hashId — хендл юнита (можно использовать GetHandleId)
	// @arg integer modifier — тип модификатора
	native DestroyUnitModifier takes integer hashId, integer modifier returns nothing

	// Копирует модификатор от одного юнита другому (включая все значения, если мультипликативный).
	// @arg unit ownerUnit — юнит-источник
	// @arg unit targetUnit — юнит-приёмник
	// @arg integer modifier — тип модификатора
	// @return boolean — true, если был скопирован хотя бы один модификатор
	native CopyUnitModifierToUnit takes unit ownerUnit, unit targetUnit, integer modifier returns boolean

	// Удаляет все зарегистрированные модификаторы по хендлу.
	// @arg integer hashId — хендл юнита
	native DestroyAllModifiersByHashId takes integer hashId returns nothing

	//==================================
	//=========== MOVE SPEED ===========
	native GetMSUnit takes nothing returns unit
	native GetMSBonus takes nothing returns real
	native GetMSPenalty takes nothing returns real
	native GetMSIncrease takes nothing returns real
	native GetMSDecrease takes nothing returns real
	native GetMSMinCap takes nothing returns real
	native GetMSMaxCap takes nothing returns real
	native GetMSSlowResist takes nothing returns real
	native AddMSBonus takes real v returns nothing
	native AddMSPenalty takes real v returns nothing
	native AddMSIncrease takes real v returns nothing
	native AddMSDecrease takes real v returns nothing
	native AddMSSlowResist takes real v returns nothing
	native AddMSCap takes real cap, boolean isMin returns nothing

	// Обновляет скорость перемещения юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость перемещения юнита
	native UpdateUnitMoveSpeed takes unit whichUnit returns real

	//=======================================
	//=========== MULTI MODIFIERS ===========

	// Добавляет мульти-модификатор юниту с указанными параметрами.
	// @arg unit u — юнит, которому добавляется модификатор
	// @arg integer modifier — тип модификатора
	// @arg integer typeModifier — подтип модификатора (влияет на стакаемость/уникальность)
	// @arg real value2..value6 — дополнительные параметры модификатора (напр. шанс, сила, бонусы и т.п.)
	native AddUnitMultiModifier takes unit u, integer modifier, integer typeModifier, real value2, real value3, real value4, real value5, real value6 returns nothing

	// Удаляет конкретное значение мульти-модификатора у юнита (по совпадению всех полей).
	// @return boolean — true, если модификатор успешно удалён
	native SubUnitMultiModifier takes unit u, integer modifier, integer typeModifier, real value2, real value3, real value4, real value5, real value6 returns boolean

	// Полностью удаляет все значения конкретного мульти-модификатора у объекта (по его hashId).
	// @return boolean — true, если модификатор был найден и уничтожен
	native DestroyUnitMultiModifier takes integer hashId, integer modifier returns boolean

	// Рассчитывает итоговое значение мульти-модификатора на юните и записывает в глобальные переменные:
	// TypeMod, ValueMod2..6. Поведение зависит от типа модификатора (стакаемый, нестекаемый, абсолютный и т.п.).
	// @return boolean — true, если модификатор найден
	native GetUnitMultiModifier takes unit u, integer modifier returns boolean

	// Возвращает количество всех записей модификатора у юнита (включая стакаемые).
	// @return integer — количество записей
	native GetUnitCountMultiModifier takes unit u, integer modifier returns integer

	// Извлекает конкретную запись мульти-модификатора по индексу и сохраняет значения в глобальные переменные:
	// TypeMod, ValueMod2..6.
	// @return boolean — true, если запись найдена
	native GetUnitMultiModifierById takes unit u, integer modifier, integer id returns boolean

	// Удаляет все мульти-модификаторы, зарегистрированные по заранее известным ключам.
	native DestroyAllMultiModifiersByHashId takes integer hashId returns nothing

	//==============================
	//=========== PICKUP ===========

	// Делает предмет подбираемым
	// @arg unit pickup предмет, который будет подобран
	// @return Pickup инстанс поведения
	native MakePickupable takes unit pickup returns Pickup
	native GetPickedUpUnit takes nothing returns unit
	native GetPickingUnit takes nothing returns unit

	//====================================
	//=========== REGENERATION ===========
	native GetRegenModifierUnit takes nothing returns unit
	native GetRegenModifierFlat takes nothing returns real
	native GetRegenModifierPenalty takes nothing returns real
	native GetRegenModifierIncrease takes nothing returns real
	native GetRegenModifierDecrease takes nothing returns real
	native GetRegenModifierCap takes nothing returns real
	native AddRegenModifierFlat takes real regenFlat returns nothing
	native AddRegenModifierPenalty takes real regenPenalty returns nothing
	native AddRegenModifierIncrease takes real regenIncrease returns nothing
	native AddRegenModifierDecrease takes real regenDecrease returns nothing
	native AddRegenModifierCap takes real regenCap returns nothing
	native SetRegenModifierFlat takes real regenFlat returns nothing
	native SetRegenModifierPenalty takes real regenPenalty returns nothing
	native SetRegenModifierIncrease takes real regenIncrease returns nothing
	native SetRegenModifierDecrease takes real regenDecrease returns nothing
	native SetRegenModifierCap takes real regenCap returns nothing
	native GetRegenUnit takes nothing returns unit
	native GetRegenValue takes nothing returns real

	// Возвращает текущее значение регенерации HP юнита (без перерасчёта).
	// @arg unit whichUnit — целевой юнит
	// @return real — скорость регенерации здоровья
	native GetUnitHpRegen takes unit whichUnit returns real

	// Возвращает текущее значение регенерации HP юнита (без перерасчёта).
	// @arg unit whichUnit — целевой юнит
	// @return real — скорость регенерации здоровья
	native GetUnitMpRegen takes unit whichUnit returns real

	// Обновляет регенерацию HP юнита и возвращает новое значение.
	// @arg unit whichUnit — целевой юнит
	// @return real — новая скорость регенерации здоровья
	native UpdateUnitHpRegen takes unit whichUnit returns real

	// Обновляет регенерацию MP юнита и возвращает новое значение.
	// @arg unit whichUnit — целевой юнит
	// @return real — новая скорость регенерации маны
	native UpdateUnitMpRegen takes unit whichUnit returns real

	//=====================================
	//=========== SPELL GETTERS ===========

	// Getters Functions
	native GetSpellObject takes nothing returns integer
	native GetSpellOwnerUnit takes nothing returns unit
	native GetSpellDummyUnit takes nothing returns unit
	native GetSpellTargUnit takes nothing returns unit
	native GetSpellIsEntered takes nothing returns boolean
	native GetSpellIsOut takes nothing returns boolean
	native GetSpellActionsId takes nothing returns integer
	native GetSpellCompletion takes nothing returns real
	native GetSpellCountTargets takes nothing returns integer
	native GetSpellIsFocused takes nothing returns boolean
	native GetSpellX takes nothing returns real
	native GetSpellY takes nothing returns real
	native GetSpellIsBounce takes nothing returns boolean
	native GetSpellIsStopped takes nothing returns boolean
	native GetSpellIsCollide takes nothing returns boolean

	//==========================================
	//=========== STATIC PROJECTILES ===========
	native CreateStaticProjectile takes unit owner, unit target, unit projectile, integer actionsId, real speed, real maxHeight, real offsetZ, boolean canFocusLost returns StaticProjectile
	native CreateStaticProjectileFunc takes integer object, unit owner, unit target, unit projectile, string func, real speed, real maxHeight, real offsetZ, boolean canFocusLost returns StaticProjectile
	native CreateStaticProjectileAtFunc takes integer object, unit owner, real x, real y, unit projectile, string func, real speed, real maxHeight, real offsetZ returns StaticProjectile

	//=============================
	//=========== STUNS ===========

	// Event Getters
	native GetTriggerStun takes nothing returns Stun
	native GetStunningUnit takes nothing returns unit
	native GetStunnedUnit takes nothing returns unit
	native GetStunTypeId takes nothing returns integer
	native GetStunDuration takes nothing returns real
	native GetStunIsEnter takes nothing returns boolean
	native GetStunIsOut takes nothing returns boolean
	native GetStunIsFirst takes nothing returns boolean

	// Возвращает оставшееся время оглушения.
	//
	// @arg Stun `whichStun` оглушение.
	// @return real время оглушения.
	native GetStunRemainingTime takes Stun whichStun returns real

	// Возвращает оставшееся время оглушения указанного типа оглушения для юнита.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @arg integer `typeId` тип оглушения.
	// @return real время оглушения.
	native GetStunRemainingTimeByType takes unit stunned, integer typeId returns real

	// Проверяет, оглушен ли юнит исключая указанный тип оглушения.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @arg integer `typeId` исключаемый тип оглушения.
	// @return boolean `true` - если юнит оглушен исключая указанный тип, иначе - `false`.
	native IsUnitStunnedExceptType takes unit stunned, integer typeId returns boolean

	// Проверяет, оглушен ли юнит указанным типом оглушения.
	//
	// @arg unit `stunned` проверяемый юнит.
	// @arg integer `typeId` указанный тип оглушения.
	// @return boolean `true`, если юнит оглушен указанным типом, иначе `false`.
	native IsUnitStunnedByType takes unit stunned, integer typeId returns boolean

	// Проверяет, оглушен ли юнит.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @return boolean `true` - если юнит оглушен, иначе - `false`.
	native IsUnitStunned takes unit stunned returns boolean

	// Проверяет, реально оглушен ли юнит.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @return boolean `true` - если юнит оглушен, иначе - `false`.
	native IsUnitActuallyStunned takes unit stunned returns boolean

	// Удаляет оглушение указанного типа у юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно удалить оглушение.
	// @arg integer `typeId` тип оглушения для удаления.
	native RemoveUnitStunByType takes unit stunned, integer typeId returns nothing

	// Удаляет все оглушения у юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно удалить все оглушения.
	native RemoveUnitStun takes unit stunned returns nothing

	// Возвращает объект оглушения указанного типа для юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно получить оглушение.
	// @arg integer `typeId` тип оглушения который нужно получить.
	// @return object|0, `Stun` - оглушение указанного типа, или 0 - если такого оглушения нет.
	native GetUnitStunByType takes unit stunned, integer typeId returns Stun

	// Оглушает юнита на указанное время с учетом различных условий и модификаторов.
	//
	// @arg unit `stunningUnit` юнит, инициировавший оглушение.
	// @arg unit `stunnedUnit` целевой юнит, который нужно оглушить.
	// @arg integer `typeId` тип оглушения.
	// @arg real `duration` длительность оглушения.
	// @return object|0, `Stun` - возвращает объект оглушения, созданный или обновленный в результате выполнения функции, или 0 при отсутствии оглушения.
	//
	// Функция проверяет жив ли целевой юнит, имеет ли он иммунитет к оглушению и соответствует ли длительность нового оглушения текущему оглушению. Основываясь на этих проверках, функция либо создает новый объект оглушения, либо обновляет существующий.
	native StunUnit takes unit stunningUnit, unit stunnedUnit, integer typeId, real duration returns Stun

	//======================================
	//=========== SUMMATIVE TEXT ===========

	// Добавляет суммирующий текст к юниту для игрока
	// @arg player owner игрок, которому будет показан суммирующий текст
	// @arg unit target юнит, к которому будет добавлен суммирующий текст
	// @arg integer textType тип суммирующего текста
	// @arg real value значение суммирующего текста
	// @arg string prefix префикс суммирующего текста
	// @return SummativeText созданный суммирующий текст
	native AddSummativeTextToUnitForPlayer takes player owner, unit target, integer textType, real value, string prefix returns SummativeText

	// Показывает суммирующий текст для игрока
	// @arg SummativeText summativeText суммирующий текст, который нужно показать
	// @arg player participant игрок, которому нужно показать суммирующий текст
	// @return SummativeText суммирующий текст, который был показан
	native ShowSummativeTextToPlayer takes SummativeText summativeText, player participant returns nothing

	//==============================
	//=========== TALENT ===========
	native GetTalentHero takes nothing returns unit

	//==================================
	//=========== TECH UTILS ===========

	// Делает юнита летающим
	// @arg unit u
	// @return unit возвращает юнит, который стал летающим
	native MakeUnitFly takes unit u returns unit

	// Проверяет, находится ли точка за пределами карты
	// @arg real x координата X
	// @arg real y координата Y
	// @return boolean true, если точка находится за пределами карты
	native IsCoordsOut takes real x, real y returns boolean

	// Проверяет, неуявзим ли юнит
	// @arg unit u юнит, который нужно проверить
	// @return boolean true, если юнит неуязвим
	native IsUnitInvulnerable takes unit u returns boolean

	// Перебирает все юниты в радиусе с учётом их коллизии
	// @arg group whichGroup группа, в которую будут добавлены юниты
	// @arg real x координата X
	// @arg real y координата Y
	// @arg real r радиус
	// @arg boolexpr filter фильтр для юнитов
	native GroupEnumUnitsInRangeFiz takes group whichGroup, real x, real y, real r, boolexpr filter returns nothing

	// Устанавливает время жизни для эффекта
	// @arg effect eff эффект
	// @arg real endTime время жизни
	native EffectApplyTimedLife takes effect eff, real endTime returns nothing

	// Устанавливает время жизни для юнита
	// @arg unit u юнит
	// @arg real endTime время жизни
	// @return unit
	native UnitApplyTimeLife takes unit u, real endTime returns unit

	// Устанавливает время жизни для юнита с скрытием
	// @arg unit u юнит
	// @arg real endTime время жизни
	// @return unit
	native UnitApplyTimeLifeHide takes unit u, real endTime returns nothing

	// Применяет способность в точку
	// @arg unit whichUnit юнит, который применяет способность
	// @arg real x координата X
	// @arg real y координата Y
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @arg string order строка с приказом
	native ApplyAbility takes unit whichUnit, real x, real y, integer abilityId, integer abilityLvl, string order returns nothing

	// Применяет способность к юниту
	// @arg unit whichUnit юнит, который применяет способность
	// @arg unit targetUnit юнит, к которому применяется способность
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @arg string order строка с приказом
	native ApplyAbilityToUnit takes unit whichUnit, unit targetUnit, integer abilityId, integer abilityLvl, string order returns nothing

	// Атаковать юнита с помощью дамми-юнита
	// @arg player whichPlayer игрок, которому принадлежит дамми-юнит
	// @arg unit targetUnit юнит, которого атакуем
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @return unit возвращает дамми-юнит
	native DummyAttackUnit takes player whichPlayer, unit targetUnit, integer abilityId, integer abilityLvl returns unit

	// Проверяет, есть ли у юнита предмет с данного типа
	native UnitHasItemType takes unit whichUnit, integer itemId returns boolean

	// Подсчитывает количество предметов данного типа у юнита
	native CountUnitItemType takes unit whichUnit, integer itemId returns integer

	// Запускает звук для игрока
	// @arg sound snd звук, который нужно запустить
	// @arg player pl игрок, для которого запускаем звук
	native StartSoundToPlayer takes sound snd, player pl returns nothing

	// Возвращает цвет игрока в виде строки
	// @arg player whichplayer игрок, для которого получаем цвет
	// @return string цвет игрока в виде шестнадцатеричной строки
	native GetPlayerTextColor takes player whichplayer returns string

	// Добавляет способность юниту и делает её постоянной
	native UnitAddAbilityPermanent takes unit u, integer aId returns nothing

	// Проверяет, есть ли у юнита способность
	native UnitHasAbility takes unit whichUnit, integer abilityId returns boolean

	// Проверяет, находится ли юнит под хексом
	native IsUnitHexed takes unit u returns boolean

	// Безопасно вручает руну юниту
	// @arg unit u юнит
	// @arg integer id ID руны
	// @return boolean true, если руна успешно вручена
	native UnitAddPowerUpItem takes unit u, integer id returns boolean

	// Проверяет, есть ли у юнита талант
	native UnitHasTalent takes unit whichUnit, integer talentId returns boolean

	// Возвращает уровень таланта у юнита
	native GetUnitTalentLvl takes unit whichUnit, integer talentId returns integer

	// Проверяет, есть ли у юнита Мефисто
	native UnitHasMefisto takes unit whichUnit returns boolean

	// Возвращает процент жизни юнита
	native GetUnitLifePerc takes unit whichUnit returns real
	native LoadHandleDataInt takes handle object returns integer
	native SaveHandleDataInt takes handle object, integer data returns nothing
	native LoadHandleDataReal takes handle object returns real
	native SaveHandleDataReal takes handle object, real data returns nothing
	native LoadHandleDataUnit takes handle object returns unit
	native SaveHandleDataUnit takes handle object, unit data returns nothing
	native SaveHandleDataGroup takes handle object, group data returns nothing
	native LoadHandleDataGroup takes handle object returns group
	native FlushTimer takes timer tm returns nothing
	native FlushTrigger takes trigger trg returns nothing

	// Делает юнит неуязвимым
	// @arg unit whichUnit
	// @arg boolean flag true, если нужно сделать юнит неуязвимым, false - если нужно снять неуязвимость
	native MakeUnitInvulnerable takes unit whichUnit, boolean flag returns nothing

	// Проверяет, включен ли командный режим
	native IsTeamMode takes nothing returns boolean

	// Возвращает игрока-мастера команды
	native GetTeamMasterPlayer takes player whichPlayer returns player

	// Проверяет, находится ли игра в паузе
	native IsMapPaused takes nothing returns boolean

	// Проверяет, активна ли дуэль
	native IsMapDuel takes nothing returns boolean

	// Проверяет, является ли юнит даммиком
	// @arg unit whichUnit
	// @return boolean
	native IsUnitDummy takes unit whichUnit returns boolean

	// Возвращает группу игроков-наблюдателей дуэли
	native GetObserverForce takes nothing returns force

	//=====================================
	//=========== TEXTTAG UTILS ===========

	// Создаёт тексттаг, прикреплённый к юниту, и показывает его только тем, кто реально видит юнита
	// @arg unit target юнит, к которому привязывается текст
	// @arg string s текст, который будет отображаться
	// @arg real size размер текста
	// @arg real transparency прозрачность текста (0–100)
	// @arg real lifespan сколько времени живёт тексттаг
	// @arg real fadepoint когда начинает исчезать
	// @arg real lowSpeed минимальная скорость полёта
	// @arg real maxSpeed максимальная скорость полёта
	// @arg real lowAngle минимальный угол полёта
	// @arg real maxAngle максимальный угол полёта
	// @arg real zOffset смещение по Z от позиции юнита
	native CreateCustomTextToUnit takes unit target, string s, real size, real transparency, real lifespan, real fadepoint, real lowSpeed, real maxSpeed, real lowAngle, real maxAngle, real zOffset returns nothing

	// Создает тексттаг над юнитом с анимацией по параболе
	// @arg unit u юнит, к которому привязывается текст
	// @arg string s текст
	// @arg real sizeMin минимальный размер
	// @arg real sizeBonus добавочный размер (влияет на синусоиду)
	// @arg real timeLife время жизни
	// @arg real timeFade время затухания
	// @arg real zOffset высота над юнитом
	// @arg real lowSpeed минимальная скорость
	// @arg real maxSpeed максимальная скорость
	// @arg real lowAngle минимальный угол
	// @arg real maxAngle максимальный угол
	native CreateFlyingTextToUnit takes unit u, string s, real sizeMin, real sizeBonus, real timeLife, real timeFade, real zOffset, real lowSpeed, real maxSpeed, real lowAngle, real maxAngle returns nothing

	// Создаёт тексттаг с заданной скоростью и смещением, не зависящий от углов и случайностей
	// @arg unit target юнит, около которого появляется текст
	// @arg string text текст
	// @arg real lifespan продолжительность жизни
	// @arg real size размер
	// @arg real fadepoint точка начала исчезновения
	// @arg real velocity вертикальная скорость (вверх)
	// @arg real OffsetX смещение по X
	// @arg real OffsetY смещение по Y
	// @arg real OffsetZ смещение по Z
	native CreateCustomVelTextToUnit takes unit target, string text, real lifespan, real size, real fadepoint, real velocity, real OffsetX, real OffsetY, real OffsetZ returns nothing

	//=================================
	//=========== UNIT DATA ===========
	native Unit takes unit whichUnit returns UnitData

	//====================================
	//=========== UNIT UNSTUCK ===========

	// Проверяет, застрял ли юнит, и пытается его "вытолкнуть" на ближайшую проходимую точку
	// Проводит круговой обход по растущим радиусам вокруг юнита и телепортирует его в первую подходящую проходимую точку
	native CheckAndFreeUnit takes unit u returns nothing

	//====================================
	//=========== HASH CLEANER ===========
	native GetTriggerHandleId takes nothing returns integer

	//=============================
	//=========== ARMOR ===========
	native IsEvalDamage takes nothing returns boolean
	native SetIsEvalDamage takes boolean isEvalDamage returns nothing
	native EvalDamage takes unit whichUnit, unit target, real damage, attacktype attackType, damagetype damageType returns nothing
	native GetUnitArmorReduction takes unit u, unit attacking returns real
	native GetUnitSpellReduction takes unit u, unit attacking returns real
	native EvalArmor takes nothing returns boolean

	//===================================
	//=========== COORD UTILS ===========

	// Устанавливает позицию юнита с учетом возможных смещений, чтобы избежать резких скачков.
	//
	// @arg unit `source` юнит, позицию которого нужно установить.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	native SetUnitPositionSmooth takes unit source, real x, real y returns nothing

	// Вычисляет смещение координаты X на основе заданного расстояния и угла от точки.
	//
	// @arg real `x` начальная координата x.
	// @arg real `distance` расстояние от начальной точки.
	// @arg real `angle` угол в градусах.
	// @return real - результирующая координата x после применения полярного смещения.
	native GetPolarOffsetX takes real x, real distance, real angle returns real

	// Вычисляет смещение координаты Y на основе заданного расстояния и угла от точки.
	//
	// @arg real `y` начальная координата y.
	// @arg real `distance` расстояние от начальной точки.
	// @arg real `angle` угол в градусах.
	// @return real - результирующая координата y после применения полярного смещения.
	native GetPolarOffsetY takes real y, real distance, real angle returns real

	// Перемещает локацию на новую позицию на основе полярного смещения от ее текущей позиции.
	//
	// @arg location `target` локация для перемещения.
	// @arg real `distance` расстояние для перемещения локации.
	// @arg real `angle` угол в градусах для перемещения локации.
	native MoveLocationPolar takes location target, real distance, real angle returns nothing

	// Перемещает юнита на новую позицию на основе полярного смещения от его текущей позиции.
	//
	// @arg unit `target` юнит для перемещения.
	// @arg real `distance` расстояние для перемещения юнита.
	// @arg real `angle` угол в градусах для перемещения юнита.
	native SetUnitPositionPolar takes unit target, real distance, real angle returns nothing

	// Вычисляет угол между двумя наборами координат.
	//
	// @arg real `x1`, `y1` координаты первой точки.
	// @arg real `x2`, `y2` координаты второй точки.
	// @return real - угол в градусах между двумя точками.
	native AngleBetweenCoords takes real x1, real y1, real x2, real y2 returns real

	// Вычисляет 2D расстояние между двумя наборами координат.
	//
	// @arg real `x1`, `y1` координаты первой точки.
	// @arg real `x2`, `y2` координаты второй точки.
	// @return real - расстояние между двумя наборами координат.
	native DistanceBetweenCoords takes real x1, real y1, real x2, real y2 returns real

	// Вычисляет 3D расстояние между двумя наборами координат.
	//
	// @arg real `x1`, `y1`, `z1` координаты первой точки.
	// @arg real `x2`, `y2`, `z2` координаты второй точки.
	// @return real - 3D расстояние между двумя наборами координат.
	native DistanceBetweenCoords3D takes real x1, real y1, real z1, real x2, real y2, real z2 returns real

	// Вычисляет расстояние между двумя юнитами.
	//
	// @arg unit `target1` первый юнит.
	// @arg unit `target2` второй юнит.
	// @return real - расстояние между двумя юнитами.
	native DistanceBetweenUnits takes unit target1, unit target2 returns real

	// Вычисляет угол между двумя юнитами.
	//
	// @arg unit `target1` первый юнит.
	// @arg unit `target2` второй юнит.
	// @return real - угол в градусах между двумя юнитами.
	native AngleBetweenUnits takes unit target1, unit target2 returns real

	// Вычисляет расстояние между двумя виджетами.
	//
	// @arg widget `target1` первый виджет.
	// @arg widget `target2` второй виджет.
	// @return real - расстояние между двумя виджетами.
	native DistanceBetweenWidgets takes widget target1, widget target2 returns real

	// Вычисляет угол между двумя виджетами.
	//
	// @arg widget `target1` первый виджет.
	// @arg widget `target2` второй виджет.
	// @return real - угол в градусах между двумя виджетами.
	native AngleBetweenWidgets takes widget target1, widget target2 returns real

	// Получает высоту местности по заданным координатам.
	//
	// @arg real `x`, `y` координаты, для которых нужно получить высоту местности.
	// @return real - высота местности по заданным координатам.
	native GetTerrainZ takes real x, real y returns real
	native GetUnitTerrainCliffLevel takes unit target returns integer

	// Получает общую высоту (высота местности + высота полета) юнита.
	//
	// @arg unit `target` целевой юнит.
	// @return real - общая высота юнита на его текущей позиции.
	native GetUnitZ takes unit target returns real

	// Добавляет способность AbilityUnitZ юниту, если он ее еще не имеет.
	//
	// @arg unit `target` целевой юнит.
	native UnitAddAbilityZ takes unit target returns nothing

	// Удаляет способность AbilityUnitZ у указанного юнита, если она присутствует.
	//
	// @arg unit `target` юнит, у которого необходимо удалить способность.
	native UnitRemoveAbilityZ takes unit target returns nothing

	// Устанавливает высоту полета для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить высоту.
	// @arg real `z` новая высота полета.
	// @return unit - возвращает тот же юнит после установки новой высоты.
	native SetUnitZ takes unit target, real z returns unit

	// Устанавливает координаты X и Y для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить координаты.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @return unit - возвращает тот же юнит после установки новых координат.
	native SetUnitXY takes unit target, real x, real y returns unit

	// Устанавливает координаты X, Y и высоту полета Z для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить координаты и высоту.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @arg real `z` новая высота полета.
	// @return unit - возвращает тот же юнит после установки новых параметров.
	native SetUnitXYZ takes unit target, real x, real y, real z returns unit

	// Устанавливает координаты X, Y, высоту полета Z и направление (угол поворота) для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить параметры.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @arg real `z` новая высота полета.
	// @arg real `f` новое направление (угол поворота в градусах).
	// @return unit - возвращает тот же юнит после установки новых параметров.
	native SetUnitXYZF takes unit target, real x, real y, real z, real f returns unit

	// Находит длину перпендикуляра от отрезка, заданного Xa, Ya, Xb, Yb к точке, заданной Xc, Yc.
	// https://xgm.guru/p/wc3/perpendicular
	//
	// @arg real `Xa` координата X первой точки отрезка.
	// @arg real `Ya` координата Y первой точки отрезка.
	// @arg real `Xb` координата X второй точки отрезка.
	// @arg real `Yb` координата Y второй точки отрезка.
	// @arg real `Xc` координата X точки C.
	// @arg real `Yc` координата Y точки C.
	// @return real - возвращает длину перпендикуляра от точки C к отрезку AB.
	native Perpendicular takes real Xa, real Ya, real Xb, real Yb, real Xc, real Yc returns real

	// Вычисляет разницу между двумя углами.
	// https://xgm.guru/p/wc3/warden-math
	//
	// @arg real `a1` первый угол в градусах.
	// @arg real `a2` второй угол в градусах.
	// @return real - возвращает абсолютное значение разницы между двумя углами.
	native AngleDifference takes real a1, real a2 returns real

	// Вычисляет высоту для параболической кривой на основе заданных параметров.
	//
	// @arg real `h` максимальная высота на середине расстояния.
	// @arg real `d` общее расстояние до цели.
	// @arg real `x` расстояние от исходной цели до точки.
	// @return real - возвращает вычисленную высоту для заданной точки на параболической кривой.
	native ParabolaZ takes real h, real d, real x returns real

	// Вычисляет высоту для модифицированной параболической кривой на основе заданных параметров.
	//
	// @arg real `zs` начальная высота одного края дуги.
	// @arg real `ze` конечная высота другого края дуги.
	// @arg real `h` максимальная высота на середине расстояния.
	// @arg real `d` общее расстояние до цели.
	// @arg real `x` расстояние от исходной цели до точки.
	// @return real - возвращает вычисленную высоту для заданной точки на модифицированной параболической кривой.
	native ParabolaZ2 takes real zs, real ze, real h, real d, real x returns real

	// Нормализует угол, приводя его к диапазону [0, 360).
	//
	// @arg real `angle` угол для нормализации.
	// @return real - возвращает нормализованный угол.
	native AngleNormalize takes real angle returns real
	native AngleTowards takes real angle, real toAngel, real angleOffset returns real

	// Вычисляет площадь треугольника по координатам его вершин.
	//
	// @arg real `x1, y1` координаты первой вершины.
	// @arg real `x2, y2` координаты второй вершины.
	// @arg real `x3, y3` координаты третьей вершины.
	// @return real - возвращает площадь треугольника.
	native TriS takes real x1, real y1, real x2, real y2, real x3, real y3 returns real

	// Проверяет, находятся ли координаты внутри треугольника.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3` координаты вершин треугольника.
	// @return boolean - возвращает true, если точка внутри треугольника, иначе false.
	native IsCoordsInTriangle takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3 returns boolean

	// Проверяет, находятся ли координаты внутри четырехугольника с использованием простого метода.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3, x4, y4` координаты вершин четырехугольника.
	// @return boolean - возвращает true, если точка внутри четырехугольника, иначе false.
	native IsCoordsIn4GonSimple takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns boolean

	// Проверяет, находятся ли координаты внутри четырехугольника.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3, x4, y4` координаты вершин четырехугольника.
	// @return boolean - возвращает true, если точка внутри четырехугольника, иначе false.
	native IsCoordsIn4Gon takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns boolean
	native BezierCurvePow2_xyz_xyz_xyz takes real x, real y, real z, real x1, real y1, real z1, real x2, real y2, real z2, real time returns nothing

	//=============================
	//=========== DEBUG ===========

	// Отладка на уровне "info": общая информация.
	// @arg string msg сообщение для логирования
	native Debug takes string msg returns nothing

	// Показать текстовую метку в координатах, полезно для отладки
	// @arg string s текст для отображения
	// @arg real x позиция по X
	// @arg real y позиция по Y
	native DebugXY takes string s, real x, real y returns nothing

	// Отладка на уровне "warning": потенциальные проблемы.
	// @arg string id идентификатор предупреждения
	// @arg string msg сообщение предупреждения
	native Warning takes string id, string msg returns nothing

	// Отладка на уровне "error": серьёзные ошибки.
	// @arg string id идентификатор ошибки
	// @arg string msg подробное сообщение об ошибке
	native Error takes string id, string msg returns nothing

	//============================
	//=========== MATH ===========

	// Проверяет, что строка состоит только из цифр 0–9 и не пуста
	// @arg string s строка для проверки
	// @return boolean true, если всё цифры
	native StringIsNumeric takes string s returns boolean

	// Возвращает знак числа
	// @arg integer z число для проверки
	// @return integer -1, 0 или 1
	native SignInt takes integer z returns integer

	// Возвращает знак числа
	// @arg real z число для проверки
	// @return integer -1, 0 или 1
	native SignReal takes real z returns integer

	// Возвращает абсолютное значение числа
	// @arg integer z число для проверки
	// @return integer абсолютное значение числа
	native AbsInt takes integer z returns integer

	// Возвращает абсолютное значение числа
	// @arg real z число для проверки
	// @return real абсолютное значение числа
	native AbsReal takes real z returns real

	// Возвращает максимальное значение из двух чисел
	// @arg integer z1 первое число
	// @arg integer z2 второе число
	// @return integer максимальное значение
	native MaxInt takes integer z1, integer z2 returns integer

	// Возвращает максимальное значение из двух чисел
	// @arg real z1 первое число
	// @arg real z2 второе число
	// @return real максимальное значение
	native MaxReal takes real z1, real z2 returns real

	// Возвращает минимальное значение из двух чисел
	// @arg integer z1 первое число
	// @arg integer z2 второе число
	// @return integer минимальное значение
	native MinInt takes integer z1, integer z2 returns integer

	// Возвращает минимальное значение из двух чисел
	// @arg real z1 первое число
	// @arg real z2 второе число
	// @return real минимальное значение
	native MinReal takes real z1, real z2 returns real

	// Проверяет, что разница между двумя числами больше заданного значения
	// @arg real a первое число
	// @arg real b второе число
	// @arg real diff минимальная разница
	native IsDifferenceMore takes real a, real b, real diff returns boolean

	// Проверяет, что число чётное
	// @arg integer a число для проверки
	// @return boolean
	native IsEven takes integer a returns boolean

	// Проверяет, что число нечётное
	// @arg integer a число для проверки
	// @return boolean
	native IsOdd takes integer a returns boolean

	// Проверяет, что число делится на N
	// @arg integer a число для проверки
	// @arg integer n делитель
	// @return boolean
	native IsDivisibleByN takes integer a, integer n returns boolean

	// Проверяет, что число не делится на N
	// @arg integer a число для проверки
	// @arg integer n делитель
	// @return boolean
	native IsNotDivisibleByN takes integer a, integer n returns boolean

	// Возвращает остаток от деления числа на N
	// @arg integer a число для проверки
	// @arg integer n делитель
	// @return integer остаток от деления
	native ModuloN takes integer a, integer n returns integer

	// Возвращает положительный остаток от деления числа на N
	// @arg integer a число для проверки
	// @arg integer n делитель
	// @return integer положительный остаток от деления
	native ModuloNPos takes integer a, integer n returns integer

	// Округляет число вниз до ближайшего целого
	// @arg real r число для округления
	// @return integer округлённое число
	native Floor takes real r returns integer

	// Округляет число вверх до ближайшего целого
	// @arg real r число для округления
	// @return integer округлённое число
	native Ceil takes real r returns integer

	// Округляет число до ближайшего целого
	// @arg real r число для округления
	// @return integer округлённое число
	native R2Idown takes real r returns integer

	// Округляет число до ближайшего целого
	// @arg real r число для округления
	// @return integer округлённое число
	native R2Iup takes real r returns integer

	// Округляет число до ближайшего чётного целого
	// @arg real r число для округления
	// @return integer округлённое число
	native R2Ieven takes real r returns integer

	// Преобразует логическое значение в целое
	// @arg boolean b логическое значение
	// @return integer 1, если true, иначе 0
	native B2I takes boolean b returns integer

	// Преобразует логическое значение в целое
	// @arg boolean b логическое значение
	// @return integer 1, если true, иначе -1
	native B2Ineg takes boolean b returns integer

	// Преобразует целое в логическое значение
	// @arg integer i целое значение
	// @return boolean true, если i не равно 0, иначе false
	native I2B takes integer i returns boolean

	// Проверяет, что идентификатор не равен 0
	// @arg integer i идентификатор для проверки
	// @return boolean true, если идентификатор не равен 0
	native IsSet takes integer i returns boolean

	// Возвращает степень числа i в степени n
	// @arg integer i число для возведения в степень
	// @arg integer n степень, в которую нужно возвести число
	// @return integer результат возведения в степень
	native PowerN takes integer i, integer n returns integer
	native Ln takes real r returns real

	// Возвращает логарифм числа r по основанию 2
	// @arg real r число, для которого нужно найти логарифм
	// @return real логарифм числа r по основанию 2
	native Log2 takes real r returns real

	// Возвращает логарифм числа r по основанию 2
	// @arg real r число, для которого нужно найти логарифм
	// @return real логарифм числа r по основанию 2
	native Log10 takes real r returns real

	// Возвращает логарифм числа r по основанию base
	// @arg real r число, для которого нужно найти логарифм
	// @arg real base основание логарифма
	// @return real логарифм числа r по основанию base
	native Log takes real r, real base returns real

	// Возвращает строковое представление логического значения
	// @arg boolean bool логическое значение
	// @return string "Да", если true, иначе "Нет"
	native GetBooleanValue takes boolean bool returns string

	//=====================================
	//=========== NEGATE DAMAGE ===========

	// Возвращает максимальное здоровье юнита
	// @arg unit u юнит, для которого нужно получить максимальное здоровье
	// @return real максимальное здоровье юнита
	native GetUnitMaxLife takes unit u returns real

	// Возвращает значение состояния юнита
	// @arg unit u юнит, для которого нужно получить значение состояния
	// @arg unitstate state значение состояния юнита
	// @return real значение состояния юнита
	native GetUnitStateHook takes unit u, unitstate state returns real

	// Возвращает процент состояния юнита
	// @arg unit whichUnit юнит, для которого нужно получить процент состояния
	// @arg unitstate whichState состояние юнита
	// @arg unitstate whichMaxState максимальное состояние юнита
	// @return real процент состояния юнита
	native GetUnitStatePercentHook takes unit whichUnit, unitstate whichState, unitstate whichMaxState returns real

	// Возвращает процент здоровья юнита
	// @arg unit whichUnit юнит, для которого нужно получить процент здоровья
	// @return real процент здоровья юнита
	native GetUnitLifePercentHook takes unit whichUnit returns real
	native NegateDamage takes unit u, real negated returns nothing

	//=================================
	//=========== RECTANGLE ===========

	// Перебирает все юниты в прямоугольнике с учётом коллизии
	// @arg group whichGroup группа, в которую будут добавлены юниты
	// @arg real centerX координата центра прямоугольника по X
	// @arg real centerY координата центра прямоугольника по Y
	// @arg real width ширина прямоугольника
	// @arg real height высота прямоугольника
	// @arg real radians угол поворота прямоугольника в радианах
	// @arg boolexpr filter фильтр для юнитов, которые будут добавлены в группу
	native GroupEnumUnitsInRectangleCollision takes group whichGroup, real centerX, real centerY, real width, real height, real radians, boolexpr filter returns nothing

	//==========================================
	//=========== SET UNIT MAX STATE ===========

	// Устанавливает максимальное значение состояния юнита
	// @arg unit whichUnit юнит, для которого нужно установить максимальное состояние
	// @arg unitstate whichUnitState состояние юнита
	// @arg integer newVal новое значение состояния юнита
	// @return boolean true, если состояние было успешно установлено
	native SetUnitMaxState takes unit whichUnit, unitstate whichUnitState, integer newVal returns boolean
	native AddUnitSight takes unit whichUnit, integer newVal returns boolean

	//==================================
	//=========== SMART LOOP ===========

	// Инициализирует начало цикла
	// @arg integer start начальное значение цикла
	native InitSmartLoopStart takes integer start returns nothing

	// Инициализирует конец цикла
	// @arg integer end конечное значение цикла
	native InitSmartLoopEnd takes integer end returns nothing

	// Инициализирует цикл с заданным начальным и конечным значением
	// @arg integer start начальное значение цикла
	// @arg integer end конечное значение цикла
	native InitSmartLoop takes integer start, integer end returns nothing

	// Возвращает текущий индекс цикла
	// @return integer текущий индекс цикла
	native GetSmartLoopIndex takes nothing returns integer

	// Возвращает конечный индекс цикла
	// @return integer конечный индекс цикла
	native GetSmartLoopIndexEnd takes nothing returns integer

	// Увеличивает текущий индекс цикла на заданное значение
	// @arg integer step шаг увеличения индекса
	native PlusSmartLoopIndex takes integer step returns nothing

	// Конец цикла
	native EndSmartLoop takes nothing returns nothing

	//====================================
	//=========== UNIT DAMAGED ===========
	native AnyUnitDamagedEvent takes trigger toTrigger returns nothing

	//==================================
	//=========== VECTOR API ===========
	native AngleBetweenVectors takes Vec3 first, Vec3 second returns real
	native DotProduct takes Vec3 first, Vec3 second returns real
	native CrossProduct takes Vec3 edge1, Vec3 edge2 returns Vec3
	native VectorSum takes Vec3 summand1, Vec3 summand2 returns Vec3
	native VectorSub takes Vec3 minuend, Vec3 subtrahend returns Vec3
	native VectorMult takes Vec3 multiplied, real multipler returns Vec3
	native VectorDiv takes Vec3 dividend, real divisor returns Vec3
	native TriangleNormal takes Vec3 a, Vec3 b, Vec3 c returns Vec3
	native TerrainNormal takes real x, real y returns Vec3
	native ReflectVector takes Vec3 toReflect, Vec3 normal returns nothing
	native ReflectVectorTerrain takes Vec3 toReflect, real x, real y returns nothing

	//=====================================
	//=========== AURAS FILTERS ===========

	//GetAuraOwnerUnit() - владелец ауры
	//filterUnit - цель ауры
	native FilterRadiance takes nothing returns boolean
	native FilterLinx5 takes nothing returns boolean
	native FilterPourSpell takes nothing returns boolean
	native FilterAuraEnemy takes nothing returns boolean
	native FilterAuraAllnotOwned takes nothing returns boolean
	native FilterSelf takes nothing returns boolean
	native FilterAuraEnemyHero takes nothing returns boolean
	native FilterAuraAlly takes nothing returns boolean
	native FilterOnlyAlly takes nothing returns boolean
	native FilterAuraRotto takes nothing returns boolean
	native FilterAuraMarcus takes nothing returns boolean
	native FilterMikuOwl takes nothing returns boolean

	//====================================
	//=========== BUFF FILTERS ===========
	native FilterNegativeBuff takes nothing returns nothing
	native FilterPositiveNormalBuff takes nothing returns nothing

	//======================================
	//=========== MODIFIERS LIST ===========
	native IsModifierAdditive takes integer modifier returns boolean
	native IsModifierMultiplicative takes integer modifier returns boolean
	native IsModifierPercentage takes integer modifier returns boolean
	native IsModifierNonStacking takes integer modifier returns boolean

	//============================================
	//=========== MULTI MODIFIERS LIST ===========
	native IsMultiModifierNonStacking takes integer modifier returns boolean
	native IsMultiModifierNonStackType takes integer modifier returns boolean
	native IsMultiModifierAbsolute takes integer modifier returns boolean
	native IsMultiModifierTypeModRange takes integer typeMod returns boolean

	//==================================
	//=========== CHAIN HEAL ===========
	native CastChainHeal takes unit caster, unit target, real value, real reduction, integer countTargets, real radius returns nothing

	//=======================================
	//=========== CHAIN LIGHTNING ===========
	native CastChainLightning takes unit caster, unit target, real value, real reduction, integer countTargets, real radius returns nothing

	//===============================
	//=========== CHAKRAM ===========
	native CastChakram takes unit owner, unit target, integer chakramId, real dmg, real reduction, integer countTargets, real radius, real speed, boolean isAttack, boolean isSpec, integer actionsId returns nothing

	//===============================
	//=========== FILTERS ===========
	native FilterCleave takes nothing returns boolean
	native FilterSplash takes nothing returns boolean
	native FilterRectangleSplash takes nothing returns boolean
	native FilterAbsorb takes nothing returns boolean
	native FilterLightning takes nothing returns boolean
	native SimpleSpell takes nothing returns boolean
	native FilterEnemyNotImmune takes nothing returns boolean
	native FilterAlly takes nothing returns boolean
	native FilterAll takes nothing returns boolean
	native FilterAllMoveable takes nothing returns boolean
	native FilterPause takes nothing returns boolean
	native FilterAeon4 takes nothing returns boolean
	native FilterShiva takes nothing returns boolean

	//==============================
	//=========== HAMMER ===========
	native CastHammer takes unit owner, unit target, integer hammerId, real dmg, real reduction, integer countTargets, real range, real speed, boolean isAttack, boolean isSpec, integer actionsId returns nothing

	//======================================
	//=========== MASS LIGHTNING ===========

	//Разветленная молния
	native CastLightning takes unit caster, unit target, real value, real angle, integer countTargets, real radius returns nothing

	//========================================
	//=========== RECTANGLE SPLASH ===========
	native RectangleSplash takes unit owner, unit target, real dmg, real percentdmg, real length, real width returns nothing

	//============================
	//=========== HOPE ===========
	native onInit takes nothing returns nothing

	//============================
	//=========== HORT ===========
	native HortArena takes unit owner returns nothing

	//============================
	//=========== NOMI ===========
	native RandomSwap takes unit caster returns nothing

	//========================================
	//=========== STANLEY MISSILES ===========
	native StanleyMissiles takes unit owner returns nothing

	//===============================
	//=========== WITCHER ===========
	native StartTrackedForWitcher takes unit witcher returns nothing
