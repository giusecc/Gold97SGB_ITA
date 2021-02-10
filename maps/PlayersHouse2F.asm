	object_const_def ; object_event constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE2F_CLEFAIRY
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler
	
MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	iftrue .KenPart2
	writetext KenGreeting
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenPart2
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenGiveMapCard
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenGiveMapCard
	checkflag ENGINE_MAP_CARD
	iftrue .KenAlreadyGaveMap
	writetext KenGreeting3
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGreeting4
	waitbutton
	closetext
	end
	
.KenAlreadyGaveMap
	writetext KenGreeting5
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAPPA@"
	


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	opentext
	writetext PlayersRadioText1
	waitbutton
	closetext
	end

.NormalRadio:
	checkevent EVENT_ROUTE_102_SILVER
	iftrue .NormalRadio2
	opentext
	writetext PlayersRadioText5
	waitbutton
	closetext
	end	
	
.NormalRadio2
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	writetext PlayersRadioText2
	waitbutton
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end

PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayersRadioText5:
	text "Sembra che"
	line "sia spenta…"
	done
	
KenGreeting:
	text "KEN: Fratellino!"
	para "Quella roba che"
	line "hai al polso…"
	para "Finalmente hai"
	line "un #GEAR!"
	para "Fantastico! Ma"
	line "essendo nuovo, non"
	para "puoi ancora farci"
	line "molto…"
	para "Vai dalla MAMMA"
	line "per fartelo"
	cont "regolare!"
	para "Forse potrei"
	line "trovarti una"
	cont "SCHEDA MAPPA!"
	para "Sai, in caso"
	line "dovesse servirti."
	para "Passa qui prima"
	line "di andare da"
	cont "qualche parte!"
	para "Oh, giusto!"
	para "Credo ti sia"
	line "arrivata una"
	cont "e-mail sul PC."
	para "Dovresti leggerla"
	line "prima di uscire."
	done
	
KenGreeting2:
	para "Passa qui prima"
	line "di andare da"
	cont "qualche parte!"
	done
	
KenGreeting3:
	text "KEN: Fratellino!"
	para "Il PROF.OAK ti"
	line "ha chiesto di"
	para "aiutarlo con il"
	line "#DEX?"
	para "Grandioso! Tieni"
	line "questo!"
	done
	
KenGreeting4:
	text "Ora il tuo #-"
	line "GEAR può tenere"
	para "traccia della"
	line "tua posizione!"
	para "Con questa non"
	line "ti perderai mai!"
	para "Sai una cosa?"
	para "Mi hanno offerto"
	line "un lavoro come"
	para "DJ alla radio di"
	line "PORTOVEST!"
	para "Potrei essere in"
	line "radio, fratellino!"
	para "Potresti sentirmi"
	line "in futuro!"
	para "Buona fortuna per"
	line "il viaggio!"
	done
	
KenGreeting5:
	text "Mi hanno offerto"
	line "un lavoro come"
	para "DJ alla radio di"
	line "PORTOVEST!"
	para "Potrei essere in"
	line "radio, fratellino!"
	para "Potresti sentirmi"
	line "in futuro!"
	para "Buona fortuna per"
	line "il viaggio!"
	done

PlayersDollText:
	text "È una bambola"
	line "che ti ha regalato"
	para "un parente di"
	line "KANTO per Natale."
	done

PlayersRadioText1:
	text "<PLAYER> accende"
	line "la radio."
	
	para "…"

	para "State ascoltando"
	line "JOPM, la stazione"
	cont "radio #MON!"
	
	para "Tra poco,"
	line "Notizie #MON!"
	
	para "… Il famoso"
	line "scienziato #MON"
	para "OAK è"
	line "scomparso da"
	cont "KANTO!"
	
	para "Secondo alcuni"
	line "si è trasferito"
	para "alla ricerca di"
	line "un nuovo luogo"
	para "per i suoi studi,"
	line "ma non si può"
	para "escludere che"
	line "sia stato coinvol-"
	para "to in un"
	line "incidente."
	
	para "Le parti interes-"
	line "sate sono"
	cont "preoccupate."
	
	para "…"
	
	para "Questo è tutto per"
	line "Notizie #MON."
	
	para "…"
	
	
	
	done

PlayersRadioText2:
	text "<PLAYER> accende"
	line "il PC."
	
	para "Cos'è?"
	line "Una e-mail?"
	
	para "…"
	
	para "Scusa per la"
	line "e-mail improvvisa,"
	para "ma ho una cosa"
	line "da affidarti."
	
	para "Puoi venire a"
	line "prenderla?"
	
	para "PROF.OAK"
	
	done

PlayersRadioText3:
	text "Qui DJ LORI,"
	line "la presentatrice!"
	done

PlayersRadioText4:
	text "#MON!"
	line "RADIO #MON…"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript


	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
