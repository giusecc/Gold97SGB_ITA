	object_const_def ; object_event constants
	;const ROUTE106_FISHER
	const ROUTE106_YOUNGSTER
	const ROUTE106_BUG_CATCHER
	const ROUTE106_COOLTRAINER_M
	const ROUTE106_FRUIT_TREE
	const ROUTE106_POKE_BALL1
	const ROUTE106_POKE_BALL2
	const ROUTE106_GRAMPS
	const ROUTE113_DAY_CARE_MON_1
	const ROUTE113_DAY_CARE_MON_2
;	const ROUTE106_POKEFAN_M
	const ROUTE106_BUG_CATCHER_2
	const ROUTE106_YOUNGSTER_2

Route106_MapScripts:
	db 0 ; scene scripts


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end


TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	checkevent EVENT_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	jumpstd NumberAcceptedMScript
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end


TrainerFledglingPaulson:
	trainer FLEDGLING, PAULSON, EVENT_BEAT_FLEDGLING_PAULSON, FledglingPaulsonSeenText, FledglingPaulsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingPaulsonAfterText
	waitbutton
	closetext
	end


TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

Route106YoungsterScript:
	jumptextfaceplayer Route106YoungsterText

Route106Sign:
	jumptext Route106SignText

DarkCaveSign:
	jumptext DarkCaveSignText

JadeSign:
	jumptext JadeSignText
	
Route106PokecenterSign:
	jumpstd PokecenterSignScript

Route106CooltrainerMScript:
	jumptextfaceplayer Route106CooltrainerMText

Route106FruitTree:
	fruittree FRUITTREE_ROUTE_106

Route106Potion:
	itemball SUPER_POTION

Route106PokeBall:
	itemball GREAT_BALL
	
Route113MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end
	
BugCatcherRobSeenText:
	text "Hai trovato dei"
	line "bei coleotteri"
	cont "BOSCO?"
	done
	
BugCatcherRobBeatenText:
	text "Distrutto!"
	done
	
BugCatcherRobAfterBattleText:
	text "Era una domanda"
	line "trabocchetto."
	para "Tutti i #MON"
	line "COLEOTTERO sono"
	cont "belli."
	done


SchoolboyChad1SeenText:
	text "Studio i #MON"
	line "rari."
	done

SchoolboyChad1BeatenText:
	text "Non ho studiato"
	line "abbastanza."
	done

SchoolboyChadSoManyTestsText:
	text "Hai mai sentito"
	line "parlare di EEVEE?"
	para "Dicono che ce ne"
	line "siano qui vicino!"
	para "Io non ne ho"
	line "mai visti."
	para "Ti farò sapere"
	line "se ne vedrò"
	cont "qualcuno."
	done

FledglingPaulsonSeenText:
	text "Lotto vicino"
	line "al CENTRO #MON."
	para "Così posso"
	line "curarli se perdo."
	done

FledglingPaulsonBeatenText:
	text "Non di nuovo!"
	done

FledglingPaulsonAfterText:
	text "I miei #MON"
	line "si rafforzano,"
	para "anche se"
	line "lentamente."
	done
	


Route106CooltrainerMText:
	text "Sei mai stato"
	line "alla PENSIONE?"
	para "Possono allevare"
	line "i tuoi #MON."
	done

BugCatcherWade1SeenText:
	text "Ho catturati dei"
	line "#MON. Lascia"
	cont "che lotti con te!"
	done

BugCatcherWade1BeatenText:
	text "Oooooh…"
	done

BugCatcherWade1AfterText:
	text "Puoi prendere un"
	line "#MON anche se"

	para "ne hai già sei"
	line "con te."

	para "Se ne catturi uno"
	line "andrà automatica-"
	cont "mente nel BOX."
	done


Route106YoungsterText:
	text "Ho preso un"
	line "#MON nel BOSCO"
	cont "GIADA."

	para "Lo allenerò per"
	line "sfidare"
	cont "JASMINE."

	para "È la capopalestra"
	line "di DESMOPOLI."
	done

Route106SignText:
	text "PERCORSO 106"

	para "DESMOPOLI -"
	line "AVIOPOLI"
	done

DarkCaveSignText:
	text "PENSIONE #MON"
	para "Facciamo crescere"
	line "i vostri #MON!"
	done

JadeSignText:
	text "BOSCO GIADA"
	para "Entrata a destra."
	done

HikerAnthony2SeenText:
	text "Ho attraversato"
	line "il BOSCO, ma"

	para "sono ancora pieno"
	line "di energie."
	done

HikerAnthony2BeatenText:
	text "Hai molte più"
	line "energie di me!"
	done

HikerAnthony2AfterText:
	text "Noi ESPLORATORI"
	line "siamo i migliori"
	para "quando possiamo"
	line "esplorare"
	cont "liberamente."
	done

HikerAnthonyParaText:
	text "Ehi! Hai preso"
	line "un EEVEE?"

	para "Ne ho preso uno"
	line "anche io!"

	para "Sono così morbidi!"
	done

Route106_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8,  5, ROUTE_105_ROUTE_106_GATE, 3
	warp_event  9,  5, ROUTE_105_ROUTE_106_GATE, 4
	warp_event 16, 12, JADE_FOREST, 1
	warp_event 16, 13, JADE_FOREST, 2
	warp_event 23,  8, JADE_FOREST, 3
	warp_event 23,  9, JADE_FOREST, 4
	warp_event 33,  5, DAY_CARE, 1
	warp_event 36,  5, DAY_CARE, 3
	warp_event  9, 10, ROUTE_106_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 52,  8, BGEVENT_READ, Route106Sign
	bg_event 30,  5, BGEVENT_READ, DarkCaveSign
	bg_event 12, 12, BGEVENT_READ, JadeSign
	bg_event 10, 10, BGEVENT_READ, Route106PokecenterSign

	db 11 ; object events
	;object_event 52, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106MailRecipientScript, -1
	object_event  7, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106YoungsterScript, -1
	object_event 24,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherRob, -1
	object_event 42, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106CooltrainerMScript, -1
	object_event  4, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106FruitTree, -1
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106Potion, EVENT_ROUTE_106_POTION
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106PokeBall, EVENT_ROUTE_106_POKE_BALL
	object_event 38,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_113
	object_event 40,  7, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 42,  6, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
;	object_event 49,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  4,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerFledglingPaulson, -1
	object_event 50,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
