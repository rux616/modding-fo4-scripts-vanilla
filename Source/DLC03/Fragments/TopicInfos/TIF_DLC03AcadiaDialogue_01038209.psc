;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03AcadiaDialogue_01038209 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE GenericDoctorsScript
GenericDoctorsScript kmyQuest = GetOwningQuest() as GenericDoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartMedical(akspeaker, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
