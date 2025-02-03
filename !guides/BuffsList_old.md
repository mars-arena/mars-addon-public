# Buffs needs update

Гайд будет обновлен, когда перепишу бибилотеку.

**Buffs** позволяет создавать кастомные баффы для юнитов.

## Возможнсти

- Удобная настройка создаваемых баффов;
- Гибкая система работы баффов, позволяющая создавать баффы для любых нужд;
- Удобное использование, совместимое с GUI;
- Полный доступ к объектам;
- Большое количество функций для работы с баффами;
- Развеивание баффов;
- Передача действующих баффов, сохраняя его текущий статус;
- Интуативная работа баффов, подобная к Wc3;
- Динамическое изменение действующих баффов;

## AddBuffToUnit()

Функция `AddBuffToUnit()` добавляет бафф с указанными параметрами к юниту и возвращает уникальный идентификатор созданного баффа.

    call AddBuffToUnit(ownerUnit, targetUnit, typeId, actionsId, duration, rank, dispelDifficulty, stackable, refreshDuration, refreshOutEnter, pierceSpellImmun, pierceInvul, pierceDeath, periodActions, period)

### Параметры функции

- `unit ownerUnit` - владелец бафа;
- `unit targetUnit` - цель бафа;
- `integer typeId` - тип бафа;
- `integer actionsId` - id действий;
- `real duration` - время бафа;
- `integer rank` - ранг бафа (пример: 0 - отрицательный, 1 - положительный, [2-...] - другие);
- `integer dispelDifficulty` - сложность развеивания баффов;
- `boolean stackable` - может ли бафф стакаться; если не стакается, бафф с таким же приоритетом обновляет время действия;
- `boolean refreshDuration` - обновлять ли время баффа у других баффов того же типа;
- `boolean refreshOutEnter` - обновлять ли вход/выход из баффа;
- `boolean pierceSpellImmun` - бафф автоматически снимается, если юнит становится неуязвимым к магии;
- `boolean pierceInvul` - бафф автоматически снимается, если юнит становится неуязвимым;
- `boolean pierceDeath` - бафф автоматически снимается, если юнит умирает;
- `boolean periodActions` - есть ли периодические действия;
- `real period` - время периодических действий;

**Возвращаемое значение:**

Функция возвращает уникальный идентификатор созданного баффа, что позволяет сохранить его для того, чтобы получать доступ к баффу вручную, когда это нужно.

### Пример использования

    call AddBuffToUnit(udg_AttackingUnit, udg_AttackingUnit, aeon3buff_tid, aeon3buff_tid, 6, false, false, false, false, true, true, true, 5)

  Данный код добавляет бафф с типом `aeon3buff_tid` к юниту.

- Описать работу баффа;
- пися;
- попа;
- кака;
- пися;
- попа;
- кака;

## Список функций

### Основные функции

- Гуи-функция для создания баффа (аргументы передаются через глобальные переменные). <br> `AddBuffToUnitGUI() -> integer`

- Возвращает первый бафф типа typeId. <br> `GetUnitBuffByType(unit u, integer typeId) -> Buff`

- Удаляет все баффы по хэндлу hashId. <br> `DestroyAllBuffsByHashId(integer hashId)`

- Удалить баффы ранга rank учитывая dispelDifficulty (только с действием выхода). <br> `DestroyUnitBuffs(unit u, integer rank, integer dispelDifficulty)`

- Удалить бафф (false - без действий выхода, true - с действием выхода). <br> `DestroyUnitBuff(unit u, Buff buf, boolean onOut)`

- Передает баффы с ownerUnit на targetUnit. <br> `TransferUnitBuffsToUnit(unit ownerUnit, unit targetUnit, integer rank, integer dispelDifficulty)`

- Имеет ли юнит бафф типа typeId. <br> `IsUnitBuffByType(unit u, integer typeId) -> boolean`

- Имеет ли юнит бафф с actionsId. <br> `IsUnitBuffByActionId(unit u, integer actionsId) -> boolean`

- Обновить длительность баффа. <br> `RefreshDurationBuff(Buff buf)`

- Однократно выполнить периодические действия баффа. <br> `ExecuteBuffActions(Buff buf)`

- Включает периодические действия баффа. <br> `EnableBuffPeriod(Buff buf)`

### Функции для стаков

- Возвращает количество стаков баффа. <br> `GetBuffStacks(Buff buf) -> integer`

- Обновляет длительность стаков бафффа. <br> `RefreshDurationBuffStacks(Buff buf)`

