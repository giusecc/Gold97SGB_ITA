	object_const_def ; object_event constants
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .BrunosRoomDoors

.LockDoor:
	priorityjump .BrunosDoorLocksBehindYou
	end

.DummyScene:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, BrunosRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue BrunoRematchTeam
	loadtrainer BRUNO, BRUNO1
ReturnToMainBruno:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end
	
BrunoRematchTeam:
	loadtrainer BRUNO, BRUNO2
	jump ReturnToMainWill
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "Oh!"

	para "Il vecchio OAK ha"
	line "mandato un altro"
	para "ragazzo in giro"
	line "per le sue"
	cont "ricerche…"

	para "Sono AGATHA dei"
	line "SUPERQUATTRO."
	
	para "Nella mia vita ho"
	line "vissuto gioie e"
	cont "dolori."
	
	para "Quel vecchio matto"
	line "di OAK vive ancora"
	cont "nei suoi sogni."
	
	para "I #MON esistono"
	line "da sempre per"
	cont "lottare!"

	para "Dimmi, ragazzo."

	para "Fin dove ti ha"
	line "spinto la tua"
	para "determinazione"
	line "a completare il"
	cont "#DEX?"
	
	para "Scopriamolo."
    	line "Fufufufu…"
	done

BrunoScript_BrunoBeatenText:
	text "Oh, povera me!"
	
	para "Hai delle grandi"
	line "abilità, ragazzo."
	done

BrunoScript_BrunoDefeatText:
	text "Hmm…"
	
	para "Forse quel vecchio"
	line "ha visto in te del"
	cont "potenziale."
	
	para "Vai avanti."
	
	para "Il tuo viaggio non"
	line "è ancora finito."
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
