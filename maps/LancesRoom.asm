	object_const_def ; object_event constants
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	priorityjump .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	return

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	jump LancesRoomLanceScript

Script_ApproachLanceFromRight:
;	warp SUNPOINT_DOCKS, 13, 3
;	end
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue LanceRematchTeam
	loadtrainer CHAMPION, LANCE
ReturnToMainLance:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_POKEMON_TALK, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
;	appear LANCESROOM_MARY
;	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
;	opentext
;	writetext UnknownText_0x1811dd
;	waitbutton
;	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
;	follow LANCESROOM_MARY, LANCESROOM_OAK
;	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
;	stopfollow
	turnobject LANCESROOM_OAK, UP
;	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
;	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, RIGHT
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_OAK, LancesRoomMovementData_MaryTriesToFollow
;	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
;	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end
	
LanceRematchTeam:
	loadtrainer CHAMPION, LANCE2
	jump ReturnToMainLance
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "LANCE: Ti stavo"
	line "aspettando."

	para "<PLAYER>!"

	para "Ho saputo di te"
	line "e delle tue gesta."
	
	para "È inevitabile che"
	line "qualcuno con le"
	para "tue capacità"
	line "arrivi qui."

	para "Le parole non"
	line "servono."

	para "Lotteremo per"
	line "capire chi sarà"

	para "il più forte dei"
	line "due."

	para "Io LANCE, il più"
	line "forte allenatore e"

	para "il CAMPIONE della"
	line "LEGA #MON…"

	para "Io, come maestro"
	line "del tipo drago,"
	cont "accetto la sfida!"
	done

LanceBattleWinText:
	text "…È finita."

	para "Ma ho una strana"
	line "sensazione."

	para "Non è la sconfitta"
	line "che mi brucia."
	para "Anzi, ne sono"
	line "felice."

	para "Felice di aver"
	line "visto un"

	para "grande nuovo"
	line "CAMPIONE!"
	done

LanceBattleAfterText:
	text "… Non c'è dubbio."

	para "Ormai sei davvero"
	line "forte, <PLAYER>."

	para "I tuoi #MON"
	line "sono cresciuti"

	para "grazie al tuo"
	line "spirito forte e"
	cont "combattivo."

	para "Diventerai un"
	line "allenatore sempre"

	para "più forte con i"
	line "tuoi #MON."
	done

UnknownText_0x1811dd:
	text "LORI: No! La lotta"
	line "è già finita! Sai,"

	para "il PROF.OAK è un"
	line "po' lento…"
	done

UnknownText_0x18121b:
	text "PROF.OAK: Ah,"
	line "<PLAYER>!"

	para "Congratulazioni!"

	para "Hai conquistato la"
	line "LEGA, è magnifico!"

	para "La dedizione, la"
	line "fiducia e l'amore"

	para "verso i tuoi"
	line "#MON ti hanno"
	para "permesso di"
	line "vincere."

	para "Anche i tuoi"
	line "#MON sono stati"
	cont "grandi."

	para "Hanno resistito"
	line "perché hanno"

	para "creduto nel loro"
	line "allenatore."
	
	para "Quando ti ho"
	line "chiesto di darmi"
	para "una mano con la"
	line "ricerca, non"
	para "credevo che mi"
	line "saresti stato"
	cont "così d'aiuto!"
	para "E hai anche"
	line "conquistato la"
	cont "LEGA!"

	para "Complimenti,"
	line "<PLAYER>!"
	done

UnknownText_0x18134b:
	text "LANCE: Già, devi"
	line "essere orgoglioso."
	para "Non solo di te"
	line "stesso, ma anche"
	cont "dei tuoi #MON."
	done

UnknownText_0x18137b:
	text "LANCE: <PLAYER>,"
	line "seguimi."
	para "Tu e i tuoi #-"
	line "MON meritate il"
	para "giusto ricono-"
	line "scimento."
	done

UnknownText_0x1813c5:
	text "OAK: Complimenti!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	db 2 ; coord events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
