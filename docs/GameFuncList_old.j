Игровые функции: needs update

Имитация атаки

function UnitAttackToTarget(
    unit whichUnit,         /* атакующий юнит */
    unit target,            /* атакованный юнит */
    real value,             /* количество урона */
    attacktype attackType,  /* тип атаки */
    damagetype damageType,  /* тип урона */
    boolean isSpecAttack,   /* это специальная атак? */
    boolean ignoreBlock,    /* игнорировать все блоки, кроме CHANCE_PT_BLOCK_ANY_DMG и PERCENT_BLOCK_ANY_DAMAGE */
    boolean ignoreMiss,     /* игнорировать промахи */
    boolean ignorePierce)   /* игнорировать пронзание */

    Пример:                                                                                                                                 
    call UnitAttackToTarget(owner, target, dmg, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, false, false, false, false)                      

Триггерный урон

function UnitDamageToTarget(
    unit whichUnit,         /* юнит-владелец урона                                                                                                      */
    unit target,            /* юнит-цель урона                                                                                                          */
    real value,             /* количество урона                                                                                                         */
    attacktype attackType,  /* тип атаки                                                                                                                */
    damagetype damageType,  /* тип урона                                                                                                                */
    boolean onTrigger,      /* true - урон отслеживается системой урона, false - урон не отслеживается системой урона                                   */
    boolean isNoRepeat,     /* твой булеан                                                                                                              */
    boolean isReflection,   /* твой булеан                                                                                                              */
    boolean ignoreBlock,    /* игнорирует все блоки, кроме CHANCE_PT_BLOCK_ANY_DMG и PERCENT_BLOCK_ANY_DAMAGE                                           */
    boolean isHide)         /* true - количество урона показывается белым, false - попытается определить тип урона и отобразить соответсвующим цветом   */
    
    Пример:                                                                                                                                 
    call UnitDamageToTarget(owner, target, dmg, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, true, false, false, false, false)                 

                                                                                                                
Исцеление юнита                                                                                                 
call HealUnit(unit whichUnit, unit targetUnit, real value)                                                      
                                                                                                   
Восстановление маны юнита                                                                                       
call RestoreManaUnit(unit whichUnit, unit targetUnit, real value)                                               

Исцеление юнита вампиризмом                                                                                     
call HealUnitLifesteal(unit whichUnit, real value)                                                              


Создать молнию между двумя юнитами

function CreateUnitLightningTarget(
    unit caster,                /* юнит-источник                                */
    unit target,                /* юнит-цель                                    */
    string lightningType,       /* тип молнии                                   */
    string effectCasterModel,   /* модель эффекта на юните-источнике            */
    string effectCasterAttach,  /* аттач эффекта на юните-источнике             */
    string effectTargetModel,   /* модель эффекта на юните-цели                 */
    string effectTargetAttach,  /* аттач эффекта на юните-цели                  */
    real duration,              /* длительность молнии                          */
    real maxDistance,           /* максимальная дистанция молнии                */
    real lightningZ,            /* высота молнии                                */
    real decayTime,             /* время затухания молнии                       */
    boolean destroyEffects)     /* уничтожить эффекты после окончания молнии?   */
    -> integer                  /* возвращаемый ИД молнии                       */
    
    Пример:                                                                                                                                                            
    call CreateUnitLightningTarget(caster, TempUnit01, "FORK", "", "", "Abilities\\Weapons\\Bolt\\BoltImpact.mdl", "origin", 1.4, 10000, 50., 0.75, true)