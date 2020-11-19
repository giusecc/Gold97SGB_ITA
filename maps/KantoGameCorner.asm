	object_const_def ; object_event constants
	const KANTOGAMECORNER_CLERK
	const KANTOGAMECORNER_RECEPTIONIST
	const KANTOGAMECORNER_POKEFAN_M
	const KANTOGAMECORNER_TEACHER
	const KANTOGAMECORNER_FISHING_GURU
	const KANTOGAMECORNER_FISHER1
	const KANTOGAMECORNER_FISHER2
	const KANTOGAMECORNER_GYM_GUY
	const KANTOGAMECORNER_GRAMPS
	const KANTOGAMECORNER_N64_ROCKER

KantoGameCorner_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

KantoGameCornerReceptionistScript:
	jumptextfaceplayer KantoGameCornerReceptionistText

KantoGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_POKEFAN_M, RIGHT
	end

KantoGameCornerTeacherScript:
	faceplayer
	opentext
	writetext KantoGameCornerTeacherText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_TEACHER, RIGHT
	end

KantoGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext KantoGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_FISHING_GURU, RIGHT
	end

KantoGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_KANTO
	iftrue .GotCoins
	writetext KantoGameCornerFisherText1
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	stringtotext .coinname, MEM_BUFFER_1
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_KANTO
.GotCoins:
	writetext KantoGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "GETT.@"

.NoCoinCase:
	writetext KantoGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext KantoGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

KantoGymGuyScript:
	jumptextfaceplayer KantoGymGuyText

KantoGameCornerGrampsScript:
	faceplayer
	opentext
	writetext KantoGameCornerGrampsText
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_GRAMPS, LEFT
	end

KantoGameCornerPoster1Script:
	jumptext KantoGameCornerPoster1Text

KantoGameCornerPoster2Script:
	jumptext KantoGameCornerPoster2Text

KantoGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, KantoGameCornerSlotMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

KantoGameCornerSlotMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

KantoGameCornerCardFlipScript:
	refreshscreen
	special CardFlip
	closetext
	end

KantoGameCornerLighterScript:
	jumptext KantoGameCornerLighterText

KantoGameCornerSodaCanScript:
	opentext
	writetext KantoGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end
	
KantoGameCornerPokefanMScript2:
	faceplayer
	opentext
	writetext KantoGameCornerPokefanMText2
	waitbutton
	closetext
	turnobject KANTOGAMECORNER_FISHER1, LEFT
	end

KantoGameCornerN64RockerScript:
	faceplayer
	opentext
	writetext SendN64RockerOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, GameCornerN64RockerDownScript
	jump GameCornerN64RockerLeftScript
	end
	
GameCornerN64RockerDownScript:
	applymovement KANTOGAMECORNER_N64_ROCKER, GameCornerN64RockerDownMovement
	playsound SFX_EXIT_BUILDING
	disappear KANTOGAMECORNER_N64_ROCKER
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3
	waitsfx
	end
	
GameCornerN64RockerLeftScript:
	applymovement KANTOGAMECORNER_N64_ROCKER, GameCornerN64RockerLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear KANTOGAMECORNER_N64_ROCKER
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3
	waitsfx
	end
	
GameCornerN64RockerLeftMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end
	
	
GameCornerN64RockerDownMovement:	
	step RIGHT
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

SendN64RockerOffText:
	text "Mi piace giocare!"
	line "Ma sono stanco del"
	para "gioco d'azzardo."
	para "Vorrei giocare a"
	line "un bel videogioco!"
	para "Eh?"
	para "C'è un posto"
	line "vicino a PORTOVEST"
	para "che dovrei"
	line "visitare?"
	para "Va bene, ci andrò,"
	line "grazie!"
	done

KantoGameCornerReceptionistText:
	text "Benvenuto!"

	para "Qui vicino puoi"
	line "scambiare i tuoi"

	para "gettoni con"
	line "fantastici premi."
	done

KantoGameCornerPokefanMText:
	text "Sono tutte slot"
	line "machine"
	cont "modernissime."
	done

KantoGameCornerTeacherText:
	text "È questa la mia"
	line "slot fortunata."

	para "Ieri mi ha"
	line "ripulito, quindi"

	para "oggi mi dovrà far"
	line "vincere!"
	done

KantoGameCornerFishingGuruText:
	text "Con questa slot"
	line "penso di poter"
	cont "vincere…"

	para "Le probabilità"
	line "variano secondo"
	cont "la slot."
	done

KantoGameCornerFisherText1:
	text "Sììììì!"

	para "Continuano a"
	line "scendere gettoni!"

	para "Come? Vuoi"
	line "giocare?"

	para "Ti darò un po'"
	line "della mia vincita!"
	done

KantoGameCornerFisherText2:
	text "Ahahahah!"

	para "Fare buone azioni"
	line "per il prossimo mi"

	para "fa sentire proprio"
	line "bene!"
	done

KantoGameCornerFisherNoCoinCaseText:
	text "Ehi, ti manca il"
	line "SALVADANAIO."

	para "Non posso darti"
	line "gettoni se non sai"
	cont "dove metterli."
	done

KantoGameCornerFisherFullCoinCaseText:
	text "Hai il SALVADANAIO"
	line "pieno, ragazzo!"

	para "Pare che stia"
	line "andando bene anche"
	cont "a te!"
	done

KantoGymGuyText:
	text "Anche tu giochi"
	line "alle slot?"

	para "Spero di riuscire"
	line "a vincere un"
	cont "#MON!"

	para "Ma dovrei avere"
	line "più gettoni…"
	done

KantoGameCornerPokefanMText2:
	text "Vediamo… Sembra"
	line "probabile che esca"

	para "una fila di"
	line "PIKACHU, ma…"
	done
	
KantoGameCornerGrampsText:
	text "Mio papà mi porta"
	line "qui spesso."
	para "Ma sono troppo"
	line "piccolo per"
	cont "giocare."
	done

KantoGameCornerPoster1Text:
	text "Ehi!"

	para "Sotto a questo"
	line "poster…"

	para "Non c'è nulla!"
	done

KantoGameCornerPoster2Text:
	text "Ehi!"

	para "Sotto a questo"
	line "poster…"

	para "Non c'è nulla!"
	done

KantoGameCornerLighterText:
	text "C'è un accendino."
	done

KantoGameCornerSodaCanText:
	text "Una lattina…"

	para "Dev'essere di"
	line "qualcuno…"

	para "Ehi, è vuota!"
	done

KantoGameCorner_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 13, KANTO_REGION, 6
	warp_event 10, 13, KANTO_REGION, 32
	warp_event  8, 13, KANTO_REGION, 6
	warp_event 11, 13, KANTO_REGION, 32


	db 0 ; coord events

	db 38 ; bg events
	bg_event  1,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  2,  0, BGEVENT_LEFT, KantoGameCornerCardFlipScript
	bg_event  6,  4, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  5, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, KantoGameCornerSodaCanScript
	bg_event  6,  8, BGEVENT_READ, KantoGameCornerCardFlipScript
	bg_event  0,  0, BGEVENT_RIGHT, KantoGameCornerCardFlipScript
	bg_event  7,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, KantoGameCornerSlotMachineScript
	bg_event  1,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  5,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  6,  0, BGEVENT_LEFT, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  4, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  5, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, KantoGameCornerLighterScript
	bg_event 18,  7, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, KantoGameCornerLuckySlotMachineScript
	bg_event  7,  0, BGEVENT_RIGHT, KantoGameCornerLuckySlotMachineScript
	bg_event  4,  0, BGEVENT_READ, KantoGameCornerPoster1Script
	bg_event  3,  0, BGEVENT_READ, KantoGameCornerPoster2Script

	db 10 ; object events
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerClerkScript, -1
	object_event  3,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerReceptionistScript, -1
	object_event 17,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript, -1
	object_event 11,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoGameCornerTeacherScript, -1
	object_event 11,  6, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFishingGuruScript, -1
	object_event  2,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPokefanMScript2, -1
	object_event 14,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerFisherScript, -1
	object_event  5,  8, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript, -1
	object_event  2,  7, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerGrampsScript, -1
	object_event 13, 13, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerN64RockerScript, EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
