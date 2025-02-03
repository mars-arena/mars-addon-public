library TechUtils initializer init uses HashId, CoordUtils

	globals
		string array color[30]
		integer array MODIFIERS[40]
		string array MODIFIERS_NAME[40]
		integer array MULTI_MODIFIERS[40]
		string array MULTI_MODIFIERS_NAME[40]
		integer array HexAbilityId[MAX_HEXES]
		integer array HexBuffId[MAX_HEXES]
		group INIT_UNITS
		key INT_HID
		key REAL_HID
		key UNIT_HID
		key GROUP_HID
		key INVUL_HID
	endglobals
	
	//Делает юнита летающим
	function MakeUnitFly takes unit u returns unit
		call UnitAddAbility(u , 'Aave')
		call UnitRemoveAbility(u , 'Aave')
		return u
	endfunction

	//Проверяем не вылетел ли снаряд за пределы карты
	function Out takes real x, real y returns boolean
		return ((GetRectMinX(bj_mapInitialPlayableArea)<=x)and(x<=GetRectMaxX(bj_mapInitialPlayableArea))and(GetRectMinY(bj_mapInitialPlayableArea)<=y)and(y<=GetRectMaxY(bj_mapInitialPlayableArea))) or IsTerrainPathable(x,y, PATHING_TYPE_WALKABILITY)==false
	endfunction

	//Определение неуязвимости
	function IsUnitInvulnerable takes unit u returns boolean
		return GetUnitAbilityLevel(u, 'Avul') > 0 or GetUnitAbilityLevel(u, 'A1XU') > 0 or GetUnitAbilityLevel(u, 'A1T5') > 0 or GetUnitAbilityLevel(u, 'A1QG') > 0 or GetUnitAbilityLevel(u, 'A228') > 0 or GetUnitAbilityLevel(u, 'A20N') > 0 or GetUnitAbilityLevel(u, INVUL_ABILITY_ID) > 0
	endfunction
	
	//Добавление юнитов в группу, с учётом их физ. размера\\
	globals
		private group GroupEnumG = CreateGroup()
	endglobals
	
	function GroupEnumUnitsInRangeFiz takes group whichGroup, real x, real y, real r, boolexpr filter returns nothing
		local unit u
		call GroupClear(GroupEnumG)
		call GroupEnumUnitsInRange(GroupEnumG, x, y, r + 100, filter)
		loop
			set u = FirstOfGroup(GroupEnumG) 
			exitwhen(u == null)
			call GroupRemoveUnit(GroupEnumG, u) 
			if IsUnitInRangeXY(u, x, y, r) then
				call GroupAddUnit(whichGroup, u)
			endif
		endloop 
		set u = null
	endfunction
	//\\
	
	//Применяет время жизни для эффекта\\
	private function EffectApplyTimedLifeEnd takes nothing returns nothing
		local integer tmId = GetHandleId(GetExpiredTimer())
		call DestroyEffect(LoadEffectHandle(HT, tmId, 0))
		call FlushChildHashtable(HT, tmId)
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endfunction
	
	
	function EffectApplyTimedLife takes effect eff, real endTime returns nothing
		local timer tm = CreateTimer()
		call SaveEffectHandle(HT, GetHandleId(tm), 0, eff)
		call TimerStart(tm, endTime, false, function EffectApplyTimedLifeEnd)
		set tm = null
	endfunction
	//\\
	
	//Применяет время жизни для юнита\\
	private function UnitApplyTimeLifeEnd takes nothing returns nothing
		local integer tmId = GetHandleId(GetExpiredTimer())
		call KillUnit(LoadUnitHandle(HT, tmId, 0))
		call FlushChildHashtable(HT, tmId)
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endfunction
	
	
	function UnitApplyTimeLife takes unit u, real endTime returns unit
		local timer tm = CreateTimer()
		call SaveUnitHandle(HT, GetHandleId(tm), 0, u)
		call TimerStart(tm, endTime, false, function UnitApplyTimeLifeEnd)
		set tm = null
		return u
	endfunction
	//\\
	
	//Применяет время жизни для юнита со скрытием\\
	private function UnitApplyTimeLifeEndHide takes nothing returns nothing
		local integer tmId = GetHandleId(GetExpiredTimer())
		call KillUnit(LoadUnitHandle(HT, tmId, 0))
		call ShowUnit(LoadUnitHandle(HT, tmId, 0), false)
		call FlushChildHashtable(HT, tmId)
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endfunction
	
	
	function UnitApplyTimeLifeHide takes unit u, real endTime returns nothing
		local timer tm = CreateTimer()
		call SaveUnitHandle(HT, GetHandleId(tm), 0, u)
		call TimerStart(tm, endTime, false, function UnitApplyTimeLifeEndHide)
		set tm = null
	endfunction
	//\\
	
	//Применяет способность в точку\\
	private function ApplyAbilityEnd takes nothing returns nothing
		local integer tmId = GetHandleId(GetExpiredTimer())
		call KillUnit(LoadUnitHandle(HT, tmId, 0))
		call FlushChildHashtable(HT, tmId)
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endfunction
	
	function ApplyAbility takes unit whichUnit, real x, real y, integer abilityId, integer abilityLvl, string order returns nothing
		local unit dummy = CreateUnit(GetOwningPlayer(whichUnit), DUMMY_ID, GetUnitX(whichUnit), GetUnitY(whichUnit), 360.)
		local timer tm = CreateTimer()
		call SaveUnitHandle(HT, GetHandleId(tm), 0, dummy)
		call UnitAddAbility(dummy, abilityId)
		call SetUnitAbilityLevel(dummy, abilityId, abilityLvl)
		call IssuePointOrder(dummy, order, x, y)
		call TimerStart(tm, 2, false, function ApplyAbilityEnd)
		set tm = null
		set dummy = null
	endfunction
	
	//Применяет способность для юнита\\
	function ApplyAbilityToUnit takes unit whichUnit, unit targetUnit, integer abilityId, integer abilityLvl, string order returns nothing
		local unit dummy = CreateUnit(GetOwningPlayer(whichUnit), DUMMY_ID, GetUnitX(whichUnit), GetUnitY(whichUnit), 360.)
		local timer tm = CreateTimer()
		call SaveUnitHandle(HT, GetHandleId(tm), 0, dummy)
		call UnitAddAbility(dummy, abilityId)
		call SetUnitAbilityLevel(dummy, abilityId, abilityLvl)
		call IssueTargetOrder(dummy, order, targetUnit)
		call TimerStart(tm, 2, false, function ApplyAbilityEnd)
		set tm = null
		set dummy = null
	endfunction
	//\\
	
	globals
		key UNIT_DUMMY_HID
	endglobals
	
	//Атакаовать юнита даммиком\\
	function DummyAttackUnit takes player whichPlayer, unit targetUnit, integer abilityId, integer abilityLvl returns unit
		local unit dummy = CreateUnit(whichPlayer, DUMMY_ATC_ID, GetUnitX(targetUnit), GetUnitY(targetUnit), 360.)
		local boolean b = false
		call UnitAddAbility(dummy, abilityId)
		call SetUnitAbilityLevel(dummy, abilityId, abilityLvl)
		set b = IssueTargetOrder(dummy, "attack", targetUnit)
		call SaveUnitHandle(HT, GetHandleId(dummy), UNIT_DUMMY_HID, targetUnit)
		call UnitApplyTimedLife(dummy, 'BOsf', 1)
		if (not b) then
			call KillUnit(dummy)
		endif
		set ReturnedUnit = dummy
		set dummy = null
		return ReturnedUnit
	endfunction
	//\\
	
	//Есть ли у юнита предмет типа
	function UnitHasItemType takes unit whichUnit, integer itemId returns boolean
		local integer index
		set index = 0
		loop
			if (UnitItemInSlot(whichUnit, index) != null) and (GetItemTypeId(UnitItemInSlot(whichUnit, index)) == itemId) then
				return true
			endif
			set index = index + 1
			exitwhen index >= bj_MAX_INVENTORY
		endloop
		return false
	endfunction

	//Количество предметов типа
	function CountUnitItemType takes unit whichUnit, integer itemId returns integer
		local integer index
		local integer count
		set index = 0
		set count = 0
		loop
			if (UnitItemInSlot(whichUnit, index) != null) and (GetItemTypeId(UnitItemInSlot(whichUnit, index)) == itemId) then
				set count = count + 1
			endif
			set index = index + 1
			exitwhen index >= bj_MAX_INVENTORY
		endloop
		return count
	endfunction
	
	//Звук для игрока
	function StartSoundToPlayer takes sound snd, player pl returns nothing
		if (GetLocalPlayer() == pl)then
			call StartSound(snd)
		endif
	endfunction
	
	//Возвращает цвет игрока
	function GetPlayerTextColor takes player whichplayer returns string
		local playercolor colorL = GetPlayerColor(whichplayer)
		if (colorL == PLAYER_COLOR_RED) then
			return "FF0303" 
		endif
		if (colorL == PLAYER_COLOR_BLUE) then
			return "0042FF" 
		endif
		if (colorL == PLAYER_COLOR_CYAN) then
			return "1CE6B9" 
		endif
		if (colorL == PLAYER_COLOR_PURPLE) then
			return "540081" 
		endif
		if (colorL == PLAYER_COLOR_YELLOW) then
			return "FFFC01" 
		endif
		if (colorL == PLAYER_COLOR_ORANGE) then
			return "FEBA0E" 
		endif
		if (colorL == PLAYER_COLOR_GREEN) then 
			return "20C000" 
		endif
		if (colorL == PLAYER_COLOR_PINK) then 
			return "E55BB0" 
		endif
		if (colorL == PLAYER_COLOR_LIGHT_GRAY) then 
			return "959697" 
		endif
		if (colorL == PLAYER_COLOR_LIGHT_BLUE) then
			return "7EBFF1"
		endif
		if (colorL == PLAYER_COLOR_AQUA) then
			return "106246"
		endif
		if (colorL == PLAYER_COLOR_BROWN) then
			return "4E2A04"
		endif
		return "error"
	endfunction
	
	//Добавление перманентной абилки юниту
	function UnitAddAbilityPermanent takes unit u, integer aId returns nothing
		call UnitAddAbility(u, aId)
		call UnitMakeAbilityPermanent(u, true, aId)
	endfunction

	//Есть ли у юнита способность
	function UnitHasAbility takes unit whichUnit, integer abilityId returns boolean
		return GetUnitAbilityLevel(whichUnit, abilityId) > 0
	endfunction

	function IsUnitHexed takes unit u returns boolean
		return IsUnitType(u, UNIT_TYPE_POLYMORPHED)
	endfunction

	//Вручение рун юниту
	function UnitAddPowerUpItem takes unit u, integer id returns boolean
		local item it
		local boolean invAdded = false
		local boolean added = true
		local integer hex = 0
		local boolean isPaused = false
		local boolean isDoomed = false
		local integer i
		set i = 1

		loop
			if UnitHasAbility(u, HexBuffId[i]) then
				call UnitRemoveAbility(u, HexBuffId[i])
				set hex = i
				exitwhen true
			endif

			set i = i + 1
			exitwhen i >= MAX_HEXES
		endloop

		if UnitHasAbility(u, 'B05O') then
			call UnitRemoveAbility(u, 'B05O')
			set isDoomed = true
		endif

		if IsUnitPaused(u) then
			call PauseUnit(u, false)
			set isPaused = true
		endif

		set it = CreateItem(id, GetUnitX( u ), GetUnitY( u ))
		if GetUnitAbilityLevel(u, INV_ID) == 0 then
			set invAdded = true
			call UnitAddAbility(u, INV_ID)
		endif
		
		if UnitAddItem(u, it) == false then
			set added = false
		elseif GetWidgetLife(it) > 0.00 then
			set added = false
		endif
		
		if not added then
			call dbgT(GetUnitName(u) + " X " + GetItemName(it))
		endif

		call RemoveItem(it)
		
		if invAdded then
			call UnitRemoveAbility(u, INV_ID)
		endif

		if hex > 0 then
			call ApplyAbilityToUnit(u, u, HexAbilityId[hex], 1, "hex")
		endif

		if isPaused then
			call PauseUnit(u, true)
		endif

		if isDoomed then
			call ApplyAbilityToUnit(u, u, 'A1FX', 1, "doom")
		endif

		set it = null
		return added
	endfunction

	//Есть ли у юнита талант
	function UnitHasTalent takes unit whichUnit, integer talentId returns boolean
		return GetUnitAbilityLevel(udg_Talent_Tree[GetPlayerId(GetOwningPlayer(whichUnit)) + 1], talentId) > 0
	endfunction

	//возвращает уровень таланта юнита
	function GetUnitTalentLvl takes unit whichUnit, integer talentId returns integer
		return GetUnitAbilityLevel(udg_Talent_Tree[GetPlayerId(GetOwningPlayer(whichUnit)) + 1], talentId)
	endfunction

	//Есть ли у юнита мефисто
	function UnitHasMefisto takes unit whichUnit returns boolean
		return GetUnitAbilityLevel(whichUnit, MEFISTO_ID) > 0 or GetUnitAbilityLevel(whichUnit, 'A0P7') > 0
	endfunction

	function GetUnitLifePerc takes unit whichUnit returns real
		local real maxLife = GetUnitMaxLife(whichUnit)
		if (whichUnit == null) or (maxLife == 0) then
			return 0.0
		endif
		return GetWidgetLife(whichUnit) / maxLife * 100.0
	endfunction

	function LoadHandleDataInt takes handle object returns integer
		return LoadInteger(HT, GetHandleId(object), INT_HID)
	endfunction

	function SaveHandleDataInt takes handle object, integer data returns nothing
		call SaveInteger(HT, GetHandleId(object), INT_HID, data)
	endfunction

	function LoadHandleDataReal takes handle object returns real
		return LoadReal(HT, GetHandleId(object), REAL_HID)
	endfunction

	function SaveHandleDataReal takes handle object, real data returns nothing
		call SaveReal(HT, GetHandleId(object), REAL_HID, data)
	endfunction

	function LoadHandleDataUnit takes handle object returns unit
		return LoadUnitHandle(HT, GetHandleId(object), UNIT_HID)
	endfunction

	function SaveHandleDataUnit takes handle object, unit data returns nothing
		call SaveUnitHandle(HT, GetHandleId(object), UNIT_HID, data)
	endfunction

	function SaveHandleDataGroup takes handle object, group data returns nothing
		call SaveGroupHandle(HT, GetHandleId(object), GROUP_HID, data)
	endfunction

	function LoadHandleDataGroup takes handle object returns group
		return LoadGroupHandle(HT, GetHandleId(object), GROUP_HID)
	endfunction

	function FlushTimer takes timer tm returns nothing
		call FlushChildHashtable(HT, GetHandleId(tm))
		call PauseTimer(tm)
		call DestroyTimer(tm)
	endfunction

	function FlushTrigger takes trigger trg returns nothing
		call FlushChildHashtable(HT, GetHandleId(trg))
		call TriggerClearConditions(trg)
		call TriggerClearActions(trg)
		call DisableTrigger(trg)
		call DestroyTrigger(trg)
	endfunction

	function MakeUnitInvulnerable takes unit whichUnit, boolean flag returns nothing
		local integer count = LoadInteger(HT, GetHandleId(whichUnit), INVUL_HID)

		if flag then
			set count = count + 1
		else
			set count = MaxInt(count - 1, 0)
		endif

		if count == 1 then
			call UnitAddAbilityPermanent(whichUnit, INVUL_ABILITY_ID)
		endif

		if count == 0 then
			call UnitRemoveAbility(whichUnit, INVUL_ABILITY_ID)
		endif

		call SaveInteger(HT, GetHandleId(whichUnit), INVUL_HID, count)
	endfunction

	function IsTeamMode takes nothing returns boolean
		return udg_Mode_Team
	endfunction

	function GetTeamMasterPlayer takes player whichPlayer returns player
		if not IsTeamMode() then
			return whichPlayer
		endif
	
		if GetPlayerId(whichPlayer) < 4 then
			return Player(0)
		elseif GetPlayerId(whichPlayer) < 8 then
			return Player(4)
		endif

		return whichPlayer
	endfunction

	function IsMapPaused takes nothing returns boolean
		return udg_Rev_Duel or udg_Rev_End
	endfunction

	private function init takes nothing returns nothing
		call SetPlayerAbilityAvailable(Player(0), 'Aat1', false)
		set color[0] = "|c00ff0303"
		set color[1] = "|c000042ff"
		set color[2] = "|c001ce6b9"
		set color[3] = "|c00540079"
		set color[4] = "|c00fffc01"
		set color[5] = "|c00fe8a0e"
		set color[6] = "|c0020c000"
		set color[7] = "|c00e55bb0"
		set color[8] = "|c00959697"
		set color[9] = "|c007ebff1"
		set color[10] = "|c00106246"
		set color[11] = "|c004e2a04"
		set color[12] = "|c00282828"
		set color[13] = "|c00282828"
		set color[14] = "|c00282828"
		set color[15] = "|CffA1A1A1"    //серый
		set color[16] = "|CffFFD700"    //золотой
		set color[17] = "|cff00cc33"    //зеленый
		set color[18] = "|cffff3333"    //красный
		set color[19] = "|cff803EC4"    //темно-фиолетовый
		set color[20] = "|cffE61717"    //сила
		set color[21] = "|cff1BBA13"    //ловкость
		set color[22] = "|cff2075D3"    //разум
		set HexAbilityId[1] = HEX_FROG_ABILITY_ID
		set HexBuffId[1] = HEX_FROG_BUFF_ID
		set HexAbilityId[2] = HEX_SNOWMAN_ABILITY_ID
		set HexBuffId[2] = HEX_SNOWMAN_BUFF_ID
		set INIT_UNITS = CreateGroup()
		call GroupEnumUnitsInRect(INIT_UNITS, GetWorldBounds(), null)

		set MODIFIERS[1] = INC_OUT_HEAL
		set MODIFIERS[2] = INC_ENTER_HEAL
		set MODIFIERS[3] = INC_OUT_MANA
		set MODIFIERS[4] = INC_ENTER_MANA

		set MODIFIERS[5] = INC_OUT_STUN_TIME
		set MODIFIERS[6] = INC_ENTER_STUN_TIME

		set MODIFIERS[7] = PERCENT_LIFESTEAL
		set MODIFIERS[8] = INC_LIFESTEAL

		set MODIFIERS[9] = INC_ANY_DMG

		set MODIFIERS[10] = INC_ENTER_TIME_POS_BUFF
		set MODIFIERS[11] = INC_ENTER_TIME_NEG_BUFF
		set MODIFIERS[12] = INC_OUT_TIME_POS_BUFF
		set MODIFIERS[13] = INC_OUT_TIME_NEG_BUFF

		set MODIFIERS[14] = DEC_OUT_HEAL
		set MODIFIERS[15] = DEC_ENTER_HEAL
		set MODIFIERS[16] = DEC_OUT_MANA
		set MODIFIERS[17] = DEC_ENTER_MANA

		set MODIFIERS[18] = DEC_OUT_STUN_TIME
		set MODIFIERS[19] = DEC_ENTER_STUN_TIME

		set MODIFIERS[20] = CHANCE_BLOCK_ALL_DAMAGE
		set MODIFIERS[21] = PERCENT_BLOCK_ANY_DAMAGE
		set MODIFIERS[22] = CHANCE_DODGE_ATTACK
		set MODIFIERS[23] = CHANCE_MISS
		set MODIFIERS[24] = CHANCE_TRUE_STRIKE

		set MODIFIERS[25] = DEC_ENTER_TIME_POS_BUFF
		set MODIFIERS[26] = DEC_ENTER_TIME_NEG_BUFF
		set MODIFIERS[27] = DEC_OUT_TIME_POS_BUFF
		set MODIFIERS[28] = DEC_OUT_TIME_NEG_BUFF

		set MODIFIERS[29] = NON_STACK_PT_BLOCK_ANY_DAMAGE
		set MODIFIERS[30] = ADD_TIME_POS_BUFF
		set MODIFIERS[31] = ADD_TIME_NEG_BUFF
		set MODIFIERS[32] = DEC_PERIOD_BUFF
		set MODIFIERS[33] = DEC_TIME_NEG_PER_BUFF

		set MODIFIERS_NAME[1] = "INC_OUT_HEAL"
		set MODIFIERS_NAME[2] = "INC_ENTER_HEAL"
		set MODIFIERS_NAME[3] = "INC_OUT_MANA"
		set MODIFIERS_NAME[4] = "INC_ENTER_MANA"

		set MODIFIERS_NAME[5] = "INC_OUT_STUN_TIME"
		set MODIFIERS_NAME[6] = "INC_ENTER_STUN_TIME"

		set MODIFIERS_NAME[7] = "PERCENT_LIFESTEAL"
		set MODIFIERS_NAME[8] = "INC_LIFESTEAL"

		set MODIFIERS_NAME[9] = "INC_ANY_DMG"

		set MODIFIERS_NAME[10] = "INC_ENTER_TIME_POS_BUFF"
		set MODIFIERS_NAME[11] = "INC_ENTER_TIME_NEG_BUFF"
		set MODIFIERS_NAME[12] = "INC_OUT_TIME_POS_BUFF"
		set MODIFIERS_NAME[13] = "INC_OUT_TIME_NEG_BUFF"

		set MODIFIERS_NAME[14] = "DEC_OUT_HEAL"
		set MODIFIERS_NAME[15] = "DEC_ENTER_HEAL"
		set MODIFIERS_NAME[16] = "DEC_OUT_MANA"
		set MODIFIERS_NAME[17] = "DEC_ENTER_MANA"

		set MODIFIERS_NAME[18] = "DEC_OUT_STUN_TIME"
		set MODIFIERS_NAME[19] = "DEC_ENTER_STUN_TIME"

		set MODIFIERS_NAME[20] = "CHANCE_BLOCK_ALL_DAMAGE"
		set MODIFIERS_NAME[21] = "PERCENT_BLOCK_ANY_DAMAGE"
		set MODIFIERS_NAME[22] = "CHANCE_DODGE_ATTACK"
		set MODIFIERS_NAME[23] = "CHANCE_MISS"
		set MODIFIERS_NAME[24] = "CHANCE_TRUE_STRIKE"

		set MODIFIERS_NAME[25] = "DEC_ENTER_TIME_POS_BUFF"
		set MODIFIERS_NAME[26] = "DEC_ENTER_TIME_NEG_BUFF"
		set MODIFIERS_NAME[27] = "DEC_OUT_TIME_POS_BUFF"
		set MODIFIERS_NAME[28] = "DEC_OUT_TIME_NEG_BUFF"

		set MODIFIERS_NAME[29] = "NON_STACK_PT_BLOCK_ANY_DAMAGE"
		set MODIFIERS_NAME[30] = "ADD_TIME_POS_BUFF"
		set MODIFIERS_NAME[31] = "ADD_TIME_NEG_BUFF"
		set MODIFIERS_NAME[32] = "DEC_PERIOD_BUFF"
		set MODIFIERS_NAME[33] = "DEC_TIME_NEG_PER_BUFF"

		set MULTI_MODIFIERS[1] = CHANCE_PURE
		set MULTI_MODIFIERS[2] = CHANCE_MAGIC
		set MULTI_MODIFIERS[3] = CHANCE_PHYS

		set MULTI_MODIFIERS[4] = CHANCE_CLEAVE
		set MULTI_MODIFIERS[5] = CHANCE_SPLASH

		set MULTI_MODIFIERS[6] = CRITICAL_ATTACK
		set MULTI_MODIFIERS[7] = CHANCE_CRIT_PURE
		set MULTI_MODIFIERS[8] = CHANCE_CRIT_STR
		set MULTI_MODIFIERS[9] = CHANCE_BUSH

		set MULTI_MODIFIERS[10] = CHANCE_PIERCE

		set MULTI_MODIFIERS[11] = CHANCE_BLOCK_MELEE_DMG
		set MULTI_MODIFIERS[12] = CHANCE_BLOCK_RANGE_DMG
		set MULTI_MODIFIERS[13] = CHANCE_BLOCK_ANY_DMG
		set MULTI_MODIFIERS[14] = CHANCE_PT_BLOCK_ANY_DMG

		set MULTI_MODIFIERS[15] = NON_STACK_TYPE_LIFESTEAL

		set MULTI_MODIFIERS_NAME[1] = "CHANCE_PURE"
		set MULTI_MODIFIERS_NAME[2] = "CHANCE_MAGIC"
		set MULTI_MODIFIERS_NAME[3] = "CHANCE_PHYS"

		set MULTI_MODIFIERS_NAME[4] = "CHANCE_CLEAVE"
		set MULTI_MODIFIERS_NAME[5] = "CHANCE_SPLASH"

		set MULTI_MODIFIERS_NAME[6] = "CRITICAL_ATTACK"
		set MULTI_MODIFIERS_NAME[7] = "CHANCE_CRIT_PURE"
		set MULTI_MODIFIERS_NAME[8] = "CHANCE_CRIT_STR"
		set MULTI_MODIFIERS_NAME[9] = "CHANCE_BUSH"

		set MULTI_MODIFIERS_NAME[10] = "CHANCE_PIERCE"

		set MULTI_MODIFIERS_NAME[11] = "CHANCE_BLOCK_MELEE_DMG"
		set MULTI_MODIFIERS_NAME[12] = "CHANCE_BLOCK_RANGE_DMG"
		set MULTI_MODIFIERS_NAME[13] = "CHANCE_BLOCK_ANY_DMG"
		set MULTI_MODIFIERS_NAME[14] = "CHANCE_PT_BLOCK_ANY_DMG"

		set MULTI_MODIFIERS_NAME[15] = "NON_STACK_TYPE_LIFESTEAL"
	endfunction
	
endlibrary
