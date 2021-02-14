	object_const_def ; object_event constants
	const SHIP_ROCKET_1
	const SHIP_ROCKET_2
	const SHIP_ENTRANCE_1
	const SHIP_ROCKET_3
	const SHIP_CAPTAIN_R
	const SHIP_ROCKET_4
	const SHIP_ROCKET_5
	const SHIP_BURGLAR
	const SHIP_ITEMBALL
	const SHIP_IMPOSTOR
	const SHIP_ITEMBALL_2

TeamRocketShipBase_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneTeamRocketShipBaseGreetings ; SCENE_DEFAULT
	scene_script .SceneTeamRocketShipBaseImposter ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckBasementKey


.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock 28,28, $28 ; locked door
	return

.SceneTeamRocketShipBaseGreetings
	end

.SceneTeamRocketShipBaseImposter
	end

RocketGreetingsScript:
	moveobject SHIP_ENTRANCE_1, 3, 7
	appear SHIP_ENTRANCE_1
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip
	showemote EMOTE_SHOCK, SHIP_ENTRANCE_1, 25
	applymovement SHIP_ENTRANCE_1, Movement_StepUpToMeShip2
	opentext
	writetext NotGonnaStandByText
	waitbutton
	closetext
	winlosstext RocketEntranceShip_WinText, RocketEntranceShip_LossText
	loadtrainer GRUNTF, GRUNTF_2
	startbattle
	reloadmapafterbattle
	jump .returnfrombattleshipentrance
	
.returnfrombattleshipentrance
	opentext
	writetext RocketEntranceShip_AfterText
	waitbutton
	closetext
	applymovement SHIP_ENTRANCE_1, Movement_StepDownFromMeShip
	disappear SHIP_ENTRANCE_1
	setscene SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR
	end
	
ImposterAndCaptainScript:
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, DOWN
	opentext
	writetext ImposterGreetingText
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterWalksToMe
	opentext
	writetext ImposterGreetingText2
	waitbutton
	closetext
	turnobject SHIP_IMPOSTOR, UP
	pause 15
	opentext
	writetext ImposterTellsCaptainText
	waitbutton
	closetext
	pause 15
	applymovement SHIP_IMPOSTOR, ImposterWalksToCaptain
	opentext
	writetext CaptainBeckons
	waitbutton
	closetext
	pause 15
	applymovement PLAYER, PlayerWalksToCaptain
	jump CaptainRocketScript
	

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	waitbutton
	closetext
	changeblock 28, 28, $2b ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM22:
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script


.Script:
	setevent EVENT_ROCKET_KEY_DIALOGUE
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .HowdYouGetThat
	opentext
	writetext GruntM22AfterBattleText
	waitbutton
	closetext
	end

.HowdYouGetThat
	opentext
	writetext GruntM22HowdGetKey
	waitbutton
	closetext
	end


CaptainRocketScript:
	special FadeOutMusic
	pause 15
	faceplayer
	opentext
	writetext CaptainRBeforeText
	waitbutton
	closetext
	pause 10
	turnobject SHIP_CAPTAIN_R, LEFT
	opentext
	writetext CaptainRTellsImposterOff
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SHIP_IMPOSTOR, 15
	turnobject SHIP_IMPOSTOR, RIGHT
	opentext
	writetext ImposterOakIsShocked
	waitbutton
	closetext
	pause 15
	opentext
	writetext CaptainRTellsImposterOff2
	waitbutton
	closetext
	pause 15
	opentext
	writetext ImposterOakIsShocked2
	waitbutton
	closetext
	applymovement SHIP_IMPOSTOR, ImposterLeavesRoom
	playsound SFX_EXIT_BUILDING
	disappear SHIP_IMPOSTOR
	pause 5
	turnobject SHIP_CAPTAIN_R, DOWN
	opentext
	writetext CaptainRFinishesSpeech
	waitbutton
	closetext
	winlosstext CaptainRWinText, CaptainRLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext CaptainRAfterText
	waitbutton
	closetext
