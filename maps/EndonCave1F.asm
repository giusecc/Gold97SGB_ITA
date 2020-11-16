	object_const_def ; object_event constants
	const ENDONCAVE1F_POKEFAN_M
	const ENDONCAVE1F_POKEMANIAC
	const ENDONCAVE1F_ITEM_1

EndonCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EndonCave1FTMDynamicpunch:
	itemball TM_DYNAMICPUNCH

EndonCave1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ENDON_CAVE_1F_HIDDEN_MAX_REVIVE


EndonCave1FRichGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext EndonCave1FRichGuyText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext EndonCave1FRichGuyText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route116NuggetHouseBookshelf:
; unused
	jumpstd DifficultBookshelfScript
	
TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

EndonCave1FRichGuyText:
	text "Ciao!"
	para "Forse non sembra,"
	line "ma sono incredi-"
	cont "bilmente ricco."
	
	para "Ma ahimè, la"
	line "ricchezza mi"
	cont "annoia!"
	
	para "Per questo vado in"
	line "giro alla ricerca"
	para "di qualcosa che mi"
	line "possa divertire."
	
	para "Ora ho deciso di"
	line "esplorare le"
	cont "grotte!"
	
	para "Le grotte sono"
	line "affascianti!"
	
	para "È così facile"
	line "perdersi!"
	
	para "C'è sempre una"
	line "sorpresa dietro"
	cont "l'angolo!"
	
	para "Oh, grazie per"
	line "essere stato qui"
	cont "ad ascoltarmi!"
	
	para "Ecco, prendi!"
	done

EndonCave1FRichGuyText_GotNugget:
	text "È una PEPITA."

	para "Vale un sacco di"
	line "soldi."
	
	para "Non fa parte"
	line "delle mie"
	cont "ricchezze!"
	
	para "L'ho trovata in"
	line "questa grotta!"
	
	para "Ahahahahah!"
	done
	
PokemaniacCalvinSeenText:
	text "Passo molto tempo"
	line "in questa grotta,"
	para "allenando i #-"
	line "MON."
	para "Voglio lottare"
	line "con te."
	done
	
PokemaniacCalvinBeatenText:
	text "…sigh… Devo al-"
	line "lenarmi di più…"
	done

PokemaniacCalvinAfterBattleText:
	text "Sei mai stato a"
	line "VESTIGIA?"
	para "È un posto"
	line "misterioso."
	done

EndonCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, ROUTE_117, 1
	warp_event 55, 15, ROUTE_117, 2
	warp_event 25,  5, ENDON_CAVE_2F, 1
	warp_event 51, 11, ENDON_CAVE_2F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 10, BGEVENT_ITEM, EndonCave1FHiddenMaxRevive

	db 3 ; object events
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EndonCave1FRichGuyScript, -1
	object_event 14, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FTMDynamicpunch, EVENT_TATSUGO_PATH_REVIVE

