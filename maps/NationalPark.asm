	object_const_def ; object_event constants
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
;	const NATIONALPARK_YOUNGSTER3
;	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	buttonsound
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end


TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end


TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "Quanti #MON"
	line "ci sono?"
	para "Almeno 200."
	done

NationalParkPokefanFText:
	text "Mia figlia mi"
	line "chiama con il"
	cont "suo #GEAR."
	para "Mi rallegra"
	line "la giornata!"
	done

NationalParkTeacher1Text:
	text "Vuoi fare"
	line "attenzione?!"

	para "…Oh, scusa."
	
	para "Devo smetterla di"
	line "comportarmi sempre"
	cont "da insegnante."

	para "Sei un allenatore"
	line "di #MON, vero?"

	para "Visto che stai"
	line "lavorando sodo, ti"

	para "voglio dare"
	line "questo."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Fai tenere"
	line "RAPIDARTIGLI ad un"
	cont "#MON."

	para "Gli sarà più"
	line "facile attaccare"
	cont "per primo."
	done

NationalParkYoungster1Text:
	text "Gioco con le"
	line "figurine dei"
	cont "miei #MON!"
	done

NationalParkYoungster2Text:
	text "Se vinco, mi"
	line "prendo la figurina"
	cont "di BOMSEAL."
	done

NationalParkTeacher2Text:
	text "Passeggio spesso"
	line "nel PARCO, ma"

	para "non vado mai"
	line "nell'erba."

	para "Gli allenatori"
	line "non fanno che"
	para "combattere…"
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

NationalParkGameboyKidText:
	text "Sto giocando a"
	line "#MON ROSSO!"
	para "Lo sai che puoi"
	line "scambiare #MON"
	para "dai giochi"
	line "precedenti?"
	done

SchoolboyJack1SeenText:
	text "Il mondo dei #-"
	line "MON è immenso."

	para "C'è ancora così"
	line "tanto da scoprire."

	para "Ma io ne so senz'"
	line "altro più di te!"
	done

SchoolboyJack1BeatenText:
	text "C-c-cosa?"
	done

UnknownText_0x5c4f3:
	text "C'è molto da"
	line "imparare."

	para "Per esempio…"

	para "Sai che ci sono 50"
	line "tipi di MT?"

	para "E i #MON"
	line "scambiati sono"
	para "più rapidi ad"
	line "evolversi."
	done

PokefanfBeverly1SeenText:
	text "I miei #MON"
	line "sono così carini."

	para "Lascia che ti dica"
	line "quanto mi"
	cont "inorgogliscono."
	done

PokefanfBeverly1BeatenText:
	text "Posso batterti in"
	line "orgoglio, ma…"
	done

UnknownText_0x5c5bd:
	text "Devo dirlo, anche"
	line "i tuoi sono"
	cont "molto carini."
	done

PokefanmWilliamSeenText:
	text "Noi amiamo i #-"
	line "MON anche se ci"
	cont "disprezzano."

	para "Altrimenti che"
	line "FAN saremmo?"
	done

PokefanmWilliamBeatenText:
	text "I miei #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "I miei #MON"
	line "non saranno i più"

	para "forti, ma sono i"
	line "più amabili."
	done

UnknownText_0x5c68a:
	text "Un mio amico ha un"
	line "MARILL. Che"

	para "carino! Anch'io"
	line "lo vorrei."
	done

LassKriseSeenText:
	text "Ehi? Perché mi"
	line "guardi così?"

	para "Ah, vuoi lottare!"
	done

LassKriseBeatenText:
	text "… Uff…"
	done

LassKriseAfterBattleText:
	text "Per come mi guar-"
	line "davi, pensavo di"
	cont "piacerti."
	done

NationalParkRelaxationSquareText:
	text "PIAZZA TRANQUILLA"
	line "PARCO NAZIONALE"
	done

NationalParkBattleNoticeText:
	text "Che c'è scritto"
	line "nell'avviso?"

	para "Si prega di"
	line "lottare soltanto"
	cont "nell'erba."

	para "PARCO NAZIONALE"
	line "UFFICIO GUARDIANO"
	done

NationalParkTrainerTipsText:
	text "CONSIGLI UTILI"

	para "#MON differenti"
	line "appaiono a diverse"
	para "ore del giorno."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 32, 31, STAND_CITY_NATIONAL_PARK_GATE, 1
	warp_event 33, 31, STAND_CITY_NATIONAL_PARK_GATE, 2
	warp_event  6, 53, ROUTE_103_NATIONAL_PARK_GATE, 1
	warp_event  7, 53, ROUTE_103_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8, 48, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 12, 24, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event 24, 53, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 34, 38, BGEVENT_READ, NationalParkTrainerTipsSign

	db 12 ; object events
	object_event 14, 33, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 16,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event  5, 39, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event  7, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event  6, 48, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 39, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event  4, 39, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
;	object_event 35, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	;object_event 20, 18, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassKrise, -1
	object_event 36,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 30,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 35, 47, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
