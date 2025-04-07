# Технические функции needs update

Список технических функций, упрощающих разработку проекта.

- Создает отладочный текст в точке. <br> `DebugXY(string s, real x, real y) -> void`

- Создает отладочный текст. <br> `Debug(string s) -> void`

- Делает юнита летающим. <br> `MakeUnitFly(unit u) -> void`

- Точка за пределами игровой области? <br> `Out(real x, real y) -> boolean`

- Юнит уязвим? <br> `IsUnitInvulnerable(unit u) -> boolean`

- Добавляет юнитов в группу с учетом их физического размера. <br> `GroupEnumUnitsInRangeFiz(group whichGroup, real x, real y, real r, boolexpr filter) -> void`

- Устанавливает время жизни для эффекта. <br> `EffectApplyTimedLife(effect eff, real endTime) -> void`

- Устанавливает время жизни для юнита. <br> `UnitApplyTimeLifeEnd(unit u, real endTime) -> void`

- Применяет способность в точку. <br> `ApplyAbility(unit whichUnit, real x, real y, integer abilityId, integer abilityLvl, string order) -> void`

- Применяет способность для юнита. <br> `ApplyAbilityToUnit(unit whichUnit, unit targetUnit, integer abilityId, integer abilityLvl, string order) -> void`

- Атакует юнита дамми с использованием указанной способности. <br> `DummyAttackUnit(player whichPlayer, unit targetUnit, integer abilityId, integer abilityLvl) -> void`

- Есть ли у юнита предмет типа? <br> `UnitHasItemType(unit whichUnit, integer itemId) -> boolean`

- Создает плавающий текст над юнитом. <br> `CreateFloatingTextToUnit(unit target, string s) -> void`

- Запускает звук локально для игрока. <br> `StartSoundToPlayer(sound snd, player pl) -> void`

- Возвращает текстовое представление логического значения (Да/Нет). <br> `GetBooleanValue(boolean bool) -> string`

- Возвращает цвет игрока. <br> `GetPlayerTextColor(player whichplayer) -> string`

- Добавляет юниту способность перманентно. <br> `UnitAddAbilityPermanent(unit u, integer aId) -> void`