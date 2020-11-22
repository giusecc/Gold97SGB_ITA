	object_const_def ; object_event constants
	const ROUTE102_YOUNGSTER1
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS1
	const ROUTE102_FRUIT_TREE
	const ROUTE102_ARTHUR
	const ROUTE102_SILVER
	const ROUTE102_YOUNGSTER3
	const ROUTE102_YOUNGSTER4


Route102_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE102_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE102_SILVER

	db 3 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall
	callback MAPCALLBACK_TILES, .Route102TreeCut

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE102_ARTHUR
	return

.ArthurAppears:
	appear ROUTE102_ARTHUR
	return


.Route102TreeCut:
	checkevent EVENT_ROUTE_102_TREE_CUT
	iffalse .R102TreeThere
	changeblock  33, 7, $6D ; notree
	return
	
.R102TreeThere
	return



TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkflag ENGINE_FLYPOINT_AMAMI
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route102LassScript:
	faceplayer
	opentext
	writetext Route102LassText
	waitbutton
	closetext
	end



TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route102SilverScript:
	applymovement PLAYER, Movement_36DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE102_SILVER, 6, 5
	appear ROUTE102_SILVER
	applymovement ROUTE102_SILVER, Movement_36SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route102RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Happa
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Happa:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102RivalAfterText
	waitbutton
	closetext
	applymovement ROUTE102_SILVER, Route102RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE102_SILVER
	setscene SCENE_ROUTE102_NOTHING
	waitsfx
	playmapmusic
	end

Route102SilverTalkScript:
	end

Route102Sign:
	jumptext Route102SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route102TrainerTips1:
	jumptext Route102TrainerTips1Text

Route102TrainerTips2:
	jumptext Route102TrainerTips2Text
	
Route102GameHouse:
	jumptext Route102GameHouseText

Route102FruitTree:
	fruittree FRUITTREE_ROUTE_102

BipetalShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_36DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_36SilverDownOne:
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route102TreeCut:
	setevent EVENT_ROUTE_102_TREE_CUT
	setscene SCENE_ROUTE102_SILVER
	end
	
Route102RivalBattleExitMovement:
	step UP
	step_end
	
Route102SilverWinText:
	text "Ehi! Ti sei"
	line "allenato molto"
	para "con i tuoi"
	line "#MON!"
	done
	
Route102SilverLossText:
	text "La mia squadra"
	line "è più forte!"
	done
	
Route102RivalBeforeText:
	text "<PLAYER>!"
	para "Devi andare a"
	line "PORTOVEST!"
	para "C'è un #MON-"
	line "MARKET enorme"
	para "e la TORRE"
	line "RADIO e…"
	para "Oh, giusto!"
	para "Ho iniziato a"
	line "sfidare le"
	cont "PALESTRE!"
	para "Anche tu lo stai"
	line "facendo, <PLAYER>!"
	para "Sarà un ottimo"
	line "modo per mostrare"
	para "al mondo quanto"
	line "è forte la mia"
	cont "squadra!"
	para "Ho anche catturato"
	line "altri #MON!"
	para "Anche tu? Lottiamo"
	line "per vedere quali"
	cont "sono i migliori!"
	done
	
Route102RivalAfterText:
	text "È stato bello"
	line "incontrarti,"
	cont "<PLAYER>!"
	para "Io torno in"
	line "città!"
	para "Ci si vede!"
	done


Route102LassText:
	text "Un alberello"
	line "blocca la strada"
	cont "per PORTOVEST."

	para "Se devi passare,"
	line "ti potrebbe"
	para "servire un #MON"
	line "con TAGLIO."
	done

PsychicMarkSeenText:
	text "Leggerò i tuoi"
	line "pensieri!"
	done

PsychicMarkBeatenText:
	text "Ho letto male!"
	done

PsychicMarkAfterBattleText:
	text "Sarei più forte"
	line "se sapessi"

	para "cosa pensa il"
	line "mio avversario."
	done

