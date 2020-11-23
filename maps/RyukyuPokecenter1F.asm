	object_const_def ; object_event constants
	const RYUKYUPOKECENTER1F_NURSE
	const RYUKYUPOKECENTER1F_TEACHER
	const RYUKYUPOKECENTER1F_FISHER
	const RYUKYUPOKECENTER1F_YOUNGSTER

RyukyuPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

RyukyuPokecenter1FTeacherScript:
	jumptextfaceplayer RyukyuPokecenter1FTeacherText

RyukyuPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .SolvedSWIslandsPowerCrisis
	writetext RyukyuPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedSWIslandsPowerCrisis:
	writetext RyukyuPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

RyukyuPokecenter1FYoungsterScript:
	jumptextfaceplayer RyukyuPokecenter1FYoungsterText

RyukyuPokecenter1FTeacherText:
	text "Come sono i"
	line "CENTRI #MON"
	para "sulla terra-"
	line "ferma?"

	para "…Oh, capisco. Non"
	line "sono molto"

	para "diversi dai"
	line "nostri."

	para "Posso partire"
	line "senza problemi,"
	cont "allora!"
	done



RyukyuPokecenter1FFisherText:
	text "Sono arrivato"
	line "poco fa da NAZE."
	para "Ho saputo che è"
	line "successo qualcosa"
	cont "con la M/N ACQUA?"
	done

RyukyuPokecenter1FFisherReturnedMachinePartText:
	text "Sembra che i"
	line "viaggi da NAZE"
	para "abbiano ripreso"
	line "a funzionare."
	done

RyukyuPokecenter1FYoungsterText:
	text "Questa città"
	line "è una popolare"
	cont "meta turistica."
	done

RyukyuPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, RYUKYU_CITY, 2
	warp_event  6,  7, RYUKYU_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FTeacherScript, -1
	object_event 10,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FFisherScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FYoungsterScript, -1
