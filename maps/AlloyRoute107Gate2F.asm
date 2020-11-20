	object_const_def ; object_event constants
	const ALLOYROUTE107GATE2F_LASS
	const ALLOYROUTE107GATE2F_TWIN

AlloyRoute107Gate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
AlloyRoute107Gate2FCooltrainerfScript:
	jumptextfaceplayer AlloyRoute107Gate2FCooltrainerfText

AlloyRoute107Gate2FCooltrainerfText:
	text "Adoro vedere le"
	line "onde del mare"
	para "da questo"
	line "passaggio."
	done
	
AlloyRoute107Gate2FBugCatcherScript:
	jumptextfaceplayer AlloyRoute107Gate2FBugCatcherText

AlloyRoute107Gate2FBugCatcherText:
	text "Vorrei avere un"
	line "#MON per"
	para "attraversare"
	line "il mare!"
	done
	
AlloyRoute107Gate2FSign:
	jumptext AlloyRoute107Gate2FSignText
	
AlloyRoute107Gate2FSignText:
	text "<PLAYER> guarda"
	line "dal binocolo!"
	para "C'è una"
	line "isoletta"
	cont "in lontananza!"
	done

AlloyRoute107Gate2FSign2:
	jumptext AlloyRoute107Gate2FSign2Text
	
AlloyRoute107Gate2FSign2Text:
	text "<PLAYER> guarda"
	line "dal"
	cont "cannocchiale!"
	para "L'acqua sembra"
	line "agitata!"
	done
	
AlloyRoute107Gate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ALLOY_ROUTE_107_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, AlloyRoute107Gate2FSign
	bg_event 3,  0, BGEVENT_READ, AlloyRoute107Gate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyRoute107Gate2FCooltrainerfScript, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyRoute107Gate2FBugCatcherScript, -1
	
