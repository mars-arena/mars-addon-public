# mars-addon
Заходит улитка в бар.
А бармен говорит: "У нас строгая политика в отношении улиток".
```
mars-addon
├─ !guides
│  ├─ AreaSpellsList.md
│  ├─ AurasList_old.md
│  ├─ BuffsList_old.md
│  ├─ GameFuncList_old.vj
│  ├─ HeroesList.md
│  ├─ ModifierList.vj
│  ├─ SpellsList.vj
│  ├─ StunsList.md
│  ├─ TechFuncList.md
│  └─ TexttagList.vj
├─ cjass
│  └─ BJHooked.cj
├─ config
│  ├─ dev_kane
│  │  ├─ constants.zn
│  │  └─ header.vj
│  └─ origin
│     ├─ constants.zn
│     └─ header.vj
├─ engine
│  ├─ functions
│  │  ├─ CoordUtils.vj
│  │  ├─ GameUtils.zn
│  │  ├─ TechUtils.vj
│  │  └─ TexttagUtils.zn
│  ├─ hashtable
│  │  ├─ HashCleaner.zn
│  │  └─ HashId.zn
│  ├─ libraries
│  │  ├─ AntiMH.vj
│  │  ├─ Armor.vj
│  │  ├─ Debug.zn
│  │  ├─ FloatingText.zn
│  │  ├─ JumpToPoint.zn
│  │  ├─ Math.vj
│  │  ├─ NegateDamage.vj
│  │  ├─ Parabolas.zn
│  │  ├─ Points.zn
│  │  ├─ Rectangle.zn
│  │  ├─ SetUnitMaxState.vj
│  │  ├─ UnitDamaged.vj
│  │  ├─ UnitUnstuck.vj
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
├─ main.vj
├─ main_dev_kane.vj
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
      │  ├─ Hope.vj
      │  ├─ Hort.zn
      │  ├─ James.zn
      │  ├─ Nomi.vj
      │  ├─ Stanley
      │  │  ├─ StanleyMissiles.zn
      │  │  └─ StanleyPiro.zn
      │  ├─ Witcher.zn
      │  └─ Wormy.vj
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