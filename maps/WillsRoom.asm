	object_const_def ; object_event constants
	const WILLSROOM_WILL

WillsRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .WillsRoomDoors

.LockDoor:
	priorityjump .WillsDoorLocksBehindYou
	end

.DummyScene:
	end

.WillsRoomDoors:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.WillsDoorLocksBehindYou:
	applymovement PLAYER, WillsRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue WillScript_AfterBattle
	writetext WillScript_WillBeforeText
	waitbutton
	closetext
	winlosstext WillScript_WillBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue WillRematchTeam
	loadtrainer WILL, WILL1
ReturnToMainWill:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end


WillScript_AfterBattle:
	writetext WillScript_WillDefeatText
	waitbutton
	closetext
	end
	
WillRematchTeam:
	loadtrainer WILL, WILL2
	jump ReturnToMainWill
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

WillScript_WillBeforeText:
	text "Benvenuto alla"
	line "LEGA #MON,"
	cont "<PLAYER>."

	para "Permettimi di"
	line "presentarmi: mi"
	cont "chiamo PINO."

	para "Mi sono allenato"
	line "in tutto il mondo,"

	para "per potenziare i"
	line "miei #MON"
	cont "di tipo psico."

	para "Infine sono stato"
	line "ammesso tra i"
	cont "SUPERQUATTRO."

	para "Qui non potrò che"
	line "migliorare!"

	para "Che io perda è"
	line "impensabile!"
	done

WillScript_WillBeatenText:
	text "Io… non…"
	line "posso crederci…"
	done

WillScript_WillDefeatText:
	text "Nonostante la"
	line "sconfitta, non"
	cont "posso demordere."

	para "Continuerò a"
	line "lottare finché"

	para "non sarò il più"
	line "grande!"

	para "Ora, <PLAYER>,"
	line "proverai tutta"

	para "la potenza dei"
	line "SUPERQUATTRO."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, MOUNT_FUJI_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2
	warp_event  5, 17, MOUNT_FUJI_POKECENTER_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WillScript_Battle, -1
