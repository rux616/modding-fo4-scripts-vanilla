;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03WorkshopTrapperAttac_0104B651 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; run timer to expire attack if player doesn't go to location
kmyQuest.StartTimerGameTime(24.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
; reset timer to shorter
CancelTimerGameTime()
workshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
if workshopRef.Is3DLoaded() == false && workshopRef.OwnedByPlayer
	WorkshopRaiderAttack03Message.Show()
	SetObjectiveDisplayed(10)
	workshopRef.SetValue(kmyQuest.REParent.WorkshopActorAlert, 1)
else
	; now quest should shutdown when everything unloads
	kmyQuest.StopQuestWhenAliasesUnloaded = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
; failsafe - make sure registered for cleanup
kmyQuest.RegisterForCustomEvent(kmyQuest.REParent, "RECheckForCleanup")
SetObjectiveCompleted(10)
; clear alert value
alias_workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Make this workshop player owned
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
if kmyQuest.CheckResolveAttack()
	if IsObjectiveDisplayed(10)
		WorkshopRaiderAttack03LoseMessage.Show()
	endif
	FailAllObjectives()
else
	if IsObjectiveDisplayed(10) && IsObjectiveCompleted(10) == false
		WorkshopRaiderAttack03WinMessage.Show()
	endif
	CompleteAllObjectives()
endif
; remove everyone from the "grateful" faction
kmyQuest.AddToGratefulFaction(Alias_SettlementSpokesman, Alias_SettlementNPCs, false)
; clear alert value
alias_workshop.TryToSetValue(kmyQuest.REParent.WorkshopActorAlert, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

Message Property WorkshopRaiderAttack03Message Auto Const

Message Property WorkshopRaiderAttack03LoseMessage Auto Const Mandatory

Message Property WorkshopRaiderAttack03WinMessage Auto Const Mandatory
