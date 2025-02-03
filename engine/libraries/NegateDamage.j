library NegateDamageLib

	globals
		private constant group Group = CreateGroup()
		private constant timer Timer = CreateTimer()
	endglobals

	function GetUnitMaxLife takes unit u returns real
		return GetUnitState(u, UNIT_STATE_MAX_LIFE) - GetUnitAbilityLevel(u, MAX_LIFE_BONUS_ABILITY) * MAX_LIFE_BONUS
	endfunction

	private function ProcessUnits takes nothing returns nothing
		local unit u
		local real life2set
	
		loop
			set u = FirstOfGroup(Group)
			exitwhen u == null
			call GroupRemoveUnit(Group, u)
	
			if UnitAlive(u) then
				set life2set = GetWidgetLife(u)
				call UnitRemoveAbility(u, MAX_LIFE_BONUS_ABILITY)
				call SetWidgetLife(u, life2set)
			else
				call UnitRemoveAbility(u, MAX_LIFE_BONUS_ABILITY)
			endif
		endloop
	endfunction
	
	function NegateDamage takes unit u, real negated returns nothing
		local real life2set = GetWidgetLife(u) + negated
	
		if life2set > GetUnitState(u, UNIT_STATE_MAX_LIFE) then
			call GroupAddUnit(Group, u)
			call UnitAddAbility(u, MAX_LIFE_BONUS_ABILITY)
		endif
	
		call SetWidgetLife(u, life2set)
	
		call TimerStart(Timer, 0., false, function ProcessUnits)
	endfunction
	
endlibrary