- Однократно выполнить периодические действия стака баффа. <br> `ExecuteBuffStackActions(Buff buf, timer buffStack)`

- Возвращает целое значение стака. <br> `GetBuffStackDataInt(timer buffStack)`

- Возвращает реальное значение стака. <br> `GetBuffStackDataReal(timer buffStack) -> real`

- Устанавливает целое значение стака. <br> `SetBuffStackDataInt(Buff buf, timer buffStack, integer dataInt)`

- Устанавливает реальное значение стака. <br> `SetBuffStackDataReal(Buff buf, timer buffStack, real dataReal)`

### Геттеры

- Возвращает целое значение баффа. <br> `GetBuffDataInt(Buff buf) -> integer`

- Возвращает реальное значение баффа. <br> `GetBuffDataReal(Buff buf) -> real`

- Возвращает владельца. <br> `GetBuffOwnerUnit(Buff buf) -> unit`

- Возвращает цель. <br> `GetBuffTarget(Buff buf) -> unit`

- Возвращает ActionsId. <br> `GetBuffActionsId(Buff buf) -> integer`

- Возвращает длительность. <br> `GetBuffMaxDuration(Buff buf) -> real`

- Возвращает стандартную длительность. <br> `GetBuffDefaultDuration(Buff buf) -> real`

- Возвращает оставшееся время до срабатывания периодического действия. <br> `GetBuffRemainingTimeToAction(Buff buf) -> real`

- Возвращает оставшуюся длительность. <br> `GetBuffRemainingDuration(Buff buf) -> real`

- Возвращает ранг. <br> `GetBuffRank(Buff buf) -> integer`

- Возвращает уровень сложности развеивания. <br> `GetBuffDispelDifficulty(Buff buf) -> integer`

- Возвращает Stackable. <br> `GetBuffStackable(Buff buf) -> boolean`

- Возвращает SingleDuration. <br> `GetBuffSingleDuration(Buff buf) -> boolean`

- Возвращает SingleOutEnter. <br> `GetBuffSingleOutEnter(Buff buf) -> boolean`

- Возвращает SinglePeriod. <br> `GetBuffSinglePeriod(Buff buf) -> boolean`

- Возвращает PierceSpellImmun. <br> `GetBuffPierceSpellImmun(Buff buf) -> boolean`

- Возвращает PierceInvul. <br> `GetBuffPierceInvul(Buff buf) -> boolean`

- Возвращает PierceDeath. <br> `GetBuffPierceDeath(Buff buf) -> boolean`

- Возвращает PeriodActions. <br> `GetBuffPeriodActions(Buff buf) -> boolean`

- Возвращает время периодического срабатывания баффа. <br> `GetBuffPeriod(Buff buf) -> real`

### Сеттеры

- Устанавливает целое значение баффу. <br> `SetBuffDataInt(Buff buf, integer dataInt)`

- Устанавливает реальное значение баффу. <br> `SetBuffDataReal(Buff buf, real dataReal)`

- Устанавливает владельца. <br> `SetBuffOwner(Buff buf, unit ownerUnit)`

- Устанавливает цель. <br> `SetBuffTarget(Buff buf, unit targetUnit)`

- Устанавливает ActionsId. <br> `SetBuffActionsId(Buff buf, integer actionsId)`

- Устанавливает длительность. <br> `SetBuffDuration(Buff buf, real duration)`

- Устанавливает ранг. <br> `SetBuffRank(Buff buf, integer rank)`

- Устанавливает уровень сложности развеивания. <br> `SetBuffDispelDifficulty(Buff buf, integer dispelDifficulty)`

- Устанавливает Stackable. <br> `SetBuffStackable(Buff buf, boolean stackable)`

- Устанавливает SingleDuration. <br> `SetBuffSingleDuration(Buff buf, boolean singleDuration)`

- Устанавливает SingleOutEnter. <br> `SetBuffSingleOutEnter(Buff buf, boolean singleOutEnter)`

- Устанавливает SinglePeriod. <br> `SetBuffSinglePeriod(Buff buf, boolean singlePeriod)`

- Устанавливает PierceSpellImmun. <br> `SetBuffPierceSpellImmun(Buff buf, boolean pierceSpellImmun)`

- Устанавливает PierceInvul. <br> `SetBuffPierceInvul(Buff buf, boolean pierceInvul)`

- Устанавливает PierceDeath. <br> `SetBuffPierceDeath(Buff buf, boolean pierceDeath)`

- Устанавливает время периодического срабатывания баффа. <br> `SetBuffPeriod(Buff buf, real period)`