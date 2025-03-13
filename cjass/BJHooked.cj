library BJHooked uses NegateDamageLib, Filters

	globals
		private group grHooked
		private force forceHooked
	endglobals

	//! nocjass

	function UnitDamageTargetHook takes unit whichUnit, unit targetUnit, real value, attacktype attackType, damagetype damageType returns nothing
	call  UnitDamageToTarget(whichUnit, targetUnit, value, attackType, damageType, true, false, false, false, false)
	endfunction
	
	function MultiboardSetItemValueKT takes multiboard mb, integer col, integer row, string val returns nothing
		local integer curRow = 0
		local integer curCol = 0
		local integer numRows = MultiboardGetRowCount(mb)
		local integer numCols = MultiboardGetColumnCount(mb)
		local multiboarditem mbitem = null
		loop
			set curRow = curRow + 1
			exitwhen curRow > numRows
			if (row == 0 or row == curRow) then
				set curCol = 0
				loop
					set curCol = curCol + 1
					exitwhen curCol > numCols
					if (col == 0 or col == curCol) then
						set mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
						call MultiboardSetItemValue(mbitem, val)
						call MultiboardReleaseItem(mbitem)
					endif
				endloop
			endif
		endloop
		set mbitem = null
	endfunction
	
	function MultiboardSetItemStyleKT takes multiboard mb, integer col, integer row, boolean showValue, boolean showIcon returns nothing
		local integer curRow = 0
		local integer curCol = 0
		local integer numRows = MultiboardGetRowCount(mb)
		local integer numCols = MultiboardGetColumnCount(mb)
		local multiboarditem mbitem = null
		loop
			set curRow = curRow + 1
			exitwhen curRow > numRows
			if (row == 0 or row == curRow) then
				set curCol = 0
				loop
					set curCol = curCol + 1
					exitwhen curCol > numCols
					if (col == 0 or col == curCol) then
						set mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
						call MultiboardSetItemStyle(mbitem, showValue, showIcon)
						call MultiboardReleaseItem(mbitem)
					endif
				endloop
			endif
		endloop
		set mbitem = null
	endfunction
	
	function MultiboardSetItemWidthKT takes multiboard mb, integer col, integer row, real width returns nothing
		local integer curRow = 0
		local integer curCol = 0
		local integer numRows = MultiboardGetRowCount(mb)
		local integer numCols = MultiboardGetColumnCount(mb)
		local multiboarditem mbitem = null
		loop
			set curRow = curRow + 1
			exitwhen curRow > numRows
			if (row == 0 or row == curRow) then
				set curCol = 0
				loop
					set curCol = curCol + 1
					exitwhen curCol > numCols
					if (col == 0 or col == curCol) then
						set mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
						call MultiboardSetItemWidth(mbitem, width/100.0)
						call MultiboardReleaseItem(mbitem)
					endif
				endloop
			endif
		endloop
		set mbitem = null
	endfunction
	
	function MultiboardSetItemIconKT takes multiboard mb, integer col, integer row, string iconFileName returns nothing
		local integer curRow = 0
		local integer curCol = 0
		local integer numRows = MultiboardGetRowCount(mb)
		local integer numCols = MultiboardGetColumnCount(mb)
		local multiboarditem mbitem = null
		loop
			set curRow = curRow + 1
			exitwhen curRow > numRows
			if (row == 0 or row == curRow) then
				set curCol = 0
				loop
					set curCol = curCol + 1
					exitwhen curCol > numCols
					if (col == 0 or col == curCol) then
						set mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
						call MultiboardSetItemIcon(mbitem, iconFileName)
						call MultiboardReleaseItem(mbitem)
					endif
				endloop
			endif
		endloop
		set mbitem = null
	endfunction
	
	function PolledWaitKT takes real duration returns nothing
		local timer t
		local real  timeRemaining

		if (duration > 0) then
			set t = CreateTimer()
			call TimerStart(t, duration, false, null)
			loop
				set timeRemaining = TimerGetRemaining(t)
				exitwhen timeRemaining <= 0

				// If we have a bit of time left, skip past 10% of the remaining
				// duration instead of checking every interval, to minimize the
				// polling on long waits.
				if (timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD) then
					call TriggerSleepAction(0.1 * timeRemaining)
				else
					call TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
				endif
			endloop
			call DestroyTimer(t)
		endif
		set t = null
	endfunction
	
	function PlaySoundKT takes string soundName returns nothing
		local sound soundHandle = CreateSound(soundName, false, false, true, 12700, 12700, "")
		call StartSound(soundHandle)
		call KillSoundWhenDone(soundHandle)
		set soundHandle = null
	endfunction
	
	function TriggerRegisterEnterRectSimpleKT takes trigger trig, rect r returns event
		local region rectRegion = CreateRegion()
		call RegionAddRect(rectRegion, r)
		return TriggerRegisterEnterRegion(trig, rectRegion, null)
	endfunction
	
	function TriggerRegisterLeaveRectSimpleKT takes trigger trig, rect r returns event
		local region rectRegion = CreateRegion()
		call RegionAddRect(rectRegion, r)
		return TriggerRegisterLeaveRegion(trig, rectRegion, null)
	endfunction
	
	function GetInventoryIndexOfItemTypeKT takes unit whichUnit, integer itemId returns integer
		local integer index
		local item it
		set index = 0
		loop
			set it = UnitItemInSlot(whichUnit, index)
			if (it != null) and (GetItemTypeId(it) == itemId) then
				set it = null
				return index + 1
			endif
	
			set index = index + 1
			exitwhen index >= bj_MAX_INVENTORY
		endloop
		set it = null
		return 0
	endfunction

	function DelayedSuspendDecayStopAnimEnumKT takes nothing returns nothing
		local unit enumUnit = GetEnumUnit()

		if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
			call SetUnitTimeScale(enumUnit, 0.0001)
		endif
		set enumUnit = null
	endfunction

	function DelayedSuspendDecayBoneEnumKT takes nothing returns nothing
		local unit enumUnit = GetEnumUnit()

		if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
			call UnitSuspendDecay(enumUnit, true)
			call SetUnitTimeScale(enumUnit, 0.0001)
		endif
		set enumUnit = null
	endfunction

	function DelayedSuspendDecayFleshEnumKT takes nothing returns nothing
		local unit enumUnit = GetEnumUnit()

		if (GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0) then
			call UnitSuspendDecay(enumUnit, true)
			call SetUnitTimeScale(enumUnit, 10.0)
			call SetUnitAnimation(enumUnit, "decay flesh")
		endif
		set enumUnit = null
	endfunction
	
	function DelayedSuspendDecayKT takes nothing returns nothing
		local group boneGroup
		local group fleshGroup

		// Switch the global unit groups over to local variables and recreate
		// the global versions, so that this function can handle overlapping
		// calls.
		set boneGroup = bj_suspendDecayBoneGroup
		set fleshGroup = bj_suspendDecayFleshGroup
		set bj_suspendDecayBoneGroup = CreateGroup()
		set bj_suspendDecayFleshGroup = CreateGroup()

		call ForGroup(fleshGroup, function DelayedSuspendDecayStopAnimEnumKT)
		call ForGroup(boneGroup, function DelayedSuspendDecayStopAnimEnumKT)

		call TriggerSleepAction(bj_CORPSE_MAX_DEATH_TIME)
		call ForGroup(fleshGroup, function DelayedSuspendDecayFleshEnumKT)
		call ForGroup(boneGroup, function DelayedSuspendDecayBoneEnumKT)

		call TriggerSleepAction(0.05)
		call ForGroup(fleshGroup, function DelayedSuspendDecayStopAnimEnumKT)

		call DestroyGroup(boneGroup)
		call DestroyGroup(fleshGroup)
		set boneGroup = null
		set fleshGroup = null
	endfunction
	
	function IssueHauntOrderAtLocKT takes unit whichPeon, location loc returns boolean
		local group g = null
		local unit goldMine = null

		// Search for a gold mine within a 1-cell radius of the specified location.
		set g = CreateGroup()
		call GroupEnumUnitsInRangeOfLoc(g, loc, 2*bj_CELLWIDTH, filterIssueHauntOrderAtLocBJ)
		set goldMine = FirstOfGroup(g)
		call DestroyGroup(g)
		set g = null
		
		// If no mine was found, abort the request.
		if (goldMine == null) then
			return false
		endif
		
		set ReturnedUnit = goldMine
		set goldMine = null
		// Issue the Haunt Gold Mine order.
		return IssueTargetOrderById(whichPeon, 'ugol', ReturnedUnit)
	endfunction
	
	function WakePlayerUnitsKT takes player whichPlayer returns nothing
		local group g = CreateGroup()
		call GroupEnumUnitsOfPlayer(g, whichPlayer, null)
		call ForGroup(g, function WakePlayerUnitsEnum)
		call DestroyGroup(g)
		set g = null
	endfunction
	
	function PauseAllUnitsKT takes boolean pause returns nothing
		local integer index
		local player  indexPlayer
		local group   g

		set bj_pauseAllUnitsFlag = pause
		set g = CreateGroup()
		set index = 0
		loop
			set indexPlayer = Player( index )

			// If this is a computer slot, pause/resume the AI.
			if (GetPlayerController( indexPlayer ) == MAP_CONTROL_COMPUTER) then
				call PauseCompAI( indexPlayer, pause )
			endif

			// Enumerate and unpause every unit owned by the player.
			call GroupEnumUnitsOfPlayer( g, indexPlayer, Condition(function FilterPause))
			call ForGroup( g, function PauseAllUnitsBJEnum )
			call GroupClear( g )

			set index = index + 1
			exitwhen index == bj_MAX_PLAYER_SLOTS
		endloop
		call DestroyGroup(g)
		set indexPlayer = null
		set g = null
	endfunction

	function ReplaceUnitKT takes unit whichUnit, integer newUnitId, integer unitStateMethod returns unit
		local unit    oldUnit = whichUnit
		local unit    newUnit
		local boolean wasHidden
		local integer index
		local item    indexItem
		local real    oldRatio

		// If we have bogus data, don't attempt the replace.
		if (oldUnit == null) then
			set bj_lastReplacedUnit = oldUnit
			return oldUnit
		endif

		// Hide the original unit.
		set wasHidden = IsUnitHidden(oldUnit)
		call ShowUnit(oldUnit, false)

		// Create the replacement unit.
		if (newUnitId == 'ugol') then
			set newUnit = CreateBlightedGoldmine(GetOwningPlayer(oldUnit), GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
		else
			set newUnit = CreateUnit(GetOwningPlayer(oldUnit), newUnitId, GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
		endif

		// Set the unit's life and mana according to the requested method.
		if (unitStateMethod == bj_UNIT_STATE_METHOD_RELATIVE) then
			// Set the replacement's current/max life ratio to that of the old unit.
			// If both units have mana, do the same for mana.
			if (GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE) > 0) then
				set oldRatio = GetUnitState(oldUnit, UNIT_STATE_LIFE) / GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE)
				call SetUnitState(newUnit, UNIT_STATE_LIFE, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
			endif

			if (GetUnitState(oldUnit, UNIT_STATE_MAX_MANA) > 0) and (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
				set oldRatio = GetUnitState(oldUnit, UNIT_STATE_MANA) / GetUnitState(oldUnit, UNIT_STATE_MAX_MANA)
				call SetUnitState(newUnit, UNIT_STATE_MANA, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
			endif
		elseif (unitStateMethod == bj_UNIT_STATE_METHOD_ABSOLUTE) then
			// Set the replacement's current life to that of the old unit.
			// If the new unit has mana, do the same for mana.
			call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(oldUnit, UNIT_STATE_LIFE))
			if (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
				call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(oldUnit, UNIT_STATE_MANA))
			endif
		elseif (unitStateMethod == bj_UNIT_STATE_METHOD_DEFAULTS) then
			// The newly created unit should already have default life and mana.
		elseif (unitStateMethod == bj_UNIT_STATE_METHOD_MAXIMUM) then
			// Use max life and mana.
			call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
			call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
		else
			// Unrecognized unit state method - ignore the request.
		endif

		// Mirror properties of the old unit onto the new unit.
		//call PauseUnit(newUnit, IsUnitPaused(oldUnit))
		call SetResourceAmount(newUnit, GetResourceAmount(oldUnit))

		// If both the old and new units are heroes, handle their hero info.
		if (IsUnitType(oldUnit, UNIT_TYPE_HERO) and IsUnitType(newUnit, UNIT_TYPE_HERO)) then
			call SetHeroXP(newUnit, GetHeroXP(oldUnit), false)

			set index = 0
			loop
				set indexItem = UnitItemInSlot(oldUnit, index)
				if (indexItem != null) then
					call UnitRemoveItem(oldUnit, indexItem)
					call UnitAddItem(newUnit, indexItem)
				endif

				set index = index + 1
				exitwhen index >= bj_MAX_INVENTORY
			endloop
		endif

		// Remove or kill the original unit.  It is sometimes unsafe to remove
		// hidden units, so kill the original unit if it was previously hidden.
		if wasHidden then
			call KillUnit(oldUnit)
			call RemoveUnit(oldUnit)
		else
			call RemoveUnit(oldUnit)
		endif

		set bj_lastReplacedUnit = newUnit
		set ReturnedUnit = newUnit
		
		set oldUnit = null
		set newUnit = null
		set indexItem = null
		
		return ReturnedUnit
	endfunction

	function EnumDestructablesInCircleBJFilterKT takes nothing returns boolean
		local location destLoc = GetDestructableLoc(GetFilterDestructable())
		local boolean result

		set result = DistanceBetweenPoints(destLoc, bj_enumDestructableCenter) <= bj_enumDestructableRadius
		call RemoveLocation(destLoc)
		set destLoc = null
		return result
	endfunction
	
	function EnumDestructablesInCircleKT takes real radius, location loc, code actionFunc returns nothing
		local rect r

		if (radius >= 0) then
			set bj_enumDestructableCenter = loc
			set bj_enumDestructableRadius = radius
			set r = GetRectFromCircleBJ(loc, radius)
			call EnumDestructablesInRect(r, filterEnumDestructablesInCircleBJ, actionFunc)
			call RemoveRect(r)
		endif
		set r = null
	endfunction
	
	function NudgeUnitsInRectEnumKT takes nothing returns nothing
		local unit nudgee = GetEnumUnit()

		call SetUnitPosition(nudgee, GetUnitX(nudgee), GetUnitY(nudgee))
		set nudgee = null
	endfunction

	function NudgeItemsInRectEnumKT takes nothing returns nothing
		local item nudgee = GetEnumItem()

		call SetItemPosition(nudgee, GetItemX(nudgee), GetItemY(nudgee))
		set nudgee = null
	endfunction

	function NudgeObjectsInRectKT takes rect nudgeArea returns nothing
		local group        g

		set g = CreateGroup()
		call GroupEnumUnitsInRect(g, nudgeArea, null)
		call ForGroup(g, function NudgeUnitsInRectEnum)
		call DestroyGroup(g)
		set g = null

		call EnumItemsInRect(nudgeArea, null, function NudgeItemsInRectEnum)
	endfunction

	function NearbyElevatorExistsEnumKT takes nothing returns nothing
		local destructable d     = GetEnumDestructable()
		local integer      dType = GetDestructableTypeId(d)

		if (dType == bj_ELEVATOR_CODE01) or (dType == bj_ELEVATOR_CODE02) then
			set bj_elevatorNeighbor = d
		endif
		set d = null
	endfunction
	
	function NearbyElevatorExistsKT takes real x, real y returns boolean
		local real findThreshold = 32
		local rect r

		// If another elevator is overlapping this one, ignore the wall.
		set r = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
		set bj_elevatorNeighbor = null
		call EnumDestructablesInRect(r, null, function NearbyElevatorExistsEnum)
		call RemoveRect(r)
		set r = null

		return bj_elevatorNeighbor != null
	endfunction

	function ChangeElevatorWallBlockerKT takes real x, real y, real facing, boolean open returns nothing
		local destructable blocker = null
		local real         findThreshold = 32
		local real         nudgeLength   = 4.25 * bj_CELLWIDTH
		local real         nudgeWidth    = 1.25 * bj_CELLWIDTH
		local rect         r

		// Search for the pathing blocker within the general area.
		set r = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
		set bj_elevatorWallBlocker = null
		call EnumDestructablesInRect(r, null, function FindElevatorWallBlockerEnum)
		call RemoveRect(r)
		set blocker = bj_elevatorWallBlocker

		// Ensure that the blocker exists.
		if (blocker == null) then
			set blocker = CreateDeadDestructable(bj_ELEVATOR_BLOCKER_CODE, x, y, facing, 1, 0)
		elseif (GetDestructableTypeId(blocker) != bj_ELEVATOR_BLOCKER_CODE) then
			// If a different destructible exists in the blocker's spot, ignore
			// the request.  (Two destructibles cannot occupy the same location
			// on the map, so we cannot create an elevator blocker here.)
			return
		endif

		if (open) then
			// Ensure that the blocker is dead.
			if (GetDestructableLife(blocker) > 0) then
				call KillDestructable(blocker)
			endif
		else
			// Ensure that the blocker is alive.
			if (GetDestructableLife(blocker) <= 0) then
				call DestructableRestoreLife(blocker, GetDestructableMaxLife(blocker), false)
			endif

			// Nudge any objects standing in the blocker's way.
			if (facing == 0) then
				set r = Rect(x - nudgeWidth/2, y - nudgeLength/2, x + nudgeWidth/2, y + nudgeLength/2)
				call NudgeObjectsInRect(r)
				call RemoveRect(r)
			elseif (facing == 90) then
				set r = Rect(x - nudgeLength/2, y - nudgeWidth/2, x + nudgeLength/2, y + nudgeWidth/2)
				call NudgeObjectsInRect(r)
				call RemoveRect(r)
			else
				// Unrecognized blocker angle - don't nudge anything.
			endif
		endif
		set r = null
		set blocker = null
	endfunction

	function EnumUnitsSelectedKT takes player whichPlayer, boolexpr enumFilter, code enumAction returns nothing
		local group g = CreateGroup()
		call SyncSelections()
		call GroupEnumUnitsSelected(g, whichPlayer, enumFilter)
		call DestroyBoolExpr(enumFilter)
		call ForGroup(g, enumAction)
		call DestroyGroup(g)
		set g = null
	endfunction

	function GetUnitsInRectMatchingKT takes rect r, boolexpr filter returns group
		local group g = CreateGroup()
		call GroupEnumUnitsInRect(g, r, filter)
		call DestroyBoolExpr(filter)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetUnitsInRectOfPlayerKT takes rect r, player whichPlayer returns group
		local group g = CreateGroup()
		set bj_groupEnumOwningPlayer = whichPlayer
		call GroupEnumUnitsInRect(g, r, filterGetUnitsInRectOfPlayer)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetUnitsInRangeOfLocMatchingKT takes real radius, location whichLocation, boolexpr filter returns group
		local group g = CreateGroup()
		call GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
		call DestroyBoolExpr(filter)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetUnitsOfTypeIdAllKT takes integer unitid returns group
		local group   result = CreateGroup()
		local group   g      = CreateGroup()
		local integer index

		set index = 0
		loop
			set bj_groupEnumTypeId = unitid
			call GroupClear(g)
			call GroupEnumUnitsOfPlayer(g, Player(index), filterGetUnitsOfTypeIdAll)
			call GroupAddGroup(g, result)

			set index = index + 1
			exitwhen index == bj_MAX_PLAYER_SLOTS
		endloop
		call DestroyGroup(g)
		set g = null
		
		set grHooked = result
		set result = null
		return grHooked
	endfunction

	function GetUnitsOfPlayerMatchingKT takes player whichPlayer, boolexpr filter returns group
		local group g = CreateGroup()
		call GroupEnumUnitsOfPlayer(g, whichPlayer, filter)
		call DestroyBoolExpr(filter)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetUnitsOfPlayerAndTypeIdKT takes player whichPlayer, integer unitid returns group
		local group g = CreateGroup()
		set bj_groupEnumTypeId = unitid
		call GroupEnumUnitsOfPlayer(g, whichPlayer, filterGetUnitsOfPlayerAndTypeId)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetUnitsSelectedAllKT takes player whichPlayer returns group
		local group g = CreateGroup()
		call SyncSelections()
		call GroupEnumUnitsSelected(g, whichPlayer, null)
		set grHooked = g
		set g = null
		return grHooked
	endfunction

	function GetForceOfPlayerKT takes player whichPlayer returns force
		local force f = CreateForce()
		call ForceAddPlayer(f, whichPlayer)
		set forceHooked = f
		set f = null
		return forceHooked
	endfunction

	function GetPlayersByMapControlKT takes mapcontrol whichControl returns force
		local force f = CreateForce()
		local integer playerIndex
		local player  indexPlayer

		set playerIndex = 0
		loop
			set indexPlayer = Player(playerIndex)
			if GetPlayerController(indexPlayer) == whichControl then
				call ForceAddPlayer(f, indexPlayer)
			endif

			set playerIndex = playerIndex + 1
			exitwhen playerIndex == bj_MAX_PLAYER_SLOTS
		endloop
		set indexPlayer = null
		
		set forceHooked = f
		set f = null
		return forceHooked
	endfunction

	function GetPlayersAlliesKT takes player whichPlayer returns force
		local force f = CreateForce()
		call ForceEnumAllies(f, whichPlayer, null)
		set forceHooked = f
		set f = null
		return forceHooked
	endfunction

	function GetPlayersEnemiesKT takes player whichPlayer returns force
		local force f = CreateForce()
		call ForceEnumEnemies(f, whichPlayer, null)
		set forceHooked = f
		set f = null
		return forceHooked
	endfunction
	
	function GetPlayersMatchingKT takes boolexpr filter returns force
		local force f = CreateForce()
		call ForceEnumPlayers(f, filter)
		call DestroyBoolExpr(filter)
		set forceHooked = f
		set f = null
		return forceHooked
	endfunction
	
	function GetRandomSubGroupKT takes integer count, group sourceGroup returns group
		local group g = CreateGroup()

		set bj_randomSubGroupGroup = g
		set bj_randomSubGroupWant  = count
		set bj_randomSubGroupTotal = CountUnitsInGroup(sourceGroup)

		if (bj_randomSubGroupWant <= 0 or bj_randomSubGroupTotal <= 0) then
			return g
		endif

		set bj_randomSubGroupChance = I2R(bj_randomSubGroupWant) / I2R(bj_randomSubGroupTotal)
		call ForGroup(sourceGroup, function GetRandomSubGroupEnum)
		set grHooked = g
		set g = null
		return grHooked
	endfunction
	
	function LivingPlayerUnitsOfTypeIdFilterKT takes nothing returns boolean
		return IsUnitAliveBJ(GetFilterUnit()) and GetUnitTypeId(GetFilterUnit()) == bj_livingPlayerUnitsTypeId
	endfunction

	function CountLivingPlayerUnitsOfTypeIdKT takes integer unitId, player whichPlayer returns integer
		local group g
		local integer matchedCount

		set g = CreateGroup()
		set bj_livingPlayerUnitsTypeId = unitId
		call GroupEnumUnitsOfPlayer(g, whichPlayer, filterLivingPlayerUnitsOfTypeId)
		set matchedCount = CountUnitsInGroup(g)
		call DestroyGroup(g)
		set g = null

		return matchedCount
	endfunction

	function SetUnitFacingToFaceLocTimedKT takes unit whichUnit, location target, real duration returns nothing
		local location unitLoc = GetUnitLoc(whichUnit)

		call SetUnitFacingTimed(whichUnit, AngleBetweenPoints(unitLoc, target), duration)
		call RemoveLocation(unitLoc)
		set unitLoc = null
	endfunction

	function SetUnitFacingToFaceUnitTimedKT takes unit whichUnit, unit target, real duration returns nothing
		local location unitLoc = GetUnitLoc(target)

		call SetUnitFacingToFaceLocTimedKT(whichUnit, unitLoc, duration)
		call RemoveLocation(unitLoc)
		set unitLoc = null
	endfunction
	
	function MakeUnitsPassiveForPlayerKT takes player whichPlayer returns nothing
		local group   playerUnits = CreateGroup()
		call CachePlayerHeroData(whichPlayer)
		call GroupEnumUnitsOfPlayer(playerUnits, whichPlayer, null)
		call ForGroup(playerUnits, function MakeUnitsPassiveForPlayerEnum)
		call DestroyGroup(playerUnits)
		set playerUnits = null
	endfunction

	function MultiboardSetItemColorKT takes multiboard mb, integer col, integer row, real red, real green, real blue, real transparency returns nothing
		local integer curRow = 0
		local integer curCol = 0
		local integer numRows = MultiboardGetRowCount(mb)
		local integer numCols = MultiboardGetColumnCount(mb)
		local multiboarditem mbitem = null

		// Loop over rows, using 1-based index
		loop
			set curRow = curRow + 1
			exitwhen curRow > numRows

			// Apply setting to the requested row, or all rows (if row is 0)
			if (row == 0 or row == curRow) then
				// Loop over columns, using 1-based index
				set curCol = 0
				loop
					set curCol = curCol + 1
					exitwhen curCol > numCols

					// Apply setting to the requested column, or all columns (if col is 0)
					if (col == 0 or col == curCol) then
						set mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
						call MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0-transparency))
						call MultiboardReleaseItem(mbitem)
					endif
				endloop
			endif
		endloop
		set mbitem = null
	endfunction

	function TriggerActionUnitRescuedKT takes nothing returns nothing
		local unit theUnit = GetTriggerUnit()

		if IsUnitType(theUnit, UNIT_TYPE_STRUCTURE) then
			call RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorBldg)
		else
			call RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorUnit)
		endif
		set theUnit = null
	endfunction

	function SetPlayerColorKT takes player whichPlayer, playercolor color, boolean changeExisting returns nothing
		local group g

		call SetPlayerColor(whichPlayer, color)
		if changeExisting then
			set bj_setPlayerTargetColor = color
			set g = CreateGroup()
			call GroupEnumUnitsOfPlayer(g, whichPlayer, null)
			call ForGroup(g, function SetPlayerColorBJEnum)
			call DestroyGroup(g)
		endif
		set g = null
	endfunction
	
	//! endnocjass

	define
		PolledWait(duration) = PolledWaitKT(duration)
		PlaySound(soundName) = PlaySoundKT(soundName)
		TriggerRegisterEnterRectSimple(trig, r) = TriggerRegisterEnterRectSimpleKT(trig, r)
		TriggerRegisterLeaveRectSimple(trig, r) = TriggerRegisterLeaveRectSimpleKT(trig, r)
		GetInventoryIndexOfItemTypeBJ(whichUnit, itemId) = GetInventoryIndexOfItemTypeKT(whichUnit, itemId)
		DelayedSuspendDecayStopAnimEnum() = DelayedSuspendDecayStopAnimEnumKT()
		DelayedSuspendDecayBoneEnum() = DelayedSuspendDecayBoneEnumKT()
		DelayedSuspendDecayFleshEnum() = DelayedSuspendDecayFleshEnumKT()
		DelayedSuspendDecay() = DelayedSuspendDecayKT()
		IssueHauntOrderAtLocBJ(whichPeon, loc) = IssueHauntOrderAtLocKT(whichPeon, loc)
		WakePlayerUnits(whichPlayer) = WakePlayerUnitsKT(whichPlayer)
		PauseAllUnitsBJ(pause) = PauseAllUnitsKT(pause)
		ReplaceUnitBJ(whichUnit, newUnitId, unitStateMethod) = ReplaceUnitKT(whichUnit, newUnitId, unitStateMethod)
		EnumDestructablesInCircleBJFilter() = EnumDestructablesInCircleBJFilterKT()
		EnumDestructablesInCircleBJ(radius, loc, actionFunc) = EnumDestructablesInCircleKT(radius, loc, actionFunc)
		NudgeUnitsInRectEnum() = NudgeUnitsInRectEnumKT()
		NudgeItemsInRectEnum() = NudgeItemsInRectEnumKT()
		NudgeObjectsInRect(nudgeArea) = NudgeObjectsInRectKT(nudgeArea)
		NearbyElevatorExistsEnum() = NearbyElevatorExistsEnumKT()
		NearbyElevatorExists(x, y) = NearbyElevatorExistsKT(x, y)
		ChangeElevatorWallBlocker(x, y, facing, open) = ChangeElevatorWallBlockerKT(x, y, facing, open)
		EnumUnitsSelected(whichPlayer, enumFilter, enumAction) = EnumUnitsSelectedKT(whichPlayer, enumFilter, enumAction)
		GetUnitsInRectMatching(r, filter) = GetUnitsInRectMatchingKT(r, filter)
		GetUnitsInRectOfPlayer(r, whichPlayer) = GetUnitsInRectOfPlayerKT(r, whichPlayer)
		GetUnitsInRangeOfLocMatching(radius, whichLocation, filter) = GetUnitsInRangeOfLocMatchingKT(radius, whichLocation, filter)
		GetUnitsOfTypeIdAll(unitid) = GetUnitsOfTypeIdAllKT(unitid)
		GetUnitsOfPlayerMatching(whichPlayer, filter) = GetUnitsOfPlayerMatchingKT(whichPlayer, filter)
		GetUnitsOfPlayerAndTypeId(whichPlayer, unitid) = GetUnitsOfPlayerAndTypeIdKT(whichPlayer, unitid)
		GetUnitsSelectedAll(whichPlayer) = GetUnitsSelectedAllKT(whichPlayer)
		GetForceOfPlayer(whichPlayer) = GetForceOfPlayerKT(whichPlayer)
		GetPlayersByMapControl(whichControl) = GetPlayersByMapControlKT(whichControl)
		GetPlayersAllies(whichPlayer) = GetPlayersAlliesKT(whichPlayer)
		GetPlayersEnemies(whichPlayer) = GetPlayersEnemiesKT(whichPlayer)
		GetPlayersMatching(filter) = GetPlayersMatchingKT(filter)
		GetRandomSubGroup(count, sourceGroup) = GetRandomSubGroupKT(count, sourceGroup)
		LivingPlayerUnitsOfTypeIdFilter() = LivingPlayerUnitsOfTypeIdFilterKT()
		CountLivingPlayerUnitsOfTypeId(unitId, whichPlayer) = CountLivingPlayerUnitsOfTypeIdKT(unitId, whichPlayer)
		SetUnitFacingToFaceLocTimed(whichUnit, target, duration) = SetUnitFacingToFaceLocTimedKT(whichUnit, target, duration)
		SetUnitFacingToFaceUnitTimed(whichUnit, target, duration) = SetUnitFacingToFaceUnitTimedKT(whichUnit, target, duration)
		MakeUnitsPassiveForPlayer(whichPlayer) = MakeUnitsPassiveForPlayerKT(whichPlayer)
		MultiboardSetItemStyleBJ(mb, col, row, showValue, showIcon) = MultiboardSetItemStyleKT(mb, col, row, showValue, showIcon)
		MultiboardSetItemValueBJ(mb, col, row, val) = MultiboardSetItemValueKT(mb, col, row, val)
		MultiboardSetItemColorBJ(mb, col, row, red, green, blue, transparency) = MultiboardSetItemColorKT(mb, col, row, red, green, blue, transparency)
		MultiboardSetItemWidthBJ(mb, col, row, width) = MultiboardSetItemWidthKT(mb, col, row, width)
		MultiboardSetItemIconBJ(mb, col, row, iconFileName) = MultiboardSetItemIconKT(mb, col, row, iconFileName)
		TriggerActionUnitRescuedBJ() = TriggerActionUnitRescuedKT()
		SetPlayerColorBJ(whichPlayer, color, changeExisting) = SetPlayerColorKT(whichPlayer, color, changeExisting)
		GetUnitState(u, state) = GetUnitStateHook(u, state)
		GetUnitStateSwap(state, u) = GetUnitStateHook(u, state)
		GetUnitStatePercent(whichUnit, whichState, whichMaxState) = GetUnitStatePercentHook(whichUnit, whichState, whichMaxState)
		GetUnitLifePercent(whichUnit) = GetUnitLifePercentHook(whichUnit)
		UnitDamageTargetBJ(whichUnit, targetUnit, value, attackType, damageType) = UnitDamageTargetHook(whichUnit, targetUnit, value, attackType, damageType)
	enddefine
	
endlibrary

