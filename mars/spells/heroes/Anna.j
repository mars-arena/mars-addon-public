scope AnnaAbility initializer Init

    globals
        private constant integer SPELL_ID = 'A00I' // ID способности
        private constant real INITIAL_DELAY = 0.1 // Время до начала падения первых стрел (еще уменьшено)
        private constant real INTERVAL = 0.2 // Интервал между градом стрел
        private constant real BASE_RADIUS = 50.0 // Базовый радиус для стрел
        private constant integer BASE_ARROWS = 8 // Количество стрел в первом круге
        private constant real RADIUS_INCREMENT = 60.0 // Уменьшение радиуса между кругами (еще уменьшено)
        private constant integer MAX_CIRCLES = 6 // Максимальное количество кругов
        private constant real LIFESPAN = 2.0 // Время жизни даммика (в секундах)
        private hashtable ht = InitHashtable() // Хэш-таблица для хранения данных
        private constant string EFFECT_PATH = "war3mapImported\\ArrowVolleyV2_Portrait.mdx"
    endglobals

    private function TimerCallback takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local integer id = GetHandleId(t)
        local real targetX = LoadReal(ht, id, 0)
        local real targetY = LoadReal(ht, id, 1)
        local unit caster = LoadUnitHandle(ht, id, 2)
        local integer circlesCreated = LoadInteger(ht, id, 3)
        local real radius
        local real angle
        local unit dummy
        local integer arrows

        // Определение радиуса и количества стрел для текущего круга
        set radius = BASE_RADIUS + (circlesCreated * RADIUS_INCREMENT)
        set arrows = R2I(BASE_ARROWS * Pow(1.30, circlesCreated)) // Увеличено на 30% с каждым кругом

        // Создание стрел по кругу
        set angle = 0
        loop
            exitwhen angle >= 360
            set dummy = CreateUnit(GetOwningPlayer(caster), DUMMY_EFF_ID, targetX + radius * Cos(angle * bj_DEGTORAD), targetY + radius * Sin(angle * bj_DEGTORAD), angle)
            call AddSpecialEffectTarget(EFFECT_PATH, dummy, "origin")
            call UnitApplyTimedLife(dummy, 'BTLF', LIFESPAN) // Устанавливаем время жизни даммика
            set angle = angle + (360.0 / arrows)
        endloop

        // Обновление данных
        set circlesCreated = circlesCreated + 1

        // Проверка на максимальное количество кругов
        if circlesCreated >= MAX_CIRCLES then
            call FlushChildHashtable(ht, id) // Очистка данных из хэш-таблицы
            call DestroyTimer(t)
        else
            // Обновление данных
            call SaveInteger(ht, id, 3, circlesCreated)
            call TimerStart(t, INTERVAL, false, function TimerCallback)
        endif
    endfunction

    private function OnChannelEnd takes nothing returns nothing
        local unit caster = GetTriggerUnit()
        local timer t = LoadTimerHandle(ht, GetHandleId(caster), 0)
        
        // Запуск таймера для создания стрел (если еще не был запущен)
        if t != null then
            call TimerStart(t, INITIAL_DELAY, false, function TimerCallback)
            call FlushChildHashtable(ht, GetHandleId(caster))
        endif
    endfunction

    private function OnCast takes nothing returns nothing
        local unit caster = GetTriggerUnit()
        local real targetX = GetSpellTargetX()
        local real targetY = GetSpellTargetY()
        local timer t = CreateTimer()
        local integer id = GetHandleId(t)
        local integer casterId = GetHandleId(caster)
        
        // Сохраняем данные в хэш-таблице
        call SaveReal(ht, id, 0, targetX)
        call SaveReal(ht, id, 1, targetY)
        call SaveUnitHandle(ht, id, 2, caster)
        call SaveInteger(ht, id, 3, 0) // Начальное количество кругов
        
        // Сохраняем таймер в хэш-таблице для юнита
        call SaveTimerHandle(ht, casterId, 0, t)
    endfunction

    private function Init takes nothing returns nothing
        local trigger t = CreateTrigger()
        local trigger tEnd = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(t, Condition(function OnCast))

        
        call TriggerRegisterAnyUnitEventBJ(tEnd, EVENT_PLAYER_UNIT_SPELL_ENDCAST)
        call TriggerAddCondition(tEnd, Condition(function OnChannelEnd))
    endfunction

endscope