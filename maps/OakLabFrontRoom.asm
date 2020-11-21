	const_def 2 ; object constants
	const OAK2ENTRANCE_AIDE
	const OAK2ENTRANCE_SILVER
	const OAK2ENTRANCE_BLUE
	const OAK2ENTRANCE_DAISY
	const OAK2ENTRANCE_DEX1
	const OAK2ENTRANCE_DEX2

OakLabFrontRoom_MapScripts:
	db 5 ; scene scripts
	scene_script .SceneOak2DoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOakLabFrontRoomNothing ;does this work?
	scene_script .SceneOakLabFrontRoomBattle ;seems to!
	scene_script .SceneOakLabFrontRoomDaisy

	db 0 ; callbacks
	
.SceneOak2DoorLocked:
	end
	
.SceneHeadToTheBack:
	turnobject PLAYER, UP
	opentext
	writetext Text_InBack
	waitbutton
	closetext
	applymovement PLAYER, CatchUp_Movement
	follow OAK2ENTRANCE_BLUE, PLAYER
	applymovement OAK2ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	applymovement OAK2ENTRANCE_BLUE, Movement_BlueThroughDoor
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_BLUE
	applymovement PLAYER, Movement_PlayerThroughDoor
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAK_LAB_BACK_ROOM, 3, 7
	end

.SceneOakLabFrontRoomNothing:
	end

.SceneOakLabFrontRoomBattle:
	end
	
.SceneOakLabFrontRoomDaisy:
	end

BattleScript:
	applymovement PLAYER, Movement_DownOne
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_SILVER, 4, 0
	appear OAK2ENTRANCE_SILVER
	applymovement OAK2ENTRANCE_SILVER, Movement_SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Cruiseal
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Happa
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CRUISEAL
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Cruiseal:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_HAPPA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Happa:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_FLAMBEAR
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAK2ENTRANCE_SILVER, SilverLeavesLab
	disappear OAK2ENTRANCE_SILVER
	setscene SCENE_OAK_LAB_FRONT_ROOM_DAISY
	special HealParty
	playmapmusic
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp1
	jump .DaisySpeech

.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAPPA@"
	

DaisyStopsScript2:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp2
	jump .DaisySpeech
	
.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAPPA@"
	
DaisyScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end
	
DaisyScript_ReceiveThePotion:
	jumpstd ReceiveItemScript
	end
	
OakLabFrontRoomDexScript:
	opentext
	writetext WhatIsDexText
	waitbutton
	closetext
	end
	
OakLabFrontRoomBlueScript:
	jumptextfaceplayer Text_InBack
	
OakLabFrontRoomDaisyScript:
	jumptextfaceplayer Text_RootingText

OakLabFrontRoomSilverScript:
	jumptextfaceplayer OakLabFrontRoomSilverText

OakLabFrontRoomAideScript:
	jumptextfaceplayer OakLabFrontRoomAideText
	
OakLabFrontRoomComputerScript:
	jumptext OakLabFrontRoomComputerText
	
OakLabFrontRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
OakLabFrontRoomSign:
	jumptext OakLabFrontRoomSignText
	
WhatIsDexText:
	text "Cos'è?"
	para "Una specie di"
	line "enciclopedia?"
	done
	
OakLabFrontRoomSignText:
	text "Ricordati di"
	line "SALVARE i tuoi"
	cont "progressi!"
	done	
	
OakLabFrontRoomComputerText:
	text "Una ricerca sugli"
	line "habitat dei"
	cont "#MON."
	done
	
Text_RootingText:
	text "Farò il tifo"
	line "per te!"
	done
	
DaisySpeechText:
	text "Il ragazzo che"
	line "ti ha portato qui"
	para "è mio fratello."
	para "In poche parole…"
	para "Sono la nipote"
	line "del PROF.OAK!"
	para "Il nonno è un"
	line "ricercatore"
	cont "illustre!"
	para "…Ma è anche un"
	line "po' smemorato."
	para "Avrebbe dovuto"
	line "darti anche"
	cont "questa!"
	done

DaisySpeechText2:
	text "Una POZIONE"
	line "ristabilisce la"
	para "salute di un #-"
	line "MON, se non sei"
	para "in un CENTRO"
	line "#MON!"
	para "Ti darò anche"
	line "delle # BALL"
	para "per aiutarti"
	line "nella ricerca."
	done

DaisySpeechText3:
	text "Come ha detto il"
	line "nonno, se ti ser-"
	para "vono delle #"
	line "BALL, puoi trovar-"
	para "le in qualsiasi"
	line "#MON-MARKET."
	para "Non lasciare la"
	line "tua famiglia in"
	para "pensiero, ricor-"
	line "dati di salutare"
	para "la MAMMA e KEN"
	line "prima di lasciare"
	cont "la città!"
	para "Farò il tifo per"
	line "te!"
	done

SilverEntranceWinText:
	text "Credevo che il"
	line "mio #MON avreb-"
	para "be avuto la"
	line "meglio!"
	done

EntranceRivalText_YouLost:
	text "<PLAYER>! Sono"
	line "impaziente di"
	para "mostrare al"
	line "mondo quanto"
	para "è forte il"
	line "mio #MON!"
	para "Ci si vede!"
	done

SilverEntranceLossText:
	text "Il mio #MON"
	line "è più forte!"
	done

EntranceRivalText_YouWon:
	text "<PLAYER>! Sono"
	line "impaziente di"
	para "mostrare al"
	line "mondo quanto"
	para "è forte il"
	line "mio #MON!"
	para "Ci si vede!"
	done
	
TimeToBattle:
	text "<PLAYER>!"
	para "Non credere di"
	line "andartene così!"
	para "Il PROF.OAK ci ha"
	line "dato un #MON,"
	para "ora dobbiamo"
	line "lottare!"
	para "Non mi tirerò"
	line "indietro!"
	done
	
Text_InBack:
	text "Il PROF.OAK è"
	line "appena rientrato."
	para "Ti aspetta nel"
	line "retro!"
	done

OakLabFrontRoomAideText:
	text "Se stai cercando"
	line "il PROF.OAK, di"
	para "solito è nel suo"
	line "ufficio nel retro."
	done
	
DoorLockedText:
	text "La porta è"
	line "chiusa…"
	done
	
OakLabFrontRoomSilverText:
	text "Ehi, <PLAYER>!"
	
	para "Sembra che il"
	line "PROF. OAK non"
	cont "sia qui!"
	
	para "Mi chiedo quando"
	line "credesse che"
	cont "arrivassimo!"
	
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverDownOne:
	step DOWN
	step_end
	
Movement_DownOne:
	step DOWN
	turn_head UP
	step_end	
	
CatchUp_Movement:
	step UP
	step_end

DoorLocked_Movement:
	turn_head DOWN
	step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
Movement_BlueThroughDoor:
	step UP
	step_end
	
Movement_PlayerThroughDoor:
	step UP
	step UP
	step_end

OakLabFrontRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAK_LAB_BACK_ROOM, 1


	db 4 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript
	coord_event  3, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript2

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OakLabFrontRoomComputerScript
	bg_event  0,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  0, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  0, BGEVENT_READ, OakLabFrontRoomSign


	db 6 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomAideScript, -1
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	object_event  4, 13, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDaisyScript, EVENT_DAISY_OAK_LAB_FRONT_ROOM
	object_event  1,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	object_event  0,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM

	
