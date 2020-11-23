	object_const_def ; object_event constants
	const RYUKYU_ARBORETUM_BULBASAUR_LADY
	const RYUKYU_ARBORETUM_ODDISH
	const RYUKYU_ARBORETUM_BULBASAUR
	const RYUKYU_ARBORETUM_PARAS
	const RYUKYU_ARBORETUM_YOUNGSTER
RyukyuArboretum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RyukyuMagnetTrainSpeechHouseCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_14
	iftrue .AlreadyGotBulbasaur
	writetext ILoveBulbasaurText
	yesorno
	iffalse .DontTakeBulbasaur
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullBulbasaur
	writetext UnknownText_0x7e355ab
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	writetext GiveBulbasaurText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_14
	end
	
.AlreadyGotBulbasaur
	writetext AlreadyGotBulbasaurText
	waitbutton
	closetext
	end
	
.DontTakeBulbasaur
	writetext NoBulbasaurText
	waitbutton
	closetext
	end
	
.PartyFullBulbasaur
	writetext PartyFullBulbasaurText
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainOddishScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainOddishText
	cry ODDISH
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainBulbasaurScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainBulbasaurText
	cry BULBASAUR
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainParasScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainParasText
	cry PARAS
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainSpeechHouseYoungsterScript:
	jumptextfaceplayer RyukyuMagnetTrainSpeechHouseYoungsterText
	
RyukyuMagnetTrainSpeechHouseYoungsterText:
	text "Questo posto è"
	line "splendido!"
	para "I #MON ERBA"
	line "lo adorano!"
	done
	
RyukyuMagnetTrainParasText:
	text "PARAS:"
	line "Paraa…"
	done
	
RyukyuMagnetTrainBulbasaurText:
	text "BULBASAUR:"
	line "Bulba!"
	done
	
RyukyuMagnetTrainOddishText:
	text "ODDISH:"
	line "Oddd?"
	done
	
UnknownText_0x7e355ab:
	text "<PLAYER> riceve"
	line "BULBASAUR."
	done
	
AlreadyGotBulbasaurText:
	text "Qui ci sono"
	line "alberi da"
	cont "tutta NIHON!"
	done
	
PartyFullBulbasaurText:
	text "Hai troppi"
	line "#MON con te!"
	done
	
NoBulbasaurText:
	text "Capisco."
	para "Se cambi idea"
	line "io sono qui!"
	done
	

ILoveBulbasaurText:
	text "Ciao!"
	para "Gestisco questo"
	line "giardino botanico."
	para "Mi prendo cura"
	line "degli alberi!"
	para "C'è bisogno di"
	line "molta luce qui."
	para "Ci sono anche"
	line "molti #MON ERBA"
	cont "da accudire!"
	para "C'è un"
	line "BULBASAUR a cui"
	para "devo trovare"
	line "una casa."
	para "Vuoi prenderlo?"
	done
	
GiveBulbasaurText:
	text "Sono sicuro che"
	line "lo tratterai"
	cont "bene!"
	done


RyukyuArboretum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 8
	warp_event  9, 17, RYUKYU_CITY, 8
	
	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainSpeechHouseCooltrainer, -1
	object_event  5, 13, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainOddishScript, -1
	object_event 14,  8, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainBulbasaurScript, -1
	object_event  6,  7, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainParasScript, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainSpeechHouseYoungsterScript, -1
