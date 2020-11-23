	object_const_def ; object_event constants
	const SUNPOINTPHOTOSTUDIO_FISHING_GURU

SunpointPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SunpointPhotoStudioFishingGuruScript:
	jumptextfaceplayer SunpointFishGuruText

SunpointPhotoStudioFishingGuruScriptbackup:
	faceplayer
	opentext
	writetext SunpointPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext SunpointPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext SunpointPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

SunpointPhotoStudioFishingGuruText_Question:
	text "Hei dei #MON"
	line "magnifici con te."

	para "Che ne dici di una"
	line "foto ricordo?"
	done

SunpointPhotoStudioFishingGuruText_Yes:
	text "Ok! Un attimo!"
	done

SunpointPhotoStudioFishingGuruText_No:
	text "Oh, come mi"
	line "dispiace! Una foto"

	para "sarebbe stata un"
	line "bel ricordo…"
	done

SunpointFishGuruText:
	text "Il POZZO LAVA a"
	line "ovest è perico-"
	cont "losamente caldo."
	para "I #MON FUOCO"
	line "sono attratti da"
	cont "quel posto."
	done

SunpointPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 5
	warp_event  5,  7, SUNPOINT_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointPhotoStudioFishingGuruScript, -1
