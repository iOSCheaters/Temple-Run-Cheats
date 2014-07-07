/**************************************************************
**************************************************************
* Temple Run Mod
* Includes: Score Multiplier, can't die, loads of coins
* Always angel wings, game never speeds up
* Just comment out any hacks you don't want to compile
* *********************Created by razzile*********************
**************************************************************/
 
#include <substrate.h>

// these hold a reference to the original function (like %orig in theos)
int (*old_GetScoreMultiplier)(); 
bool (*old_Player_hasInvinsibility)();
bool (*old_Player_hasAngelWings)();
int (*old_Player_GetCoinCount)();
int (*old_Player_GetMaxRunVelocity)();
 
 
int GetScoreMultipler() { 
return 999;
}
 
bool Player_hasInvincibility() {
return true;
}
 
bool Player_hasAngelWings() {
return true;
}
 
int Player_GetCoinCount() {
return 9999;
}
 
int Player_GetMaxRunVelocity() {
return 10; //10 is default, game never speeds up
}
 
%ctor { 
/*comment out any hacks you don't wish to compile here*/
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZNK7cPlayer18getScoreMultiplierEv")),(void*)GetScoreMultipler,(void**)&old_GetScoreMultiplier);
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZNK7cPlayer15hasInvincibiltyEv")),(void*)Player_hasInvincibility,(void**)&old_Player_hasInvinsibility);
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZNK7cPlayer13hasAngelWingsEv")),(void*)Player_hasAngelWings,(void**)&old_Player_hasAngelWings);
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZNK7cPlayer17getCoinCountTotalEv")),(void*)Player_GetCoinCount,(void**)&old_Player_GetCoinCount);
MSHookFunction(((void*)MSFindSymbol(NULL, "__ZNK7cPlayer17getMaxRunVelocityEv")),(void*)Player_GetMaxRunVelocity,(void**)&old_Player_GetMaxRunVelocity);
}
