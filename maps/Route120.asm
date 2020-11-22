	object_const_def ; object_event constants
	const ROUTE120_FRUIT_TREE
	const ROUTE120_YOUNGSTER
	const ROUTE120_SCHOOLBOY
	const ROUTE120_LASS
	const ROUTE120_GRAMPS

Route120_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JOEY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	checkflag ENGINE_FLYPOINT_KANTO
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_ALLOY
	iftrue .LoadFight1
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
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

.RematchStd:
	jumpstd RematchMScript
	end
	

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end

Route120BoulderMineSign:
	jumptext Route120BoulderMineSignText

Route120FruitTree:
	fruittree FRUITTREE_ROUTE_120
	
Route120GrampsText:
	text "Oh! Sei qui!"
	para "Dammi una"
	line "mano."
	para "Mia nipote potreb-"
	line "be essere intrap-"
	cont "polata qui!"
	done
	

LassConnie1SeenText:
	text "Non so perché"
	line "vado in giro con"
	para "FIORENZO o"
	line "GENNARO."

	para "Sei molto più"
	line "ganzo di loro due!"
	done

LassConnie1BeatenText:
	text "Aaah! I miei"
	line "#MON!"
	done

LassConnie1AfterBattleText:
	text "Ho perso, ma è"
	line "stato più"
	para "divertente che"
	line "stare con"
	cont "quei due."
	done

	
SchoolboyDudleySeenText:
	text "Qui ci vediamo"
	line "io e i miei amici"
	cont "dopo la scuola!"
	done

SchoolboyDudleyBeatenText:
	text "Bella mossa."
	done

SchoolboyDudleyAfterBattleText:
	text "Ho fatto del mio"
	line "meglio. Nessun"
	cont "rimpianto."
	done
	
YoungsterJoey1SeenText:
	text "È divertente"
	line "giocare nella"
	cont "CAVA."
	para "Ma non dirlo ai"
	line "nostri genitori!"
	done

YoungsterJoey1BeatenText:
	text "Aah! Ho perso!"
	done

YoungsterJoey1AfterText:
	text "Ho altri #MON"
	line "per lottare"
	cont "meglio?"

	para "No! Continuerò"
	line "con questo"
	cont "nonostante tutto!"
	done


YoungsterJoeyText_GiveHPUpAfterBattle:
	text "Ho perso di nuovo…"
	line "Sei forte!"

	para "Oh si, mi ero"
	line "dimenticato di"
	cont "darti questo."

	para "Usalo per essere"
	line "ancora più forte!"

	para "Anch'io sarò"
	line "più forte."
	done

Route120BoulderMineSignText:
	text "CAVA ROCCIOSA"
	para "Zona pericolosa!"
	para "Non entrare"
	line "senza #MON"
	para "che ti"
	line "proteggano."
	done

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINE_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120BoulderMineSign

	db 5 ; object events
	object_event 42,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_TEKNOS_CITY_GRAMPS


