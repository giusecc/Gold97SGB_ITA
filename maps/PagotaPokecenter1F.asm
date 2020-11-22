	object_const_def ; object_event constants
	const PAGOTAPOKECENTER1F_NURSE
	const PAGOTAPOKECENTER1F_GAMEBOY_KID
	const PAGOTAPOKECENTER1F_GENTLEMAN
	const PAGOTAPOKECENTER1F_YOUNGSTER
	const PAGOTAPOKECENTER1F_SCIENTIST

PagotaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaPokecenterNurse:
	jumpstd PokecenterNurseScript

PagotaPokecenter1F_Oak2sAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE
	;setevent EVENT_TOGEPI_HATCHED
	clearevent EVENT_OAK2S_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	;setmapscene ROUTE_112, SCENE_ROUTE112_OFFER_SLOWPOKETAIL
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	waitsfx
	clearevent EVENT_MET_BILL
	end

.AideWalksAroundPlayer:
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement PAGOTAPOKECENTER1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTAPOKECENTER1F_SCIENTIST
	clearevent EVENT_MET_BILL
	waitsfx
	end

.eggname
	db "UOVO@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

PagotaPokecenter1FGameboyKidScript:
	jumptextfaceplayer PagotaPokecenter1FGameboyKidText

PagotaPokecenter1FGentlemanScript:
	jumptextfaceplayer PagotaPokecenter1FGentlemanText

PagotaPokecenter1FYoungsterScript:
	jumptextfaceplayer PagotaPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

UnknownText_0x69555:
	text "<PLAYER>, ne è"
	line "passato del tempo."

	para "Il PROF.OAK mi ha"
	line "detto di cercarti."

	para "Deve chiederti"
	line "un altro favore."

	para "Puoi portare con"
	line "te l'UOVO #MON?"
	
	para "It would benefit"
	line "our research to"
	para "learn a bit more"
	line "about how baby"
	para "#MON interact"
	line "with other"
	para "#MON and how"
	line "this affects their"
	cont "growth."
	para "So could you keep"
	line "this egg with you?"
	done

UnknownText_0x695c5:
	text "Cosa contiene?"
	para "Volevamo mantenere"
	line "la sorpresa!"
	para "Sono sicuro che"
	line "sarà molto utile"
	para "per la tua"
	line "squadra!"
	para "Consideralo un"
	line "regalo!"
	para "Hai saputo che"
	line "BILL è in città?"
	para "BILL ha creato il"
	line "Sistema Memoria"
	cont "#MON!"
	para "Gode di grande"
	line "rispetto tra gli"
	cont "scienziati."
	para "Dovresti fargli"
	line "visita quando"
	cont "puoi."
	para "Ora devo andare!"
	line "Ci si vede!"
	done

UnknownText_0x69693:
	text "No, non puoi"
	line "portare con te"
	cont "altri #MON."

	para "Aspetterò che tu"
	line "faccia spazio per"
	cont "l'UOVO."
	done

UnknownText_0x696f2:
	text "Ma… Il PROF.OAK"
	line "ha chiesto di te…"
	done

UnknownText_0x69712:
	text "<PLAYER>, vuoi"
	line "portare l'UOVO con"
	cont "te?"
	done

UnknownText_0x6972d:
	text "Sarebbe grandioso"
	line "poter lottare"

	para "con i miei amici"
	line "lontani."
	done

UnknownText_0x69791:
	text "Ho appena lottato"
	line "con un amico di"
	cont "ELIOPOLI via link."

	para "Con un MOBILE"
	line "ADAPTER, puoi"

	para "collegarti anche"
	line "con amici lontani."
	done

PagotaPokecenter1FGameboyKidText:
	text "Un tipo di nome"
	line "BILL ha creato il"
	para "Sistema Memoria"
	line "#MON."
	done

PagotaPokecenter1FGentlemanText:
	text "Un anno fa, ce la"
	line "siamo vista"
	cont "brutta."

	para "TEAM ROCKET stava"
	line "per fare del male"
	cont "ai #MON."

	para "Poi però, grazie a"
	line "un ragazzino, la"
	para "giustizia ha"
	line "trionfato."
	done

PagotaPokecenter1FYoungsterText:
	text "I #MON sono"
	line "intelligenti. Non"

	para "obbediscono ad un"
	line "allenatore che non"
	cont "rispettano."

	para "Senza le MEDAGLIE"
	line "giuste faranno"

	para "solo ciò che"
	line "vogliono."
	done

PagotaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, PAGOTA_CITY, 5
	warp_event  6,  7, PAGOTA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokecenterNurse, -1
	object_event  11,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1F_Oak2sAideScript, EVENT_OAK2S_AIDE_IN_PAGOTA_POKEMON_CENTER
