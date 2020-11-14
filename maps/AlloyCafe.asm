	object_const_def ; object_event constants
	const ALLOYCAFE_SAILOR1
	const ALLOYCAFE_FISHING_GURU
	const ALLOYCAFE_SAILOR2
	const ALLOYCAFE_CLERK

AlloyCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotStrength
	writetext AlloyCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_FLY
	setevent EVENT_GOT_HM02_FLY
.GotStrength:
	writetext AlloyCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end
	
AlloyCafeClerkScript:
	jumptextfaceplayer AlloyCafeClerkText

AlloyCafeFishingGuruScript:
	jumptextfaceplayer AlloyCafeFishingGuruText

AlloyCafeSailorScript:
	jumptextfaceplayer AlloyCafeSailorText

AlloyCafeStrengthSailorText:
	text "Andare in barca"
	line "è così fuori"
	cont "moda!"
	para "Anche camminare!"
	para "Perché non ti fai"
	line "portare in volo"
	cont "dai tuoi #MON?"
	done

AlloyCafeStrengthSailorText_GotStrength:
	text "Abbiamo ancora"
	line "bisogno di navi."
	para "I #MON non"
	line "possono portare"
	cont "merci in volo."
	done

AlloyCafeFishingGuruText:
	text "Il menu del"
	line "DESMOCAFÉ è pieno"

	para "zeppo di piatti"
	line "per ghiottoni!"
	done

AlloyCafeSailorText:
	text "Ogni volta che"
	line "passo per questa"

	para "città vado sempre"
	line "al DESMOCAFÉ."

	para "Qui ci sono piatti"
	line "deliziosi!"
	done
	
AlloyCafeClerkText:
	text "Benvenuto al"
	line "DESMOCAFÉ!"
	para "Abbiamo piatti"
	line "per ogni palato!"
	done

AlloyCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ALLOY_CITY, 7
	warp_event  3,  7, ALLOY_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeStrengthSailorScript, -1
	object_event  3,  1, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeFishingGuruScript, -1
	object_event  5,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeSailorScript, -1
	object_event  1,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCafeClerkScript, -1
