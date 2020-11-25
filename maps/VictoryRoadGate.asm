	object_const_def ; object_event constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_COOLTRAINERM
	const VICTORYROADGATE_COOLTRAINERF

VictoryRoadGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_NIHON_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext VictoryRoadGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end
	
VictoryRoadGateCooltrainerMScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerMText
	
VictoryRoadGateCooltrainerFScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerFText
	
VictoryRoadGateCooltrainerMText:
	text "Non ci credo!"
	para "Manca così poco"
	line "alla LEGA!"
	para "È da tutta la vita"
	line "che aspetto"
	cont "questo momento!"
	done
	
VictoryRoadGateCooltrainerFText:
	text "Il CAMMINO DIADEMA"
	line "può sembrare uno"
	para "scherzo, ma la"
	line "vera sfida è"
	para "arrivare alla"
	line "cima del MONTE."
	done
	
VictoryRoadGateNotEvenATrainer:
	text "Non sembri"
	line "neppure un"
	cont "allenatore."
	para "Scusami, ma"
	line "solo gli allena-"
	para "tori qualificati"
	line "possono passare."
	done

VictoryRoadGateOfficerText:
	text "Solo gli allena-"
	line "tori che hanno"
	para "dimostrato le"
	line "loro capacità"
	cont "possono passare."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "Non hai otto"
	line "medaglie."
	para "Mi spiace, ma"
	line "solo gli allena-"
	para "tori con il giusto"
	line "numero di medaglie"
	para "possono entrare"
	line "a DIADEMOPOLI e"
	para "scalare il"
	line "MONTE FUJI."
	done

VictoryRoadGateEightBadgesText:
	text "Ah! Otto medaglie!"

	para "Prego, passa"
	line "pure!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_NORTH, 1
	warp_event 10, 17, SILENT_NORTH, 1
	warp_event  9,  0, CROWN_PATH, 1
	warp_event 10,  0, CROWN_PATH, 2

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerFScript, -1
