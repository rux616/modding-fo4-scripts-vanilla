;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04REObjectCT02_010138E4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const
