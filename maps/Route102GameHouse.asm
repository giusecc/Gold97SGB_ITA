	object_const_def ; object_event constants
	const N64_HOUSE_SCIENTIST
	const N64_HOUSE_YOUNGSTER
	const N64_HOUSE_ROCKER
	const N64_HOUSE_LASS
	const N64_HOUSE_COOLTRAINER_M

Route102GameHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

N64HouseScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .AlreadyAskedToSearchN64
	writetext N64HouseScientistText
	buttonsound
	writetext N64HouseScientistText2
	waitbutton
	closetext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	end

.AlreadyAskedToSearchN64
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iffalse .N64OnePersonSoFar
	writetext N64HouseScientistText2
	waitbutton
	closetext
	end
	
.N64OnePersonSoFar
	checkevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	iffalse .N64TwoPeopleNow
	writetext N64HouseScientistText3
	waitbutton
	closetext
	end
	
.N64TwoPeopleNow
	checkevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	iffalse .N643PeopleTimeForStarter3
	writetext N64HouseScientistText4
	waitbutton
	closetext
	end
	
.N643PeopleTimeForStarter3
	checkevent EVENT_HYDRAULIC_CAVE_ENTEI
	iftrue .AlreadyGotStarter3
	writetext N64HouseScientistText5
	waitbutton
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .HaveCruiseGiveFlambear
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .HaveHappaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg HAPPA, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_HYDRAULIC_CAVE_ENTEI
	end
	
.HaveHappaGiveCruise
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg CRUISEAL, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_HYDRAULIC_CAVE_ENTEI
	end
	
.HaveCruiseGiveFlambear
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter3
	giveegg FLAMBEAR, 5
	stringtotext .eggname3, MEM_BUFFER_1
	scall .GetStarter3Egg
	writetext TakeGoodCareOfStarter3
	waitbutton
	closetext
	setevent EVENT_HYDRAULIC_CAVE_ENTEI
	end
	
.AlreadyGotStarter3
	writetext AlreadyGotStarter3Text
	waitbutton
	closetext
	end
	
.eggname3
	db "UOVO@"
	
.GetStarter3Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.PartyFullStarter3
	writetext NoRoomForStarter3
	waitbutton
	closetext
	end
	
N64HouseRockerScript:
	faceplayer
	opentext
	writetext N64HouseRockerText
	waitbutton
	closetext
	turnobject N64_HOUSE_ROCKER, RIGHT
	end

N64HouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	iffalse .RockerTwoPeopleNow
	writetext RockerN64AloneText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
.RockerTwoPeopleNow
	writetext RockerN64TwoPeopleText
	waitbutton
	closetext
	turnobject N64_HOUSE_YOUNGSTER, UP
	end
	
N64HouseLassScript:
	faceplayer
	opentext
	writetext N64HouseLassText
	waitbutton
	closetext
	turnobject N64_HOUSE_LASS, UP
	end
	
N64HouseCooltrainerMScript:
	faceplayer
	opentext
	writetext N64HouseCooltrainerMText
	waitbutton
	closetext
	turnobject N64_HOUSE_COOLTRAINER_M, LEFT
	end
	
N64HouseFisherScript:
	jumptextfaceplayer N64HouseFisherText
	
N64HouseN64Script:
	jumptext N64HouseN64Text
	
N64HouseN64Text:
	text "<PLAYER> gioca con"
	line "N64."

	para "Meglio andare,"
	line "non c'è tempo"
	cont "da perdere!"
	done
	
N64HouseFisherText:
	text "Dovrei provare"
	line "i giochi di corsa"
	para "con quei ragazzi?"
	para "Credo che non ne"
	line "sarei capace."
	done
	
N64HouseCooltrainerMText:
	text "Questo posto ha"
	line "una grande scelta"
	para "di giochi"
	line "sportivi!"
	done
	
N64HouseLassText:
	text "Non sono bravo con"
	line "i giochi sportivi,"
	para "ma il mio amico"
	line "mi sta aiutando."
	done
	
TakeGoodCareOfStarter3:
	text "So che ti prende-"
	line "rai cura di quel"
	cont "#MON."
	done
	
NoRoomForStarter3:
	text "Oh, aspetta! Non"
	line "hai spazio!"
	done
	
AlreadyGotStarter3Text:
	text "Questo posto è"
	line "il luogo migliore"
	para "per socializzare"
	line "e giocare!"
	para "Tutto grazie a te!"
	done
	
N64HouseScientistText5:
	text "Guarda tutti"
	line "questi allenatori."
	para "È incredibile!"
	line "Ti devo tanto!"
	para "Ecco, tieni questo"
	line "UOVO #MON."
	para "È un #MON"
	line "raro, sicuramente"
	cont "lo apprezzerai!"
	done
	
N64HouseRockerText:
	text "Vincerò!"
	done

RockerN64AloneText:
	text "Bello questo gioco"
	line "di corse, ma non"
	para "c'è nessuno con"
	line "cui giocare!"
	para "Vengo per"
	line "incontrare altri"
	para "allenatori, ma"
	line "sono così solo."
	done
	
RockerN64TwoPeopleText:
	text "Ehi! È molto più"
	line "divertente con"
	cont "altre persone!"
	done

N64HouseScientistText4:
	text "Due clienti!"
	para "Potrei riuscire"
	line "a realizzare un"
	para "luogo di"
	line "incontro per"
	cont "allenatori!"
	para "Vedi se riesci a"
	line "trovarne altri!"
	para "Forse in posti"
	line "in cui le persone"
	para "si incontrano, ma"
	line "non hanno un"
	cont "luogo per giocare…"
	done
	
N64HouseScientistText3:
	text "Ehi! È arrivato"
	line "qualcuno!"
	para "È grandioso!"
	para "Gli hai parlato"
	line "di questo posto?"
	para "Te ne sono grato."
	para "Cerca di trovare"
	line "qualcun altro!"
	para "Forse in luoghi"
	line "dove ci sono"
	para "altri tipi di"
	line "gioco…"
	done
	
N64HouseScientistText2:
	text "Che ne pensi?"
	para "Parla di questo"
	line "luogo a chiunque"
	cont "sia interessato."
	para "Forse in una città"
	line "in cui non c'è"
	cont "molto da fare…"
	done

N64HouseScientistText:
	text "Uffff."
	para "Ho aperto questa"
	line "SALA GIOCHI"
	para "come luogo di"
	line "incontro per gli"
	cont "allenatori."
	para "Non sembra"
	line "avere successo…"
	para "Se trovi qualcuno"
	line "interessato, puoi"
	para "parlare di questo"
	line "posto?"
	done
	
Route102GameHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_102, 2
	warp_event  5,  7, ROUTE_102, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  3, BGEVENT_READ, N64HouseN64Script
	bg_event  0,  3, BGEVENT_READ, N64HouseN64Script


	db 6 ; object events
	object_event 6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseScientistScript, -1
	object_event 4,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseYoungsterScript, EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	object_event 3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseRockerScript, EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2
	object_event 0,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseLassScript, EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	object_event 1,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseCooltrainerMScript, EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	object_event 7,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, N64HouseFisherScript, EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
