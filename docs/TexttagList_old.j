 version 1.0 needs update
                                                                                                                
Функции текстагов:                                                                                              

Создает плавающий текст над юнитом с учетом видимости                                                           
call CreateFloatingTextToUnit(unit target, string s)                                                            

Создает настраиваемый плавающий текст над юнитом с учетом видимости                                                                                                                       
call CreateCustomTextToUnit(unit target, string s, real size, real transparency, real lifespan, real fadepoint, real lowSpeed, real maxSpeed, real lowAngle, real maxAngle, real zOffset) 
    
    Пример:                                                                                                     
    call CreateCustomTextToUnit(target, s, 10, 15, 1.2, 0.2, 60., 75., 85., 95.)                                

Создает плавающий стакабельный текст над юнитом с учетом видимости                                              
call StackableFloatingText(unit whichUnit, real valueAdd, integer textType)                                     
    
    Типы стакабельного текста (textType):
    HEAL_TEXT - текст исцеления
    MANA_TEXT - текст восстановления маны
    LS_TEXT   - текст исцеления вампиризмом

Создает динамически изменяющийся стакабельный текст над юнитом с учетом видимости                                                                                                       
call CreateFlyingTextToUnit(unit u, string s, real sizeMin, real sizeBonus, real timeLife, real timeFade, real zOffset, real lowSpeed, real maxSpeed, real lowAngle, real maxAngle)     
    
    Пример:                                                                                                                                     
    call CreateFlyingTextToUnit(udg_AttackedUnit,"|c00ff0303" + I2S(R2I(udg_DMGNegated)) + "!|r", 8, 6, 1.2, 0.2, 0., 75., 100., 75., 105.)     