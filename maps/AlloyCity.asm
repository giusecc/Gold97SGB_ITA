	object_const_def ; object_event constants
	const ALLOYCITY_SAILOR1
	const ALLOYCITY_STANDING_YOUNGSTER
	const ALLOYCITY_SAILOR2
	const ALLOYCITY_ALLOY_RIVAL
	const ALLOYCITY_GRAMPS

AlloyCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ALLOY
	return

AlloyCityRivalSceneTop:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88d2
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	;applymovement PLAYER, MovementData_0x1a88f4
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db2
	setscene SCENE_FINISHED
	disappear ALLOYCITY_ALLOY_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCityRivalSceneBottom:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88d6
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	;applymovement PLAYER, MovementData_0x1a88f7
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88e8
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, MovementData_0x1a88db2
	disappear ALLOYCITY_ALLOY_RIVAL
	setscene SCENE_FINISHED
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCitySailor1Script:
	jumptextfaceplayer AlloyCitySailor1Text

AlloyCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext AlloyCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext AlloyCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

AlloyCityGrampsScript:
	jumptextfaceplayer AlloyCityGrampsText

AlloyCitySailor2Script:
	jumptextfaceplayer AlloyCitySailor2Text

AlloyCitySign:
	jumptext AlloyCitySignText

AlloyGymSign:
	jumptext AlloyGymSignText

AlloyLighthouseSign:
	jumptext AlloyLighthouseSignText

AlloyCityPokecenterSign:
	jumpstd PokecenterSignScript

AlloyCityMartSign:
	jumpstd MartSignScript

MovementData_0x1a88d2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88d6:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88db:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88db2:
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88e8:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x1a88f4:
	step DOWN
	turn_head UP
	step_end

MovementData_0x1a88f7:
	step UP
	turn_head DOWN
	step_end

AlloyCityGrampsText:
	text "Ohohoho!"
	para "Hai mai sfidato"
	line "un tipo ACCIAIO?"
	para "È un tipo molto"
	line "difensivo!"
	para "Devi prepararti"
	line "se vuoi sfidare"
	cont "JASMINE!"
	done

AlloyCityRivalText:
	text "<PLAYER>!"
	para "Quanto tempo!"
	para "Sei appena uscito"
	line "dal BOSCO GIADA,"
	cont "vero?"
	para "È un posto strano,"
	para "ma è pieno"
	line "di #MON!"
	para "Ora non sono in"
	line "vena di lottare."
	para "Voglio tornare"
	line "nel BOSCO per"
	para "cercare altri"
	line "#MON!"
	para "Non posso perdere"
	line "l'occasione di"
	para "trovare qualche"
	line "#MON da"
	para "aggiungere alla"
	line "mia squadra!"
	para "Questa città è"
	line "fantastica!"
	para "La CAPOPALESTRA"
	line "usa #MON di"
	cont "tipo ACCIAIO!"
	para "Non ne avevo mai"
	line "sentito parlare"
	cont "prima d'ora!"
	para "Ora devo andare!"
	line "Ci si vede!"
	done

AlloyCitySailor1Text:
	text "Ho sempre sognato"
	line "di andare più"
	para "a nord e vedere"
	line "un po' di neve."
	done

AlloyCityStandingYoungsterPokegearText:
	text "Quell'aggeggio"
	line "è un #GEAR,"
	cont "giusto? Sembra"
	cont "bellissimo."
	done

AlloyCityStandingYoungsterPokedexText:
	text "Ma quello è un"
	line "#DEX!"

	para "Vorrei averne"
	line "uno anche io."
	done

AlloyCitySailor2Text:
	text "Il canale che"
	line "passa per questa"
	para "città è uno"
	line "spettacolo al"
	cont "tramonto."
	done

AlloyCitySignText:
	text "DESMOPOLI"

	para "Una città vivace"
	line "tra acque agitate"
	done

AlloyGymSignText:
	text "DESMOPOLI"
	line "CAPOPALESTRA:"
	cont "JASMINE"

	para "La ragazza con una"
	line "difesa d'acciaio"
	done

AlloyLighthouseSignText:
	text "DOJO KARATE"
	done

AlloyCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event  7,  8, ALLOY_POKECENTER_1F, 1
	warp_event 30,  9, ALLOY_GYM, 1
	warp_event 35, 30, ALLOY_TIMS_HOUSE, 1
	warp_event 34, 15, FIGHTING_DOJO, 2
	warp_event 11, 28, ALLOY_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 23, 22, ALLOY_GOOD_ROD_HOUSE, 1
	warp_event  5, 23, ALLOY_CAFE, 1
	warp_event  7, 14, ALLOY_MART, 1
	warp_event 23, 13, ALLOY_HOUSE_BETA, 1
	warp_event 18,  5, ALLOY_ROUTE_107_GATE, 3
	warp_event 33, 15, FIGHTING_DOJO, 1
	warp_event 19,  5, ALLOY_ROUTE_107_GATE, 4
	warp_event 31,  9, ALLOY_GYM, 2

	db 2 ; coord events
	coord_event  2,  9, SCENE_DEFAULT, AlloyCityRivalSceneTop
	coord_event  2, 10, SCENE_DEFAULT, AlloyCityRivalSceneBottom

	db 5 ; bg events
	bg_event 30, 21, BGEVENT_READ, AlloyCitySign
	bg_event 32, 10, BGEVENT_READ, AlloyGymSign
	bg_event 30, 15, BGEVENT_READ, AlloyLighthouseSign
	bg_event  8,  8, BGEVENT_READ, AlloyCityPokecenterSign
	bg_event  8, 14, BGEVENT_READ, AlloyCityMartSign

	db 5 ; object events
	object_event 10, 31, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor1Script, -1
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyCityStandingYoungsterScript, -1
	object_event 26, 25, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor2Script, -1
	object_event  7,  8, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ALLOY_CITY
	object_event  8, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyCityGrampsScript, -1