SchoolboyAlan1SeenText:
	text "Grazie ai miei"
	line "studi, sono pronto"
	cont "a tutto!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Errore"
	line "di calcolo?"
	done

SchoolboyAlanBooksText:
	text "Studio cinque"
	line "ore al giorno."

	para "C'è molto più da"
	line "imparare rispetto"
	cont "ai libri."
	done

MeetArthurText:
	text "GIORGIO: Chi"
	line "sei?"

	para "Io sono GIORGIO"
	line "del giovedì."
	done

ArthurGivesGiftText:
	text "Tieni, prendi"
	line "questo."
	done

ArthurGaveGiftText:
	text "GIORGIO: Dovrebbe"
	line "tenerlo un"
	para "#MON"
	line "che usa attacchi"
	cont "di tipo ROCCIA."

	para "Migliora proprio"
	line "questi attacchi."
	done

ArthurThursdayText:
	text "GIORGIO: Sono"
	line "GIORGIO del"
	para "giovedì, il"
	line "secondo di"

	para "sette fratelli"
	line "e sorelle."
	done

ArthurNotThursdayText:
	text "GIORGIO: Ma oggi"
	line "non è giovedì,"
	cont "che peccato."
	done

Route102SignText:
	text "PERCORSO 102"
	para "ANCESTRALIA -"
	line "PORTOVEST"
	done

RuinsOfAlphNorthSignText:
	text "ROVINE D'ALFA"
	line "ENTRATA NORD"
	done

Route102TrainerTips1Text:
	text "CONSIGLI UTILI"

	para "Le statistiche dei"
	line "#MON variano"
	para "anche nella stessa"
	line "specie."

	para "Le statistiche"
	line "sono simili,"
	cont "all'inizio."

	para "Ma le differenze"
	line "verranno fuori"

	para "quando i #MON"
	line "cresceranno."
	done

Route102TrainerTips2Text:
	text "CONSIGLI UTILI"

	para "Con FOSSA puoi"
	line "tornare all'"
	para "ingresso di"
	line "qualsiasi posto."

	para "È utile quando"
	line "si esplorano"

	para "grotte o altri"
	line "luoghi."
	done
	
Route102GameHouseText:
	text "Vieni a fare"
	line "una pausa!"
	para "SALA GIOCHI"
	done
	


YoungsterSamuelSeenText:
	text "Io mi alleno"
	line "qui!"
	done

YoungsterSamuelBeatenText:
	text "Battuto da uno"
	line "straniero!"
	done

YoungsterSamuelAfterText:
	text "Mi allenerò"
	line "ancora di più."

	para "Dopotutto voglio"
	line "diventare un"
	cont "CAPOPALESTRA."
	done

YoungsterIanSeenText:
	text "Sono il primo"
	line "della classe"
	cont "sui #MON."
	done

YoungsterIanBeatenText:
	text "No! Ci sono"
	line "allenatori più"
	cont "forti…"
	done

YoungsterIanAfterText:
	text "Dovrò allenarmi"
	line "ancora di più."
	done
	
WateredWeirdTreeScript::
	end


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, ROUTE_102_WEST_GATE, 4
	warp_event 15,  4, ROUTE_102_GAME_HOUSE, 1

	db 2 ; coord events
	coord_event  6,  6, SCENE_ROUTE102_SILVER, Route102SilverScript
	coord_event 33,  6, SCENE_DEFAULT, Route102TreeCut

	db 4 ; bg events
	bg_event 22, 10, BGEVENT_READ, Route102TrainerTips2
	bg_event 50, 10, BGEVENT_READ, Route102Sign
	bg_event 32, 10, BGEVENT_READ, Route102TrainerTips1
	bg_event 14,  5, BGEVENT_READ, Route102GameHouse

	db 8 ; object events
	object_event  6, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 29,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 50,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102LassScript, -1
	object_event 38,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102FruitTree, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_102_ARTHUR_OF_THURSDAY
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102SilverTalkScript, EVENT_ROUTE_102_SILVER
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 20,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
