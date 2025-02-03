# mars-addon
Заходит улитка в бар.
А бармен говорит: "У нас строгая политика в отношении улиток".
```
mars-addon
├─ !guides
│  ├─ AreaSpellsList.md
│  ├─ AurasList_old.md
│  ├─ BuffsList_old.md
│  ├─ GameFuncList_old.j
│  ├─ HeroesList.md
│  ├─ ModifierList.j
│  ├─ SpellsList.j
│  ├─ StunsList.md
│  ├─ TechFuncList.md
│  └─ TexttagList.j
├─ cjass
│  └─ BJHooked.cj
├─ config
│  ├─ dev_kane
│  │  ├─ constants.zn
│  │  └─ header.j
│  └─ origin
│     ├─ constants.zn
│     └─ header.j
├─ engine
│  ├─ functions
│  │  ├─ CoordUtils.j
│  │  ├─ GameUtils.zn
│  │  ├─ TechUtils.j
│  │  └─ TexttagUtils.zn
│  ├─ hashtable
│  │  ├─ HashCleaner.zn
│  │  └─ HashId.zn
│  ├─ libraries
│  │  ├─ AntiMH.j
│  │  ├─ Armor.j
│  │  ├─ Debug.zn
│  │  ├─ FloatingText.zn
│  │  ├─ JumpToPoint.zn
│  │  ├─ Math.j
│  │  ├─ NegateDamage.j
│  │  ├─ Parabolas.zn
│  │  ├─ Points.zn
│  │  ├─ Rectangle.zn
│  │  ├─ SetUnitMaxState.j
│  │  ├─ UnitDamaged.j
│  │  ├─ UnitUnstuck.j
│  │  ├─ Vector.zn
│  │  └─ VectorAPI.zn
│  ├─ systems
│  │  ├─ AreaSpells.zn
│  │  ├─ Auras.zn
│  │  ├─ Buffs.zn
│  │  ├─ Damage.zn
│  │  ├─ DynamicProjectiles.zn
│  │  ├─ Events.zn
│  │  ├─ Heroes.zn
│  │  ├─ Illusions.zn
│  │  ├─ Modifiers.zn
│  │  ├─ MultiModifiers.zn
│  │  ├─ SpellGetters.zn
│  │  ├─ StaticProjectiles.zn
│  │  └─ Stuns.zn
│  └─ tests
│     └─ AurasTest.zn
├─ main.j
├─ main_dev_kane.j
└─ mars
   ├─ auras
   │  ├─ AurasActions.zn
   │  ├─ AurasActions_dev.zn
   │  ├─ AurasFilters.zn
   │  └─ AurasTypes.zn
   ├─ buffs
   │  ├─ BuffActions.zn
   │  ├─ BuffActions_dev.zn
   │  ├─ BuffFilters.zn
   │  └─ BuffTypes.zn
   ├─ keys
   │  └─ HashIdGUI.zn
   ├─ modifiers
   │  ├─ ModifiersList.zn
   │  └─ MultiModifiersList.zn
   └─ spells
      ├─ Filters.zn
      ├─ SpellsTypes.zn
      ├─ heroes
      │  ├─ Arthas
      │  │  ├─ ArthasDome.zn
      │  │  └─ ArthasJump.zn
      │  ├─ Fox.zn
      │  ├─ Gordon.zn
      │  ├─ Hope.j
      │  ├─ Hort.zn
      │  ├─ James.zn
      │  ├─ Nomi.j
      │  ├─ Stanley
      │  │  ├─ StanleyMissiles.zn
      │  │  └─ StanleyPiro.zn
      │  ├─ Witcher.zn
      │  └─ Wormy.j
      ├─ items
      │  └─ HiruzenSpear.zn
      └─ others
         ├─ ChainHeal.zn
         ├─ ChainLightning.zn
         ├─ Chakram.zn
         ├─ CliffMiss.zn
         ├─ Doubles.zn
         ├─ Hammer.zn
         ├─ Lightning.zn
         └─ RectangleSplash.zn

```