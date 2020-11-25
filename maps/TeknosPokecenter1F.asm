	object_const_def ; object_event constants
	const TEKNOSPOKECENTER1F_NURSE
	const TEKNOSPOKECENTER1F_POKEFAN_M
	const TEKNOSPOKECENTER1F_COOLTRAINER_F
	const TEKNOSPOKECENTER1F_GYM_GUY
	const TEKNOSPOKECENTER1F_BILL

TeknosPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	priorityjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	appear TEKNOSPOKECENTER1F_BILL
	applymovement TEKNOSPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement1
	opentext
	writetext TeknosPokecenter1F_BillText1
	waitbutton
	closetext
	applymovement TEKNOSPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear TEKNOSPOKECENTER1F_BILL
	setflag ENGINE_TIME_CAPSULE
	clearevent EVENT_TEKNOS_CITY_GRAMPS
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_BOULDER_MINE_WHITNEY
	setscene SCENE_FINISHED
	waitsfx
	end

TeknosPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

TeknosPokecenter1FPokefanMScript:
	jumptextfaceplayer TeknosPokecenter1FPokefanMText


TeknosPokecenter1FCooltrainerFScript:
	jumptextfaceplayer TeknosPokecenter1FCooltrainerFText

TeknosPokecenter1FGymGuyScript:
	jumptextfaceplayer TeknosPokecenter1FGymGuyText

TeknosPokecenter1FBillMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step UP
	step RIGHT
	step LEFT
	step UP
	step RIGHT
	step DOWN
	step LEFT
	step DOWN
	step_end

TeknosPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step_end

TeknosPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

TeknosPokecenter1F_BillText1:
	text "Oh no, oh no."
	para "Neanche qui!"
	para "Ho cercato"
	line "ovunque!"
	para "Oh no, oh no."
	line "Per caso hai"
	para "visto una"
	line "ragazzina da"
	cont "queste parti?"
	para "È mia nipote."
	para "Non riesco a"
	line "trovarla!"
	para "…"
	para "Oh, no. Spero non"
	line "sia rimasta"
	cont "nella CAVA…"
	para "C'è una vecchia"
	line "CAVA a ovest della"
	para "città, dove i"
	line "bambini vanno"
	cont "a giocare."
	para "Ma è un posto"
	line "pericoloso!"
	para "Puoi andare a"
	line "cercare mia"
	cont "nipote?"
	para "Non so dove altro"
	line "possa essere."
	para "Oh no, oh no."
	done

TeknosPokecenter1F_BillText2:
	text "Ho creato il"
	line "Sistema Memoria"
	cont "#MON!"

	para "Spero che lo"
	line "trovi utile."
	
	para "È molto utile se"
	line "vuoi catturare"
	cont "tutti i #MON!"

	para "Devo tornare a"
	line "PORTOVEST ora!"

	para "Ciao!"
	done

TeknosPokecenter1FPokefanMText:
	text "Il tuo #MON"
	line "sarà più"
	para "amichevole con"
	line "te se lo tratti"
	cont "bene."
	done

TeknosPokecenter1FPokefanMTextMobile:
	text "Vuoi lottare"
	line "con altri"

	para "allenatori?"
	line "C'è un posto dove"

	para "si radunano"
	line "gli allenatori."

	para "Dove?"

	para "Vicino a"
	line "DESMOPOLI."
	done

TeknosPokecenter1FCooltrainerFText:
	text "I tuoi #MON co-"
	line "noscono mosse MN?"
	para "Queste mosse si"
	line "possono usare al"
	para "di fuori della"
	line "lotta anche se"
	para "il #MON è"
	line "esausto!"
	done

TeknosPokecenter1FGymGuyText:
	text "Sei stato ai"
	line "MOLI di ELIOPOLI?"
	para "Dimenticati"
	line "gli altri porti!"
	para "Quello è"
	line "un enorme centro"
	cont "di scambi."
	done

TeknosPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, TEKNOS_CITY, 3
	warp_event  6,  7, TEKNOS_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FNurseScript, -1
	object_event 12,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FGymGuyScript, -1
	object_event 11,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEKNOS_POKE_CENTER_BILL
