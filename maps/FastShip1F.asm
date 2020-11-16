	object_const_def ; object_event constants
	const FASTSHIP1F_SAILOR1
	const FASTSHIP1F_SAILOR2
	const FASTSHIP1F_SAILOR3
	const FASTSHIP1F_GENTLEMAN

FastShip1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .EnterFastShip ; SCENE_FASTSHIP1F_ENTER_SHIP
	scene_script .DummyScene2 ; SCENE_FASTSHIP1F_MEET_GRANDPA

	db 0 ; callbacks

.DummyScene0:
	end

.EnterFastShip:
	priorityjump .EnterFastShipScript
	end

.DummyScene2:
	end

.EnterFastShipScript:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75217
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75211
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod FAST_SHIP_CABINS_SW_SSW_NW
	clearevent EVENT_FAST_SHIP_HAS_ARRIVED
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .SkipGrandpa
	setscene SCENE_FASTSHIP1F_MEET_GRANDPA
	end

.SkipGrandpa:
	setscene SCENE_DEFAULT
	end

FastShip1FSailor1Script:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .Arrived
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue .Alloy
	writetext FastShip1FSailor1Text_ToAmami
	waitbutton
	closetext
	end

.Alloy:
	writetext FastShip1FSailor1Text_ToAlloy
	waitbutton
	closetext
	end

.Arrived:
	checkevent EVENT_FAST_SHIP_DESTINATION_ALLOY
	iftrue ._Alloy
	writetext FastShip1FSailor1Text_InAmami
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_AMAMI_PORT_SAILOR_AT_GANGWAY
	setmapscene AMAMI_PORT, SCENE_AMAMIPORT_LEAVE_SHIP
	warp AMAMI_PORT, 7, 17
	end

._Alloy:
	writetext FastShip1FSailor1Text_InAlloy
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_WESTPORT_PORT_SAILOR_AT_GANGWAY
	setmapscene WESTPORT_PORT, SCENE_WESTPORTPORT_LEAVE_SHIP
	warp WESTPORT_PORT, 7, 23
	end

.LetThePlayerOut:
	checkcode VAR_FACING
	ifequal RIGHT, .YouAreFacingRight
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75235
	end

.YouAreFacingRight:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75214
	applymovement PLAYER, MovementData_0x75238
	end

FastShip1FSailor2Script:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Amami
	writetext FastShip1FSailor2Text_FirstTime
	waitbutton
	closetext
	end

.Amami:
	writetext FastShip1FSailor2Text
	waitbutton
	closetext
	end

FastShip1FSailor3Script:
	jumptextfaceplayer FastShip1FSailor3Text


WorriedGrandpaSceneLeft:
;	appear FASTSHIP1F_GENTLEMAN
;	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x7521b
;	playsound SFX_TACKLE
;	applymovement PLAYER, MovementData_0x7522e
;	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x75220
;	opentext
;	writetext FastShip1FGrandpaText
;	waitbutton
;	closetext
;	turnobject PLAYER, RIGHT
;	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x75222
;	disappear FASTSHIP1F_GENTLEMAN
;	setscene SCENE_DEFAULT
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 30
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 30
	playsound SFX_TACKLE
	earthquake 80
	waitsfx
	pause 50
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext CaptainSpeakingText
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end

MovementData_0x7520e:
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_0x75211:
	slow_step RIGHT
	turn_head DOWN
	step_end

MovementData_0x75214:
	slow_step DOWN
	turn_head UP
	step_end

MovementData_0x75217:
	step DOWN
	step DOWN
	turn_head DOWN
	step_end

MovementData_0x7521b:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x75220:
	step RIGHT
	step_end

MovementData_0x75222:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x7522e:
	big_step RIGHT
	turn_head LEFT
	step_end

MovementData_0x75231:
	step UP
	step_end

MovementData_0x75233:
	step DOWN
	step_end

MovementData_0x75235:
	step UP
	step UP
	step_end

