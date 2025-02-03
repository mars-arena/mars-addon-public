library AntiMH initializer Init

	globals
		trigger CreateUnity
		trigger gg_trg_Hear
		trigger CreateRect2
		trigger CreateArea
		trigger CreateRect
		trigger CHEATS
		trigger ICHEAT
		string Activator
		force udg_hear
		force CHEATER
		group Heal
		string array S2RAWa
		integer array S2RAW
		integer array skins
	endglobals


	globals
		private real maxX
		private real minX
		private real maxY
		private real minY
		private real pointX
		private real pointY
		private boolean b = true
		private rect rectMH
	endglobals
	
	public function Run takes nothing returns nothing
		local integer i = 0
		loop
			call CreateUnit(Player(13), ANTI_MH_UNIT_ID, pointX, pointY, 90)
			
			set pointY = pointY - 512.
			if pointY < minY then
				set pointX = pointX - 512.
				set pointY = maxY
			endif
			
			set i = i + 1
			
			if pointX < minX then
				set b = false
				exitwhen true
			endif
			exitwhen( i == 5600 )
		endloop
		if b then
			call ExecuteFunc("AntiMH_Run")
		endif
	endfunction
	
	private function Init takes nothing returns nothing
		set rectMH = gg_rct________________038
		set maxX = GetRectMaxX(rectMH)
		set minX = GetRectMinX(rectMH)
		set maxY = GetRectMaxY(rectMH)
		set minY = GetRectMinY(rectMH)
		set pointX = maxX
		set pointY = maxY
		
		call ExecuteFunc("AntiMH_Run")
	endfunction
endlibrary
