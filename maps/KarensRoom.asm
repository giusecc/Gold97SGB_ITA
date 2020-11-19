	object_const_def ; object_event constants
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KarensRoomDoors

.LockDoor:
	priorityjump .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.KarensRoomDoors:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.KarensDoorLocksBehindYou:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue KarenRematchTeam
	loadtrainer KAREN, KAREN1
ReturnToMainKaren:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end
	
KarenRematchTeam:
	loadtrainer KAREN, KAREN2
	jump ReturnToMainKaren
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "Ciao!"

	para "Sono MISTY dei"
	line "SUPERQUATTRO."

	para "Tu sei <PLAYER>?"
	line "Piacere di"
	cont "conoscerti."
	
	para "Ma non sono qui"
	line "solo per i"
	cont "convenevoli!"
	
	para "I miei #MON"
	line "ACQUA sono pronti"
	cont "a lottare."
	para "E io sono pronta"
	line "a batterti!"
	
	para "Sei pronto? Allora"
	line "lottiamo!"
	done

KarenScript_KarenBeatenText:
	text "Sembra che anche"
	line "i tuoi #MON"
	para "fossero pronti a"
	line "lottare al tuo"
	cont "fianco!"
	done

KarenScript_KarenDefeatText:
	text "Gli allenatori"
	line "migliori non sono"
	para "quelli che scel-"
	line "gono i #MON"
	cont "più forti."
	para "Sono quelli che"
	line "lottano con i"
	cont "loro preferiti,"
	para "creando un forte"
	line "legame."
	
	para "Per questo"
	line "vincono."
	
	para "Credo che tu"
	line "l'abbia capito."

	para "Vai, il CAMPIONE"
	line "ti attende."
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
