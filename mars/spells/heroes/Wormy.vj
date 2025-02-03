library Wormy initializer wInit uses TechUtils

    globals
        private constant integer damiId = 'h00L' //равкод дамми
    
        //Нейротоксин\\
        private constant integer buffIdW = 'B01U' //равкод баффа
        private constant integer spellIdW = 'A09V' //равкод способности
        private constant real periodW = 0.05 //период таймера
        private constant real dmgW = 0. //урон в секунду
        //\\
        
        //Ядовитые пары\\
        private constant integer spellIdE = 'A09X' //равкод способности
        private constant integer spellDammiIdE = 'A0PX' //равкод способности дамми
        private constant real periodE = 0.25 //период таймера
        private constant real dmgE = 175. //урон в секунду
        private constant real timeE = 4. //время действия
        private constant real rangeE = 350. //радиус действия
        private constant string effE = "war3mapImported\\ToxicField.mdl" //эффект
        //\\
        
        private key casterW_hid
        private key targetW_hid
        private key hpW_hid
        private key dmgW_hid
        private key onW_hid
        private key timerIdW_hid
        
        private key casterE_hid
        private key damiE_hid
        private key dmgE_hid
        private key effE_hid
        
        // (можно заменить на любые глобальные перменные)
        private unit tempUnit01
        private unit tempUnit02
        private unit tempUnit03
        private real tempReal
    endglobals
    
    
    //Нейротоксин\\
    private function ActionW takes nothing returns nothing
        local timer tm = GetExpiredTimer()
        local integer tmId = GetHandleId(tm)
        local unit caster = LoadUnitHandle(HT, tmId, casterW_hid)
        local unit target = LoadUnitHandle(HT, tmId, targetW_hid)
        local real dmg = LoadReal(HT, tmId, dmgW_hid)
        local real hp = LoadReal(HT, tmId, hpW_hid)
        if UnitAlive(target) and GetUnitAbilityLevel(target, buffIdW) > 0 then
            if GetUnitState(target, UNIT_STATE_LIFE) > hp then
                call SetUnitState(target, UNIT_STATE_LIFE, hp)
            endif
         //  call UnitDamageTargetBJ(caster, target, dmgW * periodW, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)//
            call SaveReal(HT, tmId, hpW_hid, GetUnitState(target, UNIT_STATE_LIFE))
        else
            call RemoveSavedHandle(HT, tmId, casterW_hid)
            call RemoveSavedHandle(HT, tmId, targetW_hid)
            call RemoveSavedReal(HT, tmId, hpW_hid)
            call RemoveSavedReal(HT, tmId, dmgW_hid)
            call RemoveSavedBoolean(HT, GetHandleId(target), onW_hid)
            call RemoveSavedInteger(HT, GetHandleId(target), timerIdW_hid)
            call FlushChildHashtable(HT, tmId)
            call PauseTimer(tm)
            call DestroyTimer(tm)
        endif
        set tm = null
        set caster = null
        set target = null
    endfunction

    private function StartW takes nothing returns nothing
        local timer tm = CreateTimer()
        local integer tmId = GetHandleId(tm)
        local unit caster = GetTriggerUnit()
        local unit target = GetSpellTargetUnit()
        local integer tId = GetHandleId(target)
        if LoadBoolean(HT, tId, onW_hid) then
            set tmId = LoadInteger(HT, tId, timerIdW_hid)
        else
            call TimerStart(tm, periodW, true, function ActionW)
        endif
        call SaveUnitHandle(HT, tmId, casterW_hid, caster)
        call SaveUnitHandle(HT, tmId, targetW_hid, target)
        call SaveReal(HT, tmId, hpW_hid, GetUnitState(GetSpellTargetUnit(), UNIT_STATE_LIFE))
        call SaveReal(HT, tmId, dmgW_hid, dmgW)
        call SaveBoolean(HT, tId, onW_hid, true)
        call SaveInteger(HT, tId, timerIdW_hid, tmId)
        set tm = null
        set caster = null
        set target = null
    endfunction
    
    private function FilterW takes nothing returns boolean
        return GetSpellAbilityId() == spellIdW
    endfunction
    //\\
    
    //Ядовитые пары\\
    private function ActionEFilter takes nothing returns boolean 
        set tempUnit02 = GetFilterUnit()
        return UnitAlive(tempUnit02) and not IsUnitAlly(tempUnit02, GetOwningPlayer(tempUnit01)) and not IsUnitType(tempUnit02, UNIT_TYPE_MAGIC_IMMUNE) and not IsUnitType(tempUnit02, UNIT_TYPE_MECHANICAL)
    endfunction
    
    private function ActionEActions takes nothing returns nothing
        call UnitDamageTargetBJ(tempUnit03, GetEnumUnit(), tempReal * periodE, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    endfunction
    
    private function ActionE takes nothing returns nothing
        local timer tm = GetExpiredTimer()
        local integer tmId = GetHandleId(tm)
        local unit caster = LoadUnitHandle(HT, tmId, casterE_hid)
        local unit dammi = LoadUnitHandle(HT, tmId, damiE_hid)
        local real dmg = LoadReal(HT, tmId, dmgE_hid)
        local group gr = CreateGroup()
        if UnitAlive(dammi) then
            set tempUnit01 = dammi
            call GroupEnumUnitsInRangeFiz(gr, GetUnitX(dammi), GetUnitY(dammi), rangeE, Condition(function ActionEFilter))
            set tempUnit03 = caster
            set tempReal = dmg
            call ForGroup(gr, function ActionEActions)
        else
            call ShowUnit(dammi, false)
            call RemoveSavedHandle(HT, tmId, casterE_hid)
            call RemoveSavedHandle(HT, tmId, damiE_hid)
            call RemoveSavedReal(HT, tmId, dmgE_hid)
            call DestroyEffect(LoadEffectHandle(HT, tmId, effE_hid))
            call RemoveSavedHandle(HT, tmId, effE_hid)
            call FlushChildHashtable(HT, tmId)
            call PauseTimer(tm)
            call DestroyTimer(tm)
        endif
        set tm = null
        set caster = null
        set dammi = null
        call DestroyGroup(gr)
        set gr = null
    endfunction

    private function StartE takes nothing returns nothing
        local timer tm = CreateTimer()
        local integer tmId = GetHandleId(tm)
        local unit caster = GetTriggerUnit()
        local unit dammi = CreateUnit(GetOwningPlayer(caster), damiId, GetUnitX(caster), GetUnitY(caster), 270.)
        call UnitAddAbility(dammi, spellDammiIdE)
        call UnitApplyTimedLife(dammi, 'BTLF', timeE)
        call SaveUnitHandle(HT, tmId, damiE_hid, dammi)
        call SaveUnitHandle(HT, tmId, casterE_hid, caster)
        call SaveReal(HT, tmId, dmgE_hid, dmgE)
        call SaveEffectHandle(HT, tmId, effE_hid, AddSpecialEffect(effE, GetUnitX(dammi), GetUnitY(dammi)))
        call TimerStart(tm, periodE, true, function ActionE)
        set tm = null
        set caster = null
        set dammi = null
    endfunction
    
    private function FilterE takes nothing returns boolean
        return GetSpellAbilityId() == spellIdE
    endfunction
    //\\ 
    
    //Инициализация
    private function wInit takes nothing returns nothing
        local trigger t
        
        set t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(t, Condition(function FilterW))
        call TriggerAddAction(t, function StartW)
        
        set t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(t, Condition(function FilterE))
        call TriggerAddAction(t, function StartE)
        
        set t = null

    endfunction
    
endlibrary