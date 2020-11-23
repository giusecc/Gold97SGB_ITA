	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetKenAndDecorForOldSaves
	
.SetKenAndDecorForOldSaves
	setmapscene PLAYERS_HOUSE_2F, SCENE_PLAYERS_HOUSE_2F_NOTHING
	setevent EVENT_DECO_N64
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_POSTER_1
	return


.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext Oak2sLookingForYouText
	buttonsound
;	stringtotext GearName, MEM_BUFFER_1
;	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext GearIsActiveText1
	waitbutton
	waitsfx
	writetext GearIsActiveText2
	playsound SFX_ITEM
	waitsfx
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	jump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	special NameRival
	opentext
	writetext FinalMomText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	setevent EVENT_BLUE_SILENT_TOWN
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .BankOfMom
	;checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	;iftrue .GaveMysteryEgg
	;checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	;iftrue .GotAPokemon
	writetext HurryUpOak2IsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfOak2sErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	special BankOfMom
	waitbutton
	closetext
	end


TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end
	
GearIsActiveText1:
	text "Ecco!"
	para "Credo sia tutto"
	line "a posto!"
	done
	
GearIsActiveText2:
	text "Il #GEAR di"
	line "<PLAYER> è"
	cont "funzionante!"
	done

FinalMomText:
	text "Capisco,"
	line "si chiama"
	cont "<RIVAL>!"
	
	para "Dev'essere ancora"
	line "qui vicino."
	
	para "Sono sicuro che"
	line "lo troverai."
	done

Oak2sLookingForYouText:
	text "Oh, <PLAYER>…!"
	line "Il tuo #MON"

	para "GEAR non è"
	line "impostato!"
	
	para "Meglio farlo"
	line "prima di partire!"
	done

MomGivesPokegearText:
	text "Il #MON"
	line "GEAR, detto anche"
	cont "#GEAR:"

	para "è essenziale per"
	line "diventare un buon"
	cont "allenatore."

	para "Ah, non è inserito"
	line "il giorno."

	para "Non bisogna mai"
	line "dimenticarsene!"
	done

IsItDSTText:
	text "È in vigore"
	line "l'ora legale?"
	done

ComeHomeForDSTText:
	text "Se vuoi regolare"
	line "l'orologio per"

	para "l'ora legale, devi"
	line "tornare a case."

	para "Ah, sai come si"
	line "usa il TELEFONO?"
	done

KnowTheInstructionsText:
	text "Devi soltanto"
	line "aprire il #GEAR"

	para "e selezionare"
	line "l'icona TELEFONO."
	done

DontKnowTheInstructionsText:
	text "Ora ti leggo le"
	line "istruzioni."

	para "Accendere il #-"
	line "GEAR e selezionare"
	cont "l'icona TELEFONO."
	done

InstructionsNextText:
	text "I numeri sono"
	line "registrati in"

	para "meoria. Selezio-"
	line "nare il numero da"
	cont "chiamare."

	para "Sembra davvero"
	line "comodo!"
	
	para "Comunque, poco"
	line "fa è passato un"
	
	para "tuo amico a"
	line "cercarti."
	
	para "Non riesco a"
	line "ricordarmi il"
	cont "suo nome…"
	
	
	done

HurryUpOak2IsWaitingText:
	text "Il PROF.OAK mi"
	line "ha detto che"
	
	para "voleva parlarti."
	line "Vai da lui il"
	cont "prima possibile."

	done

SoWhatWasProfOak2sErrandText:
	text "Cosa voleva il"
	line "PROF.OAK?"

	para "…"

	para "È una bella"
	line "responsabilità!"

	para "Devi essere orgo-"
	line "glioso di tutta"
	cont "questa fiducia."
	done

ImBehindYouText:
	text "<PLAYER>, coraggio!"

	para "Io ti sarò sempre"
	line "vicina!"
	done


StoveText:
	text "La specialità"
	line "della mamma!"

	para "MINESTRONE DI"
	line "ELIOPOLI!"
	done

SinkText:
	text "Il lavandino"
	line "brilla: la mamma"
	cont "ama la pulizia."
	done

FridgeText:
	text "Vediamo cosa"
	line "c'è in frigo…"

	para "ACQUA FRESCA e"
	line "LEMONSUCCO!"
	done

TVText:
	text "Un film alla TV:"
	line "due ragazzi in"

	para "treno nella"
	line "notte stellata…"

	para "Anch'io devo"
	line "andare!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SILENT_TOWN, 2
	warp_event  7,  7, SILENT_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  1, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