;between these comments is end of demo text that can be removed
;	opentext
;	writetext Text_EndDemo
;	waitbutton
;	closetext
;	opentext
;	writetext Text_ReceivedMineralBadgeDemo
;	playsound SFX_GET_BADGE
;	waitsfx
;	setflag ENGINE_MINERALBADGE
;	verbosegiveitem HM_FLY
;	closetext
;	opentext
;	writetext Text_EndDemo2
;	waitbutton
;	closetext
; comment
	special FadeOutPalettes
	special HealParty
	pause 15
	setevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_PRYCE_IN_GYM
	setevent EVENT_PRYCE_IN_HOME
	setmapscene ROUTE_104, SCENE_ROUTE104_NOTHING
	warp SUNPOINT_DOCKS, 13, 3
	end
	

TrainerGruntM25:
	trainer GRUNTM, GRUNTM_25, EVENT_BEAT_ROCKET_GRUNTM_25, GruntM25SeenText, GruntM25BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM25AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF3:
	trainer GRUNTF, GRUNTF_3, EVENT_BEAT_ROCKET_GRUNTF_3, GruntF3SeenText, GruntF3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF3AfterBattleText
	waitbutton
	closetext
	end
	

TrainerBurglarEddie:
	trainer BURGLAR, EDDIE, EVENT_BEAT_BURGLAR_EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEddieAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketShipBaseSmokeBall:
	itemball SMOKE_BALL
	
TeamRocketShipBaseAmuletCoin:
	itemball AMULET_COIN
	
TrashCanBoatScript:
	jumptext TrashCanBoatText

	
Movement_StepUpToMeShip:
	step UP
	step_end
	
Movement_StepUpToMeShip2:
	step UP
	step UP
	step UP
	step_end
	
Movement_StepDownFromMeShip:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ImposterWalksToMe:
	step DOWN
	;step LEFT
	;turn_head DOWN
	step_end
	
ImposterWalksToCaptain:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	turn_head DOWN
	step_end
	
PlayerWalksToCaptain:
	step UP
	step UP
	step UP
	step_end
	
ImposterLeavesRoom:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
TrashCanBoatText:
	text "Non c'è niente"
	line "qui…"
	done

GruntM22SeenText:
	text "Sei andato fin"
	line "troppo avanti."
	para "Ma non proseguirai"
	line "oltre!"
	done

GruntM22BeatenText:
	text "Il CAPITANO non"
	line "sarà felice…"
	done

GruntM22AfterBattleText:
	text "Ha! Non credere"
	line "di passare solo"
	cont "perché hai vinto!"
	para "Principalmente"
	line "perché neanche io"
	cont "posso farlo!"
	para "La parte è chiusa"
	line "e io non ho la"
	cont "CHIAVE NAVE!"
	para "Credo che solo"
	line "il CAPITANO ne"
	cont "abbia una."
	para "Sembra che dovrai"
	line "cercarne una"
	cont "altrove!"
	done

GruntM11SeenText:
	text "Cosa succede qui?"
	para "Non mi"
	line "intralciare!"
	done

GruntM11BeatenText:
	text "Mi stai"
	line "intalciando!"
	done

GruntM11AfterBattleText:
	text "Non ho niente"
	line "da fare."
	para "Mi piace essere"
	line "nell'equipaggio"
	para "per navigare"
	line "un po'."
	done

GruntM25SeenText:
	text "Ha! Scommeto che"
	line "non te"
	cont "l'aspettavi!"
	done

GruntM25BeatenText:
	text "Mi nasconderò"
	line "qui…"
	done

GruntM25AfterBattleText:
	text "Nessuno mi potrà"
	line "infastidire."
	done

GruntM13SeenText:
	text "Non mi importa"
	line "se ti sei perso."

	para "Se sei qui, sei"
	line "solo una vittima!"
	done

GruntM13BeatenText:
	text "Uh! Credi di"
	line "essere forte?"
	done

