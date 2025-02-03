 version 1.0 needs update
                                                                                                                
Функции модификаторов:                                                                                          


Однозначные модификаторы:

Добавить значение модификатора для юнита                                                                        
call AddUnitModifier(unit u, integer modifier, real value)                                                      
                                                                                                           
Убрать значение модификатора для юнита                                                                          
call SubUnitModifier(unit u, integer modifier, real value)                                                      
                                                                                                           
Возвращает значение модификатора юнита                                                                          
call GetUnitModifier(unit u, integer modifier) -> real                                                          
                                                                                                           
Удалить модификатор по hashId                                                                                   
call DestroyUnitModifier(integer hashId, integer modifier)                                                      


Мультизначные модификаторы:

Добавить значение мультимодификатора для юнита                                                                                                          
call AddUnitMultiModifier(unit u, integer modifier, integer typeModifier, real value2, real value3, real value4, real value5, real value6)              
                                                                                                           
Убрать значение мультимодификатора для юнита                                                                                                            
call SubUnitMultiModifier(unit u, integer modifier, integer typeModifier, real value2, real value3, real value4, real value5, real value6) -> boolean   
                                                                                                           
Возвращает значения модификатора юнита                                                                                                                  
call GetUnitMultiModifier(unit u, integer modifier) -> boolean                                                                                          
    Возвращает значения в глобальные переменные:
    1 - TypeMod; - зарезервированное первое значение для типа модификатора, чтобы их различать
    2 - ValueMod2;
    3 - ValueMod3;
    4 - ValueMod4;
    5 - ValueMod5;
    6 - ValueMod6;
        
Удалить модификатор по hashId                                                                                                                           
call DestroyUnitMultiModifier(integer hashId, integer modifier) -> boolean                                                                              