	object_const_def ; object_event constants
	const DEEPWATERPASSAGEEASTCAVERN_PRYCE
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_1
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_2
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_3
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_4
 
DeepwaterPassageEastCavern_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageEastCavernMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageEastCavernRareCandy:
	itemball RARE_CANDY

DeepwaterPassageEastCavernMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageEastCavernTMSwagger:
	itemball TM_SWAGGER

DeepwaterPassageEastCavernPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovement
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end
	
.PryceWalksAroundPlayer:
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovementAlt
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end

PryceGreetingText:
	text "Oh, ciao!"
	para "Non ci sono molti"
	line "allenatori da"
	cont "queste parti."
	para "Io sono ALFREDO."
	para "Il CAPOPALESTRA"
	line "di BIANCASELVA."
	para "Spesso mi"
	line "allontano dalla"
	para "PALESTRA per"
	line "venirmi ad"
	cont "allenare qui."
	para "Vivere tra i"
	line "#MON GHIACCIO"
	para "è fondamentale"
	line "per capirli."
	para "…"
	para "Tuttavia, capisco"
	line "che vuoi sfidarmi"
	para "nella mia"
	line "PALESTRA."
	para "Tornerò a tempo"
	line "debito."
	para "La mia famiglia"
	line "vive ad"
	cont "ALGIDOPOLI."
	para "Li ho informati"
	line "che andrò presto"
	para "da loro per una"
	line "visita."
	para "Manterrò la mia"
	line "promessa."
	para "Spero che tu"
	line "mi capisca."
	para "…"
	para "Percepisco che"
	line "hai un enorme"
	para "rispetto per i"
	line "#MON."
	para "Lo ammiro molto."
	para "Quando potrai,"
	line "vieni a far visita"
	para "a me e alla mia"
	line "famiglia ad"
	cont "ALGIDOPOLI."
	para "Tornerò alla"
	line "PALESTRA dopo aver"
	para "terminato la mia"
	line "visita."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageEastCavern_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageEastCavernPryceScript, EVENT_PRYCE_IN_DEEPWATER
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernTMSwagger, EVENT_ALLOY_LIGHTHOUSE_5F_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxEther, EVENT_BOARDWALK_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxRevive, EVENT_KIKAI_STRAIT_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernRareCandy, EVENT_ALLOY_LIGHTHOUSE_5F_RARE_CANDY

