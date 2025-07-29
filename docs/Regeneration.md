# Regeneration

**Regeneration** — кастомная система регенерации здоровья и маны с поддержкой модификаторов, событий и бонусов.

**Преимущества:**

* Легкая и гибкая в использовании архитектура, построенная на событиях, подражая стандартным событиям Warcraft 3.
* Динамическая модификация значений регенерации. Не нужно добавлять / удалять модификаторы, один раз добавил модификатор и он сработает при прописанных тобой условиях.
* Регистрация действий на событие регенерации.
* Автообновление значений. Не нужно вручную следить, когда нужно пересчитать значение регенерации.

## Как пользоваться

Пример: добавить плоский бонус +5 HP/сек, если на юните есть бафф:

```zinc
RegisterAction(EVENT_HP_REGENERATION_MODIFIER, function() {
	if (IsUnitBuffByType(GetRegenModifierUnit(), BUFF_ID)) {
		AddRegenModifierFlat(5.0);
	}
});
```

Или уменьшить MP-реген на 30%, если висит дебафф:

```zinc
RegisterAction(EVENT_MP_REGENERATION_MODIFIER, function() {
	if (IsUnitBuffByType(GetRegenModifierUnit(), DEBUFF_ID)) {
		AddRegenModifierDecrease(0.3);
	}
});
```

Можно использовать и `Set*`, и `Add*` методы — они эквивалентны по силе, но `Set*` заменяют значение, а `Add*` накапливают.

## Как работает

Система автоматически пересчитывает регенерацию при ключевых игровых событиях (см. ниже). Алгоритм:

1. Вызывается `GetUnitHpRegen(unit)` или `GetUnitMpRegen(unit)`
2. Срабатывает событие `*_REGENERATION_MODIFIER`, в котором проверются все модификаторы.
3. Система собирает модификации и считает реген по формуле:

   ```text
   regen = (flat - penalty) * (1 + increase) * (1 - decrease)
   if regen > cap => regen = cap
   ```
4. Значение сохраняется.
5. Событие регенерации срабатывает периодически (1/4 сек.) `*_REGENERATION` и регенерирует здоровье на сохраненное значение.

**Когда происходит обновление значений:**

* атака
* ап уровня
* изучение способности
* воскрешение
* поднятие/сброс предмета
* вход юнита на карту
* получение/снятие баффа
* инициализация стартовых юнитов
* изменение процента здоровья / маны

## События

| Название                         | Описание                                   |
| -------------------------------- | ------------------------------------------ |
| `EVENT_HP_REGENERATION_MODIFIER` | Вызывается при `GetUnitHpRegen(unit)` |
| `EVENT_HP_REGENERATION`          | После применения HP-регена (каждые 1/4 сек.)                 |
| `EVENT_MP_REGENERATION_MODIFIER` | Вызывается при `GetUnitMpRegen(unit)` |
| `EVENT_MP_REGENERATION`          | После применения MP-регена (каждые 1/4 сек.)                 |

## API

### Модификаторы (`*_REGENERATION_MODIFIER`)

```zinc
GetRegenModifierUnit() -> unit
GetRegenModifierFlat() -> real
GetRegenModifierPenalty() -> real
GetRegenModifierIncrease() -> real
GetRegenModifierDecrease() -> real
GetRegenModifierCap() -> real
```

```zinc
AddRegenModifierFlat(real)
AddRegenModifierPenalty(real)
AddRegenModifierIncrease(real)
AddRegenModifierDecrease(real)
AddRegenModifierCap(real)
```

```zinc
SetRegenModifierFlat(real)
SetRegenModifierPenalty(real)
SetRegenModifierIncrease(real)
SetRegenModifierDecrease(real)
SetRegenModifierCap(real)
```

### После применения (`*_REGENERATION`)

```zinc
GetRegenUnit() -> unit
GetRegenValue() -> real
```

---

## Дополнительно

* Все изменения регенерации через `*_REGENERATION_MODIFIER` события.
* Для отображения эффектов при регенерации слушай `*_REGENERATION`.
* Можно вызывать `GetUnitHpRegen()` вручную для получения регена или его принудительного обновления.
* Нельзя использовать API вне ивентов. Будет ошибка.
* Вызов `GetUnitHpRegen()` поднимает событие. Не вызывай рекурсивно.
* Если юнит мёртв, то реген не обновляется.
