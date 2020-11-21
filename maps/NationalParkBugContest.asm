	object_const_def ; object_event constants
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2

NationalParkBugContest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BugCatchingContestant1AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant1AText
	waitbutton
	closetext
	end

BugCatchingContestant2AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant2AText
	waitbutton
	closetext
	end

BugCatchingContestant3AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant3AText
	waitbutton
	closetext
	end

BugCatchingContestant4AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant4AText
	waitbutton
	closetext
	end

BugCatchingContestant5AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant5AText
	waitbutton
	closetext
	end

BugCatchingContestant6AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant6AText
	waitbutton
	closetext
	end

BugCatchingContestant7AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant7AText
	waitbutton
	closetext
	end

BugCatchingContestant8AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant8AText
	waitbutton
	closetext
	end

BugCatchingContestant9AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant9AText
	waitbutton
	closetext
	end

BugCatchingContestant10AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant10AText
	waitbutton
	closetext
	end

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

BugCatchingContestant1AText:
	text "DIN: Sto per"
	line "vincere! Non"
	cont "disturbarmi!"
	done

BugCatchingContestant2AText:
	text "ED: Il mio"
	line "PARASECT usa SPORA"
	para "per addormentare"
	line "i #MON."
	done

BugCatchingContestant3AText:
	text "NICO: Voglio"
	line "#MON veloci per"
	cont "combattere."
	done

BugCatchingContestant4AText:
	text "WILLIAM: Non mi"
	line "importa di"
	cont "vincere."

	para "Cerco soltanto"
	line "#MON rari."
	done

BugCatchingContestant5AText:
	text "MIK: Silenzio! O"
	line "spaventerai"

	para "SCYTHER."
	line "Parleremo dopo."
	done

BugCatchingContestant6AText:
	text "PA: Prima devi"
	line "indebolire i #-"
	para "MON coleottero,"
	line "per poi tirare"
	cont "una # BALL."
	done

BugCatchingContestant7AText:
	text "CINDY: Adoro i"
	line "#MON COLEOT-"
	cont "TERO."

	para "Anche tu dovresti"
	line "farlo."
	done

BugCatchingContestant8AText:
	text "JOI: Catturo"
	line "#MON COLEOTTERO"

	para "da quando ero"
	line "in fasce."

	para "Escludo proprio di"
	line "poter perdere!"
	done

BugCatchingContestant9AText:
	text "SAMUELE: Invece di"
	line "parlare, perché"

	para "non cerchi un"
	line "#MON"
	cont "COLEOTTERO?"
	done

BugCatchingContestant10AText:
	text "PIPPO: Ho studiato"
	line "molto i #MON"
	cont "COLEOTTERO."

	para "Sono sicuro di"
	line "vincere."
	done

NationalParkBugContestRelaxationSquareText:
	text "PIAZZA TRANQUILLA"
	line "PARCO NAZIONALE"
	done

NationalParkBugContestBattleNoticeText:
	text "Che c'è scritto"
	line "nell'avviso?"

	para "Si prega di"
	line "lottare soltanto"
	cont "nell'erba."

	para "PARCO NAZIONALE"
	line "UFFICIO GUARDIANO"
	done

NationalParkBugContestTrainerTipsText:
	text "CONSIGLI UTILI"

	para "#MON differenti"
	line "appaiono a diverse"
	para "ore del giorno."
	done

NationalParkBugContest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 32, 31, STAND_CITY_NATIONAL_PARK_GATE, 1
	warp_event 33, 31, STAND_CITY_NATIONAL_PARK_GATE, 2
	warp_event  9, 53, ROUTE_103_NATIONAL_PARK_GATE, 1
	warp_event 10, 53, ROUTE_103_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 48, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 12, 24, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event 24, 53, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 34, 38, BGEVENT_READ, NationalParkBugContestTrainerTipsSign

	db 12 ; object events
	object_event 16, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 21, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 11, 10, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 36, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 33, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 14, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 27,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 36,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 35, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
