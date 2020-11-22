	object_const_def ; object_event constants
	const ROUTE119_FISHER1
	const ROUTE119_FISHER2
	const ROUTE119_ROCKET1
	const ROUTE119_ROCKET2
	const LAKEOFRAGE_WESLEY
	const ROUTE119_ITEMBALL_1
	const ROUTE119_ITEMBALL_2
	const ROUTE119_COOLTRAINER_M

Route119_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Wesley


.Wesley:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return
	
Route119Roar:
	itemball TM_ROAR

Route119CrownPathSign:
	jumptext Route119CrownPathSignText

Route119LockedDoor:
	jumptext Route119LockedDoorText
	
TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end



TrainerFisherChris:
	trainer FISHER, CHRIS1, EVENT_BEAT_FISHER_CHRIS, FisherChrisSeenText, FisherChrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_CHRIS_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_FISHER_CHRIS
	iftrue .NumberAccepted
	checkevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherChrisAfterBattleText
	promptbutton
	setevent EVENT_CHRIS_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_CHRIS
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext FisherChrisBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer FISHER, CHRIS1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, CHRIS2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, CHRIS3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHRIS_READY_FOR_REMATCH
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
	
	
Route119Rocket1Script:
	opentext
	writetext Route119Rocket1Text
	waitbutton
	closetext
	end
	
Route119Rocket2Script:
	opentext
	writetext Route119Rocket2Text
	waitbutton
	closetext
	end
	
WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end


Route119SoftSand:
	itemball SOFT_SAND
	
TrainerSportsmanBryson:
	trainer SPORTSMAN, BRYSON, EVENT_BEAT_SPORTSMAN_BRYSON, SportsmanBrysonSeenText, SportsmanBrysonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanBrysonAfterText
	waitbutton
	closetext
	end


FisherChrisSeenText:
	text "Lascia che ti"
	line "mostri la forza"
	para "dei #MON"
	line "che ho catturato!"
	done

FisherChrisBeatenText:
	text "Cosa? Non è"
	line "giusto."
	done

FisherChrisAfterBattleText:
	text "Voglo diventare"
	line "un CAMPIONE"

	para "con i #MON"
	line "che ho catturato."

	para "È questo il bello"
	line "della pesca!"
	done
	

SportsmanBrysonSeenText:
	text "Uff!"

	para "Niente è meglio"
	line "di una corsetta"
	cont "in spiaggia!"
	done

SportsmanBrysonBeatenText:
	text "Sabbia nelle"
	line "scarpe!"
	done

SportsmanBrysonAfterText:
	text "Non è il massimo"
	line "correre sulla"
	cont "sabbia."
	done

FisherJustinSeenText:
	text "No!"

	para "Mi hai fatto"
	line "perdere un pesce!"
	done

FisherJustinBeatenText:
	text "Splash!"
	done

FisherJustinAfterText:
	text "Calma…"
	line "L'essenza della"

	para "pesca è la stessa"
	line "di quella delle"
	cont "lotte #MON."
	done

FisherRalph1SeenText:
	text "Sono bravo a"
	line "pescare e a"
	cont "lottare."

	para "Non perderò con"
	line "un ragazzino!"
	done

FisherRalph1BeatenText:
	text "Ho rischiato"
	line "troppo…"
	done

FisherRalphAfterText:
	text "Pescare è una"
	line "scelta di vita."

	para "I #MON sono"
	line "compagni di vita!"
	done

FisherRalphSwarmText:
	text "Uno, due, tre…"
	line "Ahahaha, che bel"

	para "bottino!"
	line "Ho finito!"

	para "Prendine quanti"
	line "ne vuoi, ragazzo!"
	done

Route119CrownPathSignText:
	text "PERCORSO 119"
	para "TECNOPOLI a est"
	done

Route119LockedDoorText:
	text "Passaggio per"
	line "ELIOPOLI."
	done
	
Route119Rocket1Text:
	text "Fufufufu…"
	para "Perché siamo"
	line "qui?"
	done
	
Route119Rocket2Text:
	text "Hehehehe…"
	para "Non credo che"
	line "il capo ci"
	cont "rispetti molto…"
	done
	
MeetWesleyText:
	text "ERCOLE: Come te"
	line "la passi?"

	para "Oggi è mercoledì"
	line "e guarda caso, io"

	para "sono ERCOLE del"
	line "mercoledì."
	done

WesleyGivesGiftText:
	text "Piacere di"
	line "conoscerti. Eccoti"
	cont "un ricordino."
	done

WesleyGaveGiftText:
	text "ERCOLE: CINTURA-"
	line "NERA potenzia le"
	para "mosse di tipo"
	line "lotta."
	done

WesleyWednesdayText:
	text "ERCOLE: Se hai"
	line "trovato me, avrai"

	para "conosciuto i miei"
	line "fratelli e"
	cont "sorelle."

	para "O mi hai trovato"
	line "per caso?"
	done

WesleyNotWednesdayText:
	text "ERCOLE: Oggi non è"
	line "mercoledì."
	cont "Peccato."
	done


Route119_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  9, ROUTE_119_SUNPOINT_GATE, 3
	warp_event 11,  9, ROUTE_119_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 44, BGEVENT_READ, Route119CrownPathSign
	bg_event  8, 10, BGEVENT_READ, Route119LockedDoor

	db 8 ; object events
	object_event  7, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 10, 41, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherChris, -1
	object_event 10, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rocket1Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 11, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rocket2Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event 12, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_KIKAI_VILLAGE_WESLEY_OF_WEDNESDAY
	object_event  4, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119Roar, EVENT_GREAT_EAST_STRAIT_X_SPEED
	object_event 10, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119SoftSand, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
	object_event  5, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSportsmanBryson, -1
