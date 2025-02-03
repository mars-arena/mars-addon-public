# Stuns

**Stuns** позволяет создавать и динамически управлять пользовательскими оглушениями.

## Особенности

- Удобная настройка создаваемых типов станов;
- Независимая работа станов с разными типами;
- События входа и выхода стана с разнообразием передаваемых состояний;
- Динамическое управление разными типами станов и их состоянием;
- Интегрированные модификаторы юнитов для оглушений;

## StunUnit()

Функция `StunUnit()` оглушает юнита `stunnedUnit` и возвращает уникальный идентификатор созданного оглушения.

    call StunUnit(unit stunningUnit, unit stunnedUnit, integer typeId, real duration)

### Параметры

- `unit stunningUnit` - оглушающий юнит;
- `unit stunnedUnit` - оглушенный юнит
- `integer typeId` - тип стана (пр. `NORMAL_STUN`, `LOST_CONTROL_STUN`);
- `real duration` - длительность стана;

**Возвращаемое значение:**

Функция возвращает уникальный идентификатор созданного объекта, что позволяет сохранить его для того, чтобы получать доступ к объекту вручную, когда это нужно.

### Пример использования

    call StunUnit(udg_AttackingUnit, udg_AttackedUnit, NORMAL_STUN, 10.)    

Функция оглушает юнита `udg_AttackedUnit` от лица `udg_AttackingUnit` на `10 сек.`, типом оглушения `NORMAL_STUN`;

1. Если юнит `udg_AttackedUnit` уже оглушён станом типа `NORMAL_STUN` и его длительность больше, чем `10.` сек, то ничего не произойдет;
2. Если юнит `udg_AttackedUnit` уже оглушён станом типа `NORMAL_STUN` и его длительность меньше, чем `10.` сек, то длительность стана типа `NORMAL_STUN` будет обновлена;
3. Если юнит `udg_AttackedUnit` уже оглушён станом другого типа, но не `NORMAL_STUN`, то он будет оглушён паралельно еще и типом `NORMAL_STUN`, вне зависимости от условий;

#### Типы станов

Типы оглушений отличаются графикой, а также позволяют различать природу оглушений.

- `NORMAL_STUN` - стандартное оглушение;
- `LOST_CONTROL_STUN` - "юнит теряет контроль", техническое оглушения без графики, не действуют модификаторы;
- `FROST_STUN` - оглушение с графикой обморожения;
- `CHAINS_STUN` - еще один тип стана;
- `ANABIOSIS_STUN` - еще один тип стана;

#### Модификаторы

Модификаторы юнитов, относящиеся к оглушениям (`LOST_CONTROL_STUN` игнорирует любые модификаторы).

- [`IMMUN_STUN_ABILITY_ID`](https://github.com/IlliaKorzhov/mars-addon/blob/f512b9d1d99ff6077be18b9e5292a784660e2aa8/config/origin/constants.zn#L29) - id способности, которая дает иммунититет к оглушениям.
- `INC_OUT_STUN_TIME` - увеличение исходящего стана;
- `INC_ENTER_STUN_TIME` - увеличение входящего стана;
- `DEC_OUT_STUN_TIME` - уменьшение исходящего стана;
- `DEC_ENTER_STUN_TIME` - уменьшение входящего стана;

### Добавление новых типов станов

1. Добавить новую константу в [public конструкцию](https://github.com/IlliaKorzhov/mars-addon/blob/master/engine/systems/Stuns.zn#L8) с новым номером:

```lua
...
public {
  constant integer NORMAL_STUN = 1;
  constant integer LOST_CONTROL_STUN = 2;
  constant integer NEW_STUN = 3;
}
...
```

2. Установить графику для вашего нового типа в функции инициализации `onInit()`:

```lua
...
  StunEffect[ANABIOSIS_STUN] = "Abilities\\Spells\\Undead\\FreezingBreath\\FreezingBreathTargetArt.mdl";
  StunAttach[ANABIOSIS_STUN] = "origin";
...
```

## Событие оглушений

- [`TRIG_EVENT_STUN`](https://github.com/IlliaKorzhov/mars-addon/blob/master/engine/systems/Stuns.zn#L5) - События начала и конца оглушения любого юнита любого типа (исключая `LOST_CONTROL_STUN`).
  - `GetTriggerStun() -> Stun` - возвращает объект оглушения;
  - `GetStunningUnit() -> unit` - возвращает оглушающего юнита;
  - `GetStunnedUnit() -> unit` - возвращает оглушенного юнита;
  - `GetStunTypeId() -> integer` - возвращает тип оглушения;
  - `GetStunDuration() -> real` - возвращает длительность оглушения (с модификаторами);
  - `GetStunIsEnter() -> boolean` - это начало оглушения?;
  - `GetStunIsOut() -> boolean` - это конец оглушения (этого типа)?;
  - `GetStunIsFirst() -> boolean` - первое ли оглушение этого типа?;

Чтобы ваш триггер обнаруживал это событие, нужно изменить имя события `TRIG_EVENT_STUN` на ваше имя тригера. Тоесть вы можете повесить только одно событие на один триггер.

Внутри триггера будут доступны следующие геттеры, указанные выше. Вне отслеживаемого триггера они будут возвращать нулевые значение.

Событие начала оглушения `GetStunIsEnter()` триггерятся всегда, если оглушение применилось. События выхода `GetStunIsOut()` триггерится один раз для каждого типа оглушения.

## Список функций

### Основные функции

- Снимает все станы с юнита `stunned`.  <br> `RemoveUnitStun(unit stunned)`

- Снимает стан по типу `typeId` с юнита `stunned`.  <br> `RemoveUnitStunByType(unit stunned, integer typeId)`

- Проверяет, оглушен ли юнит `stunned`.  <br> `IsUnitStunned(unit stunned) -> boolean`

- Проверяет, оглушен ли юнит `stunned` типом `typeId`.  <br> `IsUnitStunnedByType(unit stunned, integer typeId) -> boolean`

- Проверяет, оглушен ли юнит `stunned`, кроме типа `typeId`.  <br> `IsUnitStunnedExceptType(unit stunned, integer typeId) -> boolean`

- Возвращает оставшееся время стана типа `typeId` для юнита `stunned`.  <br> `GetStunRemainingTimeByType(unit stunned, integer typeId) -> real`

- Возвращает объекта класса `Stun` типа `typeId`.  <br> `GetUnitStunByType(unit stunned, integer typeId) -> Stun`

### Геттеры объекта

- Возвращает оставшееся время оглушения.  <br> `GetStunRemainingTime(Stun whichStun) -> real`
