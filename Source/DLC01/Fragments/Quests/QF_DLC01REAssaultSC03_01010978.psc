;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01REAssaultSC03_01010978 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
((self as Quest) as REAssaultQuestScript).InitAssault()
kmyquest.Startup()

;Enable the actors we want to use for this assault.
;--Defender01: The Robobrain enables only if MQ05 has started.
if (DLC01MQ05.GetStage() > 0)
     Alias_Defender01.TryToEnable()
EndIf
;--Defender02: Enables 50% of the time.
if (Utility.RandomInt(0, 1) == 0)
     Alias_Defender02.TryToEnable()
EndIf
;--Defenders 03-05 are always enabled.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
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
;debug.trace(self + " STOPPING")
((Self as Quest) as REAssaultQuestScript).CleanupAssault()
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

Quest Property DLC01MQ05 Auto Const Mandatory

ReferenceAlias Property Alias_Defender01 Auto Const Mandatory

ReferenceAlias Property Alias_Defender02 Auto Const Mandatory
