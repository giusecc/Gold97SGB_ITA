	object_const_def ; object_event constants
	const KUME_SOCIAL_HOUSE_N64_LASS
	const KUME_SOCIAL_HOUSE_YOUNGSTER
	const KUME_SOCIAL_HOUSE_COOLTRAINER_F
	const KUME_SOCIAL_HOUSE_POKEFAN_F
	const KUME_SOCIAL_HOUSE_FISHER
	const KUME_SOCIAL_HOUSE_SAILOR

KumeSocialHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeSocialHouseN64LassScript:
	faceplayer
	opentext
	writetext SendN64LassOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, KumeSocialHouseN64LassRightScript
	jump KumeSocialHouseN64LassUpScript
	end
	
KumeSocialHouseN64LassRightScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassRightMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3
	clearevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	waitsfx
	end
	
KumeSocialHouseN64LassUpScript:
	applymovement KUME_SOCIAL_HOUSE_N64_LASS, KumeSocialHouseN64LassUpMovement
	playsound SFX_EXIT_BUILDING
	disappear KUME_SOCIAL_HOUSE_N64_LASS
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3
	clearevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	waitsfx
	end
	
KumeSocialHouseSailorScript:
	jumptextfaceplayer KumeSocialHouseSailorText
	
KumeSocialHouseYoungsterScript:
	jumptextfaceplayer KumeSocialHouseYoungsterText
	
KumeSocialHouseCooltrainerfScript:
	jumptextfaceplayer KumeSocialHouseCooltrainerfText
	
KumeSocialHousePokefanfScript:
	jumptextfaceplayer KumeSocialHousePokefanfText
	
KumeSocialHouseFisherScript:
	jumptextfaceplayer KumeSocialHouseFisherText
	
KumeSocialHouseN64LassRightMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseN64LassUpMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KumeSocialHouseYoungsterText:
	text "Credo che PINO"
	line "sia il più"
	para "ganzo dei"
	line "SUPERQUATTRO."
	para "Non c'è dubbio!"
	done
	
KumeSocialHouseSailorText:
	text "Qualcuno è mai"
	line "stato alle ISOLE"
	cont "MERIDIONALI?"
	para "Dicono che ci"
	line "siano molti"
	cont "#MON rari."
	done
	
KumeSocialHouseCooltrainerfText:
	text "La migliore è"
	line "MISTY!"
	para "Ha troppo stile!"
	done
	
KumeSocialHousePokefanfText:
	text "Ho saputo che"
	line "alcuni ragazzini"
	para "hanno sconfitto il"
	line "TEAM ROCKET!"
	para "Mi sembra assurdo,"
	line "onestamente."
	done

KumeSocialHouseFisherText:
	text "In questo posto"
	line "si socializza e"
	para "spettegola"
	line "un po'."
	para "Io preferisco"
	line "ascoltare."
	done
	
SendN64LassOffText:
	text "Non vado sulla"
	line "terraferma da un"
	cont "bel po'."
	para "Non sarebbe male"
	line "andarci."
	para "Ho un amico a"
	line "PORTOVEST che"
	cont "vorrei incontrare."
	para "Sarebbe bello"
	line "vedersi e giocare"
	para "ai videogiochi!"
	para "Cosa?"
	para "Conosci un posto"
	line "per farlo?"
	para "Allora credo non"
	line "ci sia momento"
	para "migliore di questo"
	line "per mettersi in"
	cont "viaggio!"
	para "Inizio a preparare"
	line "tutto!"
	para "Grazie!"
	done
	
KumeSocialHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, KUME_CITY, 5
	warp_event  3,  7, KUME_CITY, 5

	db 0 ; coord events

	db 0 ; bg events


	db 6 ; object events
	object_event  5,  1, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseN64LassScript, EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3
	object_event  3,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseYoungsterScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseCooltrainerfScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHousePokefanfScript, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseFisherScript, -1
	object_event  9,  5, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeSocialHouseSailorScript, -1