GruntM13AfterBattleText:
	text "Hai fegato per"
	line "venire qui!"
	done

UnknownText_0x7c5b0:
	text "La porta è chiusa…"
	done

UnknownText_0x7c5c3:
	text "La porta è aperta."
	done

UnknownText_0x7c5d6:
	text "La CHIAVE PORTA"
	line "apre la porta."
	done

CaptainRBeforeText:
	text "Sei arrivato qui."
	line "Impressionante."
	para "Che tristezza che"
	line "nessuno sia"
	para "riuscito a"
	line "fermarti."
	para "Sono inutili."
	para "Ma abbiamo finito"
	line "il nostro lavoro."
	para "Ci stiamo"
	line "ritirando."
	para "Il piano andrà"
	line "avanti come"
	cont "previsto."
	done
	
CaptainRTellsImposterOff:
	text "OAK IMPOSTORE!"
	done
	
ImposterOakIsShocked:
	text "OAK IMPOSTORE: Sì,"
	line "signore!"
	done
	
CaptainRTellsImposterOff2:
	text "CAPITANO: puoi"
	line "andare."
	para "Voglio rimanere"
	line "solo con lui."
	done
	
ImposterOakIsShocked2:
	text "OAK IMPOSTORE:"
	line "Agli ordini!"
	done
	
CaptainRFinishesSpeech:
	text "…"
	para "Hai conosciuto"
	line "il nostro"
	cont "OAK IMPOSTORE."
	para "Sapevo che non"
	line "ti avrebbe"
	cont "ingannato."
	para "Ma non sei tu"
	line "a dover essere"
	cont "convinto."
	para "Ci sarà utile"
	line "più tardi."
	para "Per il momento"
	line "stiamo per"
	cont "partire."
	para "Ma non prima che"
	line "mi sia sbarazzato"
	cont "di te."
	done

CaptainRWinText:
	text "Sei forte."
	done
	
CaptainRLossText:
	text "Ha!"
	done
	
CaptainRAfterText:
	text "Hm. Sei un bel"
	line "problema."
	para "Ma il lavoro qui"
	line "è finito."
	para "Abbiamo i mate-"
	line "riali necessari"
	para "per costruire"
	line "la nostra"
	cont "arma finale!"
	para "E quest'arma non"
	line "farà nessun danno."
	para "Ma ci farà"
	line "prendere il con-"
	para "trollo di tutti"
	line "i #MON!"
	para "Non hai fermato"
	line "il nostro piano!"
	para "Sentirai parlare"
	line "presto di noi!"
	para "Tutti lo"
	line "sentiranno!"
	done


NotGonnaStandByText:
	text "Hai superato"
	line "le guardie."
	para "Ma non credere"
	line "che ti lascerò"
	cont "restare qui!"
	para "Prova a"
	line "superarmi!"
	done
	
RocketEntranceShip_WinText:
	text "Sei più forte"
	line "di quanto sembri!"
	done
	
RocketEntranceShip_LossText:
	text "Ha!"
	done
	
RocketEntranceShip_AfterText:
	text "Aah!"
	para "Dovrò avvertire"
	line "il CAPITANO."
	para "Si prenderà"
	line "cura di te!"
	done

GruntF3SeenText:
	text "Cosa vuoi fare"
	line "contro il TEAM"
	cont "ROCKET?"
	done

GruntF3BeatenText:
	text "I nostri piani"
	line "sono più grandi"
	cont "di quanto pensi!"
	done

GruntF3AfterBattleText:
	text "Siamo pronti a"
	line "partire,"
	cont "comunque."
	done


BurglarEddieSeenText:
	text "Shh! Non faccio"
	line "parte del TEAM"
	cont "ROCKET!"

	para "Sto cercando"
	line "del bottino."
	done

BurglarEddieBeatenText:
	text "Sopra le righe!"
	done

BurglarEddieAfterBattleText:
	text "Rubare ai ladri"
	line "mi rende un"
	cont "bravo ragazzo?"
	done
	
