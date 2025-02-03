library HopeButterflies initializer onInit uses Events

	globals
		private constant real SPEED = 475
		private constant integer SPIRIT_ID = 'e05H'
		private constant integer ABILITY_ID = 'A1ZE'
		private constant integer TALENT_ID = 'A1ZG'

		private key SPIRIT_HID
	endglobals

	struct Spirit
		unit owner
		unit user
		unit spirit
		real heightVariation

		Point2D userLoc
		Point2D spiritLoc

		timer tmUpdate
		boolean isUpdate
		timer tmHeal
		boolean isHeal

		static integer PK = 0
		static real TM_INTERVAL = 0.03125

		static method create takes unit owner returns Spirit
			local Spirit this = Spirit.allocate()
			set this.owner = owner
			set this.user = owner
			set this.userLoc = Point2D.createAtWidget(owner)
			set this.spiritLoc = Point2D.create().copy(this.userLoc).movePolar(GetRandomReal(250, 500), GetRandomReal(0, 360))
			set this.spirit = CreateUnit(GetOwningPlayer(owner), SPIRIT_ID, this.spiritLoc.x, this.spiritLoc.y, 0.0)
			set this.heightVariation = GetRandomReal(-1.0, 1.0)
			call SaveInteger(HT, GetHandleId(this.owner), SPIRIT_HID, this)

			set this.tmUpdate = CreateTimer()
			set this.isUpdate = false
			call SaveInteger(HT, GetHandleId(this.tmUpdate), PK, this)
			call TimerStart(this.tmUpdate, 0., false, function Spirit.update)

			set this.tmHeal = CreateTimer()
			set this.isHeal = false
			call SaveInteger(HT, GetHandleId(this.tmHeal), PK, this)
			call TimerStart(this.tmHeal, 0., false, function Spirit.heal)
			return this
		endmethod

		method destroy takes nothing returns nothing
			call SaveInteger(HT, GetHandleId(owner), SPIRIT_HID, 0)

			call FlushChildHashtable(HT, GetHandleId(tmUpdate))
			call PauseTimer(tmUpdate)
			call DestroyTimer(tmUpdate)
			set tmUpdate = null

			call FlushChildHashtable(HT, GetHandleId(tmHeal))
			call PauseTimer(tmHeal)
			call DestroyTimer(tmHeal)
			set tmHeal = null

			set owner = null
			set user = null
			call KillUnit(spirit)
			set spirit = null

			call userLoc.destroy()
			call spiritLoc.destroy()

			call this.deallocate()
		endmethod

		static method load takes integer parentKey returns Spirit
			return LoadInteger(HT, parentKey, SPIRIT_HID)
		endmethod

		static method get takes unit owner returns Spirit
			local Spirit this
			set this = Spirit.load(GetHandleId(owner))

			if (this <= 0) then
				return Spirit.create(owner)
			endif
			return this
		endmethod

		static method update takes nothing returns nothing
			local Spirit this = LoadInteger(HT, GetHandleId(GetExpiredTimer()), PK)
			local real angle
			local real distance
			local real height

			if (not isUpdate) then
				set isUpdate = true
				call TimerStart(this.tmUpdate, TM_INTERVAL, true, function Spirit.update)
			endif
			
			if (not UnitAlive(user)) then
				set user = owner
			endif

			call userLoc.setAtWidget(user)
			set distance = userLoc.distTo(spiritLoc)

			if (distance > 2000) then
				set angle = spiritLoc.angleTo(userLoc)
				call spiritLoc.copy(userLoc).movePolar(500, angle)
			else
				set heightVariation = heightVariation + 0.1
				set height = 100.0 + 50.0 * Sin(heightVariation)
				
				if (distance > 150) then
					call spiritLoc.moveTowards(userLoc, SPEED * TM_INTERVAL)
				else
					call spiritLoc.moveTowards(userLoc, SPEED * TM_INTERVAL * distance / 150.)
				endif
			endif

			call SetUnitX(spirit, spiritLoc.x)
			call SetUnitY(spirit, spiritLoc.y)
			call SetUnitFlyHeight(spirit, height, 0.0)
		endmethod

		static method heal takes nothing returns nothing
			local Spirit this = LoadInteger(HT, GetHandleId(GetExpiredTimer()), PK)

			if (not isHeal) then
				set isHeal = true
				call TimerStart(this.tmHeal, 1.0, true, function Spirit.heal)
			endif

			if (userLoc.distTo(spiritLoc) <= 150.) then
				if (UnitHasTalent(owner, TALENT_ID)) then
					call HealUnit(owner, user, 40.)
				else
					call HealUnit(owner, user, 30.)
				endif
			endif
		endmethod

		static method SpellAction takes nothing returns nothing
			if (GetSpellAbilityId() == ABILITY_ID) then
				set Spirit.get(GetTriggerUnit()).user = GetSpellTargetUnit()
			endif
		endmethod

		static method DeathAction takes nothing returns nothing
			local Spirit this = Spirit.load(GetHandleId(GetTriggerUnit()))
			if (this > 0) then
				call this.destroy()
			endif
		endmethod

		static method ReviveAction takes nothing returns nothing
			if (UnitHasAbility(GetTriggerUnit(), ABILITY_ID)) then
				call Spirit.get(GetTriggerUnit())
			endif
		endmethod

		static method EnterAction takes nothing returns nothing
			if (UnitHasAbility(GetTriggerUnit(), ABILITY_ID)) then
				call Spirit.get(GetTriggerUnit())
			endif
		endmethod
	endstruct

	function onInit takes nothing returns nothing
		call SpellEffectAddAction(function Spirit.SpellAction)
		call DeathAddAction(function Spirit.DeathAction)
		call ReviveAddAction(function Spirit.ReviveAction)
		call EnterAddAction(function Spirit.EnterAction)
	endfunction
endlibrary