library CrystalFieldSystem initializer Init requires Events

    globals
        private constant integer CRYSTAL_UNIT_ID = 'e063'
        private constant integer CRYSTAL_ABILITY_ID = 'A0YU'
        private constant real CRYSTAL_RADIUS = 300.0 // Максимальный радиус
        private constant real CRYSTAL_MIN_RADIUS = 0.0 // Начальный радиус
        private constant real CRYSTAL_SPEED = 220.0 // Скорость выхода на радиус
        private constant real CRYSTAL_ANGULAR_SPEED = 0.04 // Базовая скорость вращения
        private constant integer CRYSTAL_COUNT = 5
        private constant real MOVEMENT_INTERVAL = 0.03
        private hashtable ht = InitHashtable()
    endglobals

    struct Crystal
        unit crystal
        unit owner
        real angle
        real centerX
        real centerY
        real currentRadius
        real maxRadius
        real angularSpeed
        timer movementTimer
        boolean stopped

        static method create takes unit owner, real startAngle returns thistype
            local thistype this = thistype.allocate()
            // Запоминаем координаты центра (владельца)
            set this.owner = owner
            set this.centerX = GetUnitX(owner)
            set this.centerY = GetUnitY(owner)
            // Устанавливаем стартовый угол (общий для всех)
            set this.angle = startAngle
            set this.currentRadius = CRYSTAL_MIN_RADIUS // Начинаем с минимального радиуса
            set this.maxRadius = CRYSTAL_RADIUS // Фиксированный максимальный радиус
            set this.angularSpeed = CRYSTAL_ANGULAR_SPEED // Фиксированная скорость вращения
            set this.stopped = false
            set this.crystal = CreateUnit(GetOwningPlayer(owner), CRYSTAL_UNIT_ID, this.centerX, this.centerY, 0)
            // Применяем временную жизнь к кристаллу
            if (UnitHasTalent(this.owner, 'A23S')) then
            call UnitApplyTimedLife(this.crystal, 'BTLF', 15.0)
            else
            call UnitApplyTimedLife(this.crystal, 'BTLF', 12.0)
            endif
            call StunUnit(this.crystal, this.crystal, LOST_CONTROL_STUN, 1000)
            call AddAuraToUnit(this.crystal, bloop4aura_tid, null, true, 0, false, true,true, bloop4aura_tid, Condition(function FilterOnlyAlly), 450., 0, false, 0)
            // Создаем таймер для движения
            set this.movementTimer = CreateTimer()
            call TimerStart(this.movementTimer, MOVEMENT_INTERVAL, true, function thistype.onCrystalMove)
            call SaveInteger(ht, GetHandleId(this.movementTimer), 0, this)
            call SaveInteger(ht, GetHandleId(this.crystal), 0, this)

            return this
        endmethod

        static method onCrystalDestroy takes nothing returns nothing
            local unit deadCrystal = GetTriggerUnit()
            local thistype this = LoadInteger(ht, GetHandleId(deadCrystal), 0)
            call this.destroy()
        endmethod

        static method onCrystalMove takes nothing returns nothing
            local timer t = GetExpiredTimer()
            local thistype this = LoadInteger(ht, GetHandleId(t), 0)
            local real x
            local real y

            if this.stopped then
                return
            endif
            
            // Обновляем координаты центра относительно героя
            set this.centerX = GetUnitX(this.owner)
            set this.centerY = GetUnitY(this.owner)

            // Увеличиваем радиус, если он меньше максимального
            if this.currentRadius < this.maxRadius then
                set this.currentRadius = this.currentRadius + CRYSTAL_SPEED * MOVEMENT_INTERVAL
            else
                set this.currentRadius = this.maxRadius
                set this.stopped = true
                return
            endif

            // Обновляем угол для вращения
            set this.angle = this.angle + this.angularSpeed

            // Вычисляем новые координаты
            set x = this.centerX + this.currentRadius * Cos(this.angle)
            set y = this.centerY + this.currentRadius * Sin(this.angle)

            // Перемещаем кристалл
            call SetUnitX(this.crystal, x)
            call SetUnitY(this.crystal, y)
        endmethod

        private method destroy takes nothing returns nothing
            call FlushTimer(this.movementTimer)
            set this.owner = null
            set this.crystal = null
            set this.movementTimer = null
            call thistype.deallocate(this)
        endmethod
    endstruct

    private function OnCast takes nothing returns nothing
        local unit caster = GetTriggerUnit()
        local integer i
        local real angleStep = 2 * bj_PI / CRYSTAL_COUNT
        local real baseAngle = GetRandomReal(0, 2 * bj_PI) // Общий случайный угол

        if GetSpellAbilityId() == CRYSTAL_ABILITY_ID then
            set i = 0
            loop
                exitwhen i >= CRYSTAL_COUNT
                // Каждый кристалл получает равные угловые интервалы, начиная с baseAngle
                call Crystal.create(caster, baseAngle + i * angleStep)
                set i = i + 1
            endloop
        endif
        set caster = null
    endfunction

    private function onUnitDeath takes nothing returns nothing
        // Проверяем, является ли мёртвый юнит кристаллом
        if GetUnitTypeId(GetTriggerUnit()) == CRYSTAL_UNIT_ID then
            // Вызываем метод уничтожения
            call Crystal.onCrystalDestroy()
        endif
    endfunction

    private function Init takes nothing returns nothing
        call DeathAddAction(function onUnitDeath)
        call SpellEffectAddAction(function OnCast)
    endfunction

endlibrary