MovementData_0x75238:
	step RIGHT
	step UP
	step_end
	
CaptainSpeakingText:
	text "Ehm, salve a"
	line "tutti."
	para "Qui è il vostro"
	line "CAPITANO."
	para "Ci siamo imbattuti"
	line "nel maltempo."
	para "Ma va tutto bene!"
	para "Ehm, tutto a"
	line "posto! Non ci"
	cont "sono problemi!"
	para "Arriveremo quando"
	line "previsto."
	para "Ehm… È tutto."
	done


FastShip1FSailor1Text_ToAmami:
	text "La NAVE VELOCE M/N"
	line "ACQUA viaggia"
	cont "verso NAZE."

	para "Appena saremo"
	line "approdati faremo"
	cont "un annuncio."
	done

FastShip1FSailor1Text_ToAlloy:
	text "La NAVE VELOCE M/N"
	line "ACQUA viaggia"
	cont "verso PORTOVEST."

	para "Appena saremo"
	line "approdati faremo"
	cont "un annuncio."
	done

FastShip1FSailor2Text_FirstTime:
	text "Questa è la tua"
	line "cabina."

	para "Se i tuoi #MON"
	line "sono stanchi, puoi"
	cont "farli riposare."

	para "Così recupereranno"
	line "la loro energia."
	done

FastShip1FSailor2Text:
	text "Ecco la tua"
	line "cabina."

	para "Con un pisolino"
	line "puoi restituire ai"
	para "#MON tutta"
	line "la loro salute."

	para "La nave approderà"
	line "mentre starai"
	cont "dormendo."
	done

FastShip1FSailor3Text:
	text "Tutti i passeggeri"
	line "sono allenatori."

	para "Sono tutti intenti"
	line "a lottare nelle"
	cont "loro cabine."
	done

;FastShip1FGrandpaText:
;	text "Aaah!"
;	line "Scusami, sono"
;	cont "di fretta."
;
;	para "Ho perso mia"
;	line "nipote!"
;
;	para "È solo una"
;	line "ragazzina! Se la"
;
;	para "vedi dimmelo, ti"
;	line "prego!"
;	done

FastShip1FSailor1Text_InAlloy:
	text "La NAVE VELOCE M/N"
	line "ACQUA è approdata"
	cont "a PORTOVEST."
	done

FastShip1FSailor1Text_InAmami:
	text "La NAVE VELOCE M/N"
	line "ACQUA è approdata"
	cont "a NAZE."
	done

FastShip1F_MapEvents:
	db 0, 0 ; filler

	db 12 ; warp events
	warp_event 25,  1, FAST_SHIP_1F, -1
	warp_event 27,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 1
	warp_event 23,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 2
	warp_event 19,  8, FAST_SHIP_CABINS_NNW_NNE_NE, 3
	warp_event 15,  8, FAST_SHIP_CABINS_SW_SSW_NW, 1
	warp_event 15, 15, FAST_SHIP_CABINS_SW_SSW_NW, 2
	warp_event 19, 15, FAST_SHIP_CABINS_SW_SSW_NW, 4
	warp_event 23, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 1
	warp_event 27, 15, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 3
	warp_event  3, 13, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, 5
	warp_event  6, 12, FAST_SHIP_B1F, 1
	warp_event 30, 14, FAST_SHIP_B1F, 2

	db 5 ; coord events
	coord_event 30,  9, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft
	coord_event 25, 16, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft
	coord_event 31, 10, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft
	coord_event 11, 11, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft
	coord_event 10, 12, SCENE_FASTSHIP1F_MEET_GRANDPA, WorriedGrandpaSceneLeft

	db 0 ; bg events

	db 4 ; object events
	object_event 25,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor1Script, -1
	object_event 14,  7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor2Script, -1
	object_event 22, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailor3Script, -1
	object_event 19,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FAST_SHIP_1F_GENTLEMAN
