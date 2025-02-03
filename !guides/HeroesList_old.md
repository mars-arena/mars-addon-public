# Heroes

**Heroes** дает удобное управление характеристиками и событиями героев.

## Особенности

- Получать реальную силу атаки (основанную на последнем исчеслении);
- Получение серии убийств;

## KillingEvent()

Обрабатывает событие убийства одним героем другого. Требуется для работы системы.

    call KillingEvent(unit killingHero, unit killedHero)

Также позволяет получить прерванную серию убийств убитого героя.

    set udg_TempInt = GetBrokenStreak()

### Параметры

- `unit killingHero` - убивающий герой;
- `unit killedHero` - уюбитый герой;

## Константы

- [`DURATION_SHORT_STREAK`](https://github.com/IlliaKorzhov/mars-addon/blob/master/engine/systems/Heroes.zn#L4) - длительность короткой серии убийств.

## Обнаружение силы атаки героя

Переключает режим обнаружения атак для героя. После включения каждая атака героя будет обновлять силу атаки.

        call SetHeroDetectAttack(unit whichHero, boolean isDetectAttack)

## Список функций

- Возвращает оставшееся время оглушения.  <br> `GetStunRemainingTime(Stun whichStun) -> real`

- Проверяет, активен ли режим обнаружения атак для героя.  <br> `IsHeroDetectAttack(unit whichHero) -> boolean`

- Устанавливает режим обнаружения атак для героя.  <br> `SetHeroDetectAttack(unit whichHero, boolean isDetectAttack)`

- Возвращает значение атаки героя.  <br> `GetHeroAttackValue(unit whichHero) -> real`

- Устанавливает значение атаки для героя.  <br> `SetHeroAttackValue(unit whichHero, real attackValue)`

- Возвращает общую серию убийств героя.  <br> `GetHeroTotalStreak(unit whichHero) -> integer`

- Возвращает короткую серию убийств героя.  <br> `GetHeroShortStreak(unit whichHero) -> integer`

- Возвращает количество убийств игрока одного героя другим.  <br> `GetHeroPlayerStreak(unit originHero, unit targetHero) -> integer`