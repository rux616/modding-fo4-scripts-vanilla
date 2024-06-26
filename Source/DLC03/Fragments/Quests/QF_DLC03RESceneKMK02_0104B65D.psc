;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03RESceneKMK02_0104B65D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; how many molerats?
Alias_Molerat01.GetRef().Enable() ; initially disabled so he will init into furniture when enabled
if Utility.RandomInt() > 50
	Alias_Molerat02.GetRef().Enable()
endif
if Utility.RandomInt() > 50
	Alias_Molerat03.GetRef().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Molerat02 Auto Const

ReferenceAlias Property Alias_Molerat03 Auto Const

ReferenceAlias Property Alias_Molerat01 Auto Const
