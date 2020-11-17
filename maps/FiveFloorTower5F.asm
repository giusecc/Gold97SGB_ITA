	object_const_def ; object_event constants
	const TINTOWER5F_SAGE1
	const TINTOWER5F_KURT
	const TINTOWER5F_CAPTAIN

FiveFloorTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_EARLS_ACADEMY_EARL
	iffalse .DoneStairs
	changeblock   0,  5, $3A ; ladder
.DoneStairs:
	return

FiveFloorTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_EARLS_ACADEMY_EARL
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSageYup
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, TINTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TINTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement TINTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
	text "FRANZ: sapevo di"
	line "averci visto"
	para "giusto riguardo"
	line "a te."
	done
	
CaptainCantBelieve:
	text "Non riesco a"
	line "crederci!"
	para "Il ritorno del"
	line "leggendario"
	cont "#MON uccello!"
	para "Sta accadendo!"
	done
	
SageTellsYouToSeeBird:
	text "<PLAYER>."
	para "HO-OH si sta"
	line "posando sulle"
	para "nostre teste."
	line "È tornato, come"
	para "diceva la"
	line "leggenda."
	para "Credo che voglia"
	line "incontrarti."
	para "Deve aver compreso"
	line "che le scelte che"
	para "hai intrapreso"
	line "mostrano che"
	para "meriti di"
	line "vederlo."
	para "Prosegui al"
	line "tetto."
	done
	
Text_5FSageDuringHoOh:
	text "HO-OH attende."
	done

Text_5FSageAfterHoOh:
	text "Un incontro con"
	line "questo #MON"
	para "è un evento"
	line "leggendario."
	done
	
Text_5FSageNope:
	text "Hai raggiunto la"
	line "cima della torre."
	para "Ma non hai letto"
	line "tutti i messaggi."
	para "Assicurati di"
	line "leggere i messaggi"
	para "a ogni piano."
	para "Ognuno insegna una"
	line "profonda lezione."
	done
	
Text_5FSageYup:
	text "Benvenuto alla"
	line "cima della"
	cont "PENTATORRE."
	para "Questo è un luogo"
	line "sacro, che può"
	para "essere visitato"
	line "solo da coloro"
	para "che mostrano il"
	line "dovuto rispetto."
	para "So che FRANZ ti"
	line "ha chiesto di"
	para "arrivare fino"
	line "a qui."
	para "Spero che tu possa"
	line "ampliare le tue"
	para "conoscenze e"
	line "comprendere a"
	para "fondo l'anima"
	line "dai #MON."
	para "Ora puoi tornare"
	line "da FRANZ. Hai la"
	cont "mia benedizione."
	done

FiveFloorTower5FSign:
	setevent EVENT_READ_5F5F_SIGN
	jumptext FiveFloorTower5FSignText

	
FiveFloorTower5FSignText:
	text "È la statua"
	line "di ABRA."
	para "Gli ABRA si"
	line "spaventano facil-"
	para "mente e scappano"
	line "dalle lotte."
	para "Ricordati di"
	line "rispettare tutti"
	para "i #MON nel"
	line "loro habitat."
	done
	
FiveFloorTower5FIncense:
	jumptext FiveFloorTower5FIncenseText

FiveFloorTower5FIncenseText:
	text "E questo?"
	para "Oh, è un"
	line "incensiere!"
	done

FiveFloorTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, FIVE_FLOOR_TOWER_4F, 2
	warp_event  0,  5, FIVE_FLOOR_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower5FSign
	bg_event 3, 0, BGEVENT_READ, FiveFloorTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