Text_EndDemo:
	text "Fine DEMO"
;	line "for playing!"
;	para "This point is"
;	line "where the demo"
;	cont "ends."
;	para "You've completed"
;	line "what's available"
;	cont "of the story."
;	para "But feel free to"
;	line "spend time"
;	para "exploring and"
;	line "catching #MON!"
;	para "I've got a few"
;	line "things for you"
;	para "that will make"
;	line "exploring easier."
;	para "HM02 FLY and the"
;	line "badge you need to"
;	cont "use it!"
	done
	
Text_ReceivedMineralBadgeDemo:
	text "<PLAYER> riceve la"
	line "MEDAGLIA MINERALE."
	done
	
Text_EndDemo2:
	text "Ci si vede!"
	done
	
GruntM22HowdGetKey:
	text "Dove hai trovato"
	line "la chiave!?"
	done
	
ImposterGreetingText:
	text "Chi abbiamo"
	line "qui?"
	done
	
ImposterGreetingText2:
	text "Non mi riconosci?"
	para "Sono io, il PROF."
	line "OAK! Sto lavorando"
	para "con il TEAM"
	line "ROCKET ora."
	para "…Nah, so che non"
	line "te la darò a bere!"
	done
	
ImposterTellsCaptainText:
	text "Ehi, CAPITANO!"
	line "Abbiamo un"
	cont "ragazzino qui!"
	para "Scommetto che sei"
	line "quello di cui"
	para "abbiamo sentito"
	line "parlare!"
	done
	
CaptainBeckons:
	text "CAPITANO: vieni"
	line "qui, ragazzo!"
	done

TeamRocketShipBase_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event  3,  1, SUNPOINT_DOCKS, 4
	warp_event  3,  8, TEAM_ROCKET_SHIP_BASE, 3
	warp_event 13,  1, TEAM_ROCKET_SHIP_BASE, 2
	warp_event 13, 12, TEAM_ROCKET_SHIP_BASE, 5
	warp_event 29,  1, TEAM_ROCKET_SHIP_BASE, 4
	warp_event 33,  3, TEAM_ROCKET_SHIP_BASE, 7
	warp_event  3, 18, TEAM_ROCKET_SHIP_BASE, 6
	warp_event 35,  3, TEAM_ROCKET_SHIP_BASE, 9
	warp_event 13, 24, TEAM_ROCKET_SHIP_BASE, 8
	warp_event 19, 19, TEAM_ROCKET_SHIP_BASE, 11
	warp_event  3, 34, TEAM_ROCKET_SHIP_BASE, 10
	warp_event 25, 19, TEAM_ROCKET_SHIP_BASE, 13
	warp_event 13, 34, TEAM_ROCKET_SHIP_BASE, 12
	warp_event 29, 29, TEAM_ROCKET_SHIP_BASE, 15
	warp_event 35, 22, TEAM_ROCKET_SHIP_BASE, 14
	warp_event 39, 22, TEAM_ROCKET_SHIP_BASE, 14

	db 2 ; coord events
	coord_event  3,  2, SCENE_DEFAULT, RocketGreetingsScript
	coord_event 35, 21, SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR, ImposterAndCaptainScript

	db 2 ; bg events
	bg_event 29, 29, BGEVENT_READ, BasementDoorScript
	bg_event 29,  7, BGEVENT_READ, TrashCanBoatScript


	db 11 ; object events
	object_event 11,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM11, -1
	object_event 31,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM13, -1
	object_event -6,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28, 30, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM22, -1
	object_event 35, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainRocketScript, -1
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM25, -1
	object_event  1, 26, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF3, -1
	object_event 26, 23, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBurglarEddie, -1
	object_event  4, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseSmokeBall, EVENT_WESTPORT_UNDERGROUND_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	object_event 35, 19, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketShipBaseAmuletCoin, EVENT_GOT_TEAM_ROCKET_AMULET_COIN



