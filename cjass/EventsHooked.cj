library EventsHooked uses Events

	//! nocjass

	globals
		private hashtable HTInternal = InitHashtable()
	endglobals

	public function SaveTriggerEventId takes trigger whichTrigger, integer eventId returns nothing
		call SaveTriggerHandle(HTInternal, eventId, GetHandleId(whichTrigger), whichTrigger)
	endfunction

	public function RegisterTriggerCode takes trigger whichTrigger, code whichCode returns nothing

		call SaveTriggerHandle(HTInternal, eventId, GetHandleId(whichTrigger), whichTrigger)
	endfunction

	//! endnocjass

	define {
		TriggerRegisterAnyUnitEventBJ(whichTrigger, playerUnitEvent) = SaveTriggerEventId(whichTrigger, GetHandleId(playerUnitEvent))
		TriggerAddAction(whichTrigger, whichCode) = RegisterTriggerCode
	}

	SaveEffectHandle(HT, GetHandleId(whichUnit), (key penisEff), effect)

endlibrary

