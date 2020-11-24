	object_const_def ; object_event constants
	const TEKNOSFISHINGHOUSE_FISHER

TeknosFishingHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlisseySpeechHouseRadio:
	jumpstd Radio2Script
	

TeknosFishingHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext TeknosFishingHouseFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext TeknosFishingHouseFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext TeknosFishingHouseFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext TeknosFishingHouseFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext TeknosFishingHouseFishingGuruText_After
	waitbutton
	closetext
	end


TeknosFishingHouseFishingGuruText_Question:
	text "Il fiume sul"
	line "PERCORSO 119 è"
	para "popolare tra i"
	line "pescatori."
	
	para "Vuoi pescare?"

	para "Vuoi uno dei"
	line "miei AMI?"
	done

TeknosFishingHouseFishingGuruText_Yes:
	text "Buono a sapersi!"

	para "Ora sei dei"
	line "nostri!"
	done

TeknosFishingHouseFishingGuruText_GiveOldRod:
	text "Che bello pescare!"

	para "Se vedi uno"
	line "specchio d'acqua,"

	para "prova il tuo"
	line "AMO."
	done

TeknosFishingHouseFishingGuruText_No:
	text "Oh. È abbastanza"
	line "deludente…"
	done

TeknosFishingHouseFishingGuruText_After:
	text "Abboccano?"
	done

TeknosFishingHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 4
	warp_event  5,  7, TEKNOS_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BlisseySpeechHouseRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosFishingHouseFishingGuruScript, -1
