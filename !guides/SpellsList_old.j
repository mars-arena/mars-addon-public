 version 1.0 needs update 
                                                                                                                
Способности:                                                                                                    

Цепное исцеление

function CastChainHeal(
    unit caster,            /* кастер */
    unit target,            /* цель */
    real value,             /* величина исцеления */
    real reduction,         /* коефициент снижения исцеления */
    integer countTargets,   /* количество целей */
    real radius)            /* максимальный радиус исцеления */

    Пример:                                                                                                     
    call CastChainHeal(caster, target, value, reduction, countTargets, radius)                                  


Цепная молния

function CastChainLightning(
    unit caster,            /* кастер */
    unit target,            /* цель */
    real value,             /* величина урона */
    real reduction,         /* коефициент снижения урона */
    integer countTargets,   /* количество целей */
    real radius)            /* максимальный раидус цепной молнии */

    Пример:                                                                                                     
    call CastChainLightning(caster, target, value, reduction, countTargets, radius)                             


Разветленная молния

function CastLightning(
    unit caster,            /* кастер */
    unit target,            /* цель */
    real value,             /* величина урона */
    real angle,             /* угол */
    integer countTargets,   /* количество целей */
    real radius)            /* максимальный раидус  */

    Пример:                                                                                                     
    call CastLightning(caster, target, value, angle, countTargets, radius)                                      
    
    
Чакрам

function CastChakram(
    unit owner,             /* владелец */
    unit target,            /* цель */
    integer chakramId,      /* тип юнита чакрама */
    real dmg,               /* величина урона */
    real reduction,         /* коефициент снижения урона */
    integer countTargets,   /* количество целей */
    real radius,            /* максимальный раидус */
    real speed,             /* скорость чакрама */
    boolean isAttack        /* является ли атакой? */
    integer actionsId)      /* id действий, которые запускается в OtherActions, 0 - чакрам не возвращается */

    Пример:                                                                                                     
    call CastChakram(udg_AttackingUnit, udg_AttackedUnit, 'h009', udg_DMGFinal, 0.25, 4, 400, 1000, true)       


Прямоугольный сплеш

function RectangleSplash(
    unit owner,             /* владелец */
    unit target,            /* цель */
    real dmg,               /* величина урона */
    real percentdmg,        /* коефициент снижения урона */
    real length,            /* длина */
    real width,             /* ширина */

    Пример:                                                                                                     
    call RectangleSplash(udg_AttackingUnit, udg_AttackedUnit, udg_DMGFinal, 0.25, 1000, 200)                    
    
                                                                                                                
                                                                                                                