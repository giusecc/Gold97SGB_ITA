	object_const_def ; object_event constants
	const ROUTE116_BUG_CATCHER3
	const ROUTE116_HIKER
;	const ROUTE116_POKE_BALL1
	const ROUTE116_POKE_BALL2
;	const ROUTE116_POKE_BALL3
;	const ROUTE116_POKE_BALL4
	const ROUTE116_FRUIT_TREE

Route116_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearTeknosRocks

.ClearTeknosRocks:
	setevent EVENT_FROSTPOINT_ROCKS_CLEARED
	return



TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

Route116Sign:
	jumptext Route116SignText



Route116MaxPotion:
	itemball SUPER_POTION


Route116FruitTree:
	fruittree FRUITTREE_ROUTE_116


BugCatcherDougSeenText:
	text "Perché i #MON"
	line "coleottero non"
	para "piacciono alle"
	line "ragazze?"
	done

BugCatcherDougBeatenText:
	text "Niente da fare!"
	done

BugCatcherDougAfterBattleText:
	text "I #MON COLEOT-"
	line "TERO squittiscono"

	para "come peluche"
	line "se gli si preme"
	cont "la pancia."

	para "Come mi piace!"
	done
	


HikerRussellSeenText:
	text "Voglio camminare"
	line "per tutta NIHON!"
	done

HikerRussellBeatenText:
	text "Sono stanco!"
	done

HikerRussellAfterBattleText:
	text "Credo che mi"
	line "fermerò qui"
	cont "per un po'."
	done

Route116SignText:
	text "PERCORSO 116"

	para "AVIOPOLI -"
	line "VESTIGIA"
	done


Route116_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 30, ROUTE_116_BIRDON_GATE, 1
	warp_event  9, 30, ROUTE_116_BIRDON_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route116Sign


	db 4 ; object events
	object_event  4, 26, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherDoug, -1
	object_event  8, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerHikerRussell, -1
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116MaxPotion, EVENT_ROUTE_116_MAX_POTION
	object_event  4, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116FruitTree, -1
