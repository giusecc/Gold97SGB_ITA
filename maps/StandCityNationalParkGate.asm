	object_const_def ; object_event constants
	const STANDCITYNATIONALPARKGATE_OFFICER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER2
	const STANDCITYNATIONALPARKGATE_ROCKER
	const STANDCITYNATIONALPARKGATE_POKEFAN_M
	const STANDCITYNATIONALPARKGATE_YOUNGSTER3
	const STANDCITYNATIONALPARKGATE_YOUNGSTER4
	const STANDCITYNATIONALPARKGATE_LASS
	const STANDCITYNATIONALPARKGATE_YOUNGSTER5
	const STANDCITYNATIONALPARKGATE_YOUNGSTER6
	const STANDCITYNATIONALPARKGATE_YOUNGSTER7
	const STANDCITYNATIONALPARKGATE_OFFICER2

StandCityNationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_STANDCITYNATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	priorityjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear STANDCITYNATIONALPARKGATE_OFFICER1
	disappear STANDCITYNATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar 1
	vartomem MEM_BUFFER_0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special FadeInQuickly
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear STANDCITYNATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear STANDCITYNATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear STANDCITYNATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route102OfficerScriptContest:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	scall Route102ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, DOWN
	applymovement PLAYER, ExitBuildingMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route102Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem HEART_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

StandCityNationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route102ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route103NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

ExitBuildingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6add1:
	big_step UP
	big_step UP
;	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Oggi è @"
	text_ram wStringBuffer3
	text "."
	line "Ciò significa che"

	para "oggi c'è la Gara"
	line "Pigliamosche!"

	para "Le regole?"
	line "Semplicissime."

	para "Usando uno dei"
	line "tuoi #MON,"

	para "cattura un #MON"
	line "COLEOTTERO che"
	cont "sarà giudicato."

	para "Vuoi provare?"
	done

UnknownText_0x6ae87:
	text "Ecco qui le PARK"
	line "BALL per la"
	cont "Gara."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> riceve"
	line "20 PARK BALL."
	done

UnknownText_0x6aecc:
	text "Vince chi cattura"
	line "il #MON"
	cont "COLEOTTERO più"
	cont "forte."

	para "Hai 20 minuti di"
	line "tempo."

	para "Se finisci le"
	line "PARK BALL, termina"
	cont "anche la gara."

	para "Potrai tenere"
	line "l'ultimo #MON"
	cont "che catturerai."

	para "Vai, e cerca di"
	line "prendere il #-"

	para "MON COLEOTTERO"
	line "più forte!"
	done

UnknownText_0x6afb0:
	text "Ah…"

	para "Vedo che hai più"
	line "di un #MON."

	para "Dovrai usare"
	line "@"
	text_ram wStringBuffer3
	text ", il"

	para "primo #MON"
	line "in squadra."

	para "Ti va bene?"
	done

UnknownText_0x6b021:
	text "Ti terremo noi gli"
	line "altri #MON"
	cont "durante la gara."
	done

UnknownText_0x6b055:
	text "I #MON di"
	line "<PLAYER> sono stati"
	para "lasciati con"
	line "l'ASSISTENTE GARA."
	done

UnknownText_0x6b081:
	text "Scegli il #MON"
	line "che vuoi usare per"

	para "la Gara, e poi"
	line "ritorna qui."
	done

UnknownText_0x6b0c6:
	text "Come vuoi. Sarà"
	line "per la prossima"
	cont "volta."
	done

UnknownText_0x6b0f2:
	text "Oh…"
	line "Il primo #MON"

	para "della tua squadra"
	line "non può lottare."

	para "Scambialo di posto"
	line "con il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

UnknownText_0x6b166:
	text "Oh…"
	line "Sia la tua squadra"

	para "che il BOX del tuo"
	line "PC sono pieni."

	para "Non hai spazio per"
	line "il #MON che"
	cont "catturerai."

	para "Fai spazio nella"
	line "tua squadra o nel"

	para "BOX del PC e poi"
	line "torna a trovarmi!"
	done

UnknownText_0x6b209:
	text "Oh…"
	line "Il tuo primo"

	para "#MON è un"
	line "UOVO."

	para "Sostituiscilo con"
	line "il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

UnknownText_0x6b284:
	text "Hai ancora @"
	text_ram wStringBuffer3
	text_start
	line "minuti(o)."

	para "Vuoi terminare"
	line "ora?"
	done

UnknownText_0x6b2c5:
	text "Come vuoi. Attendi"
	line "l'annuncio dei"

	para "vincitori all'"
	line "Ingresso Nord."
	done

UnknownText_0x6b300:
	text "Bene, allora torna"
	line "fuori e concludi"
	cont "la Gara."
	done

UnknownText_0x6b32b:
	text "La Gara di oggi è"
	line "terminata. Spero"

	para "che parteciperai"
	line "in futuro."
	done

UnknownText_0x6b370:
	text "Alcuni #MON si"
	line "trovano solo"
	cont "nel PARCO."
	done

BugCatchingContestant1BText:
	text "DIN: Uauh, mi hai"
	line "battuto: non sei"
	cont "niente male!"
	done

BugCatchingContestant1BStillCompetingText:
	text "DIN: È anche una"
	line "questione di"
	cont "fortuna."

	para "Non si sa mai"
	line "quale #MON"
	cont "potrà comparire."
	done

BugCatchingContestant2BText:
	text "ED: Ti invidio."
	line "Questa volta non"
	para "avrei potuto"
	line "farcela."
	done

BugCatchingContestant2BStillCompetingText:
	text "ED: Puoi vincere"
	line "con grandi"
	cont "#MON?"
	done

BugCatchingContestant3BText:
	text "NICO: Ben fatto!"
	line "Allenerò meglio"
	cont "i miei #MON."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICO: Potresti"
	line "avere un punteggio"
	para "più alto per un"
	line "#MON"

	para "di un colore"
	line "inusuale."
	done

BugCatchingContestant4BText:
	text "WILLIAM: Sei tu"
	line "il vincitore? Chi"
	cont "hai catturato?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILLIAM: Bene,"
	line "sono soddisfatto:"

	para "ho il #MON"
	line "che volevo."
	done

BugCatchingContestant5BText:
	text "MIK: Bravo, hai"
	line "guadagnato tutto"
	cont "il mio rispetto!"
	done

BugCatchingContestant5BStillCompetingText:
	text "MIK: Ho già"
	line "catturato uno"
	para "SCYTHER,"
	line "ma non ho vinto."
	done

BugCatchingContestant6BText:
	text "PA: Il #MON"
	line "che hai"
	para "catturato è…"
	line "formidabile!"
	done

BugCatchingContestant6BStillCompetingText:
	text "PA: Vincere è"
	line "più facile se"

	para "catturi un"
	line "#MON."
	para "COLEOTTERO"
	line "di livello alto."

	para "Ma credo che valu-"
	line "tino anche altri"
	cont "fattori."
	done

BugCatchingContestant7BText:
	text "ZOE: Hai vinto?"
	line "Grande!"

	para "Verresti a cercare"
	line "#MON di"
	para "tipo COLEOTTERO"
	line "con me?"
	done

BugCatchingContestant7BStillCompetingText:
	text "ZOE: I #MON"
	line "COLEOTTERO sono"
	cont "la mia passione!"
	done

BugCatchingContestant8BText:
	text "JOI: Io… Non"
	line "posso credere di"
	cont "aver perso…"
	done

BugCatchingContestant8BStillCompetingText:
	text "JOI: Mi han detto"
	line "che qualcuno ha"
	para "vinto con un"
	line "CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUELE: Vedrai la"
	line "prossima volta!"
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUELE: Uffa."
	line "Pensavo di andare"
	cont "meglio…"
	done

BugCatchingContestant10BText:
	text "PIPPO: Mi dai"
	line "qualche aiuto?"

	para "Voglio studiare"
	line "il tuo stile!"
	done

BugCatchingContestant10BStillCompetingText:
	text "PIPPO: Studio"
	line "molto, ma non"

	para "abbastanza"
	line "per vincere."
	done

UnusedBipetalText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Bipetal.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "Dicono che ci sia"
	line "un #MON che"
	cont "sembra un albero."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route103NationalParkGate.asm
	text "Le Gare"
	line "Pigliamosche si"

	para "svolgono martedì,"
	line "giovedì e sabato."

	para "Non solo vinci un"
	line "premio per aver"

	para "partecipato, ma"
	line "puoi anche tenere"

	para "un #MON"
	line "COLEOTTERO che hai"
	cont "catturato."
	done

UnknownText_0x6b910:
	text "Oh…  Non hai più"
	line "spazio nello"
	cont "ZAINO!"

	para "Ti mettiamo il"
	line "premio da parte,"
	cont "ma solo per oggi."

	para "Libera spazio,"
	line "e poi torna qui."
	done

UnknownText_0x6b97f:
	text "<PLAYER>?"

	para "Ecco il premio che"
	line "ti abbiamo tenuto!"
	done

StandCityNationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, NATIONAL_PARK, 1
	warp_event  1,  7, NATIONAL_PARK, 2
	warp_event  8,  7, STAND_CITY, 10
	warp_event  9,  7, STAND_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102OfficerScriptContest, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityNationalParkGateOfficerScript, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
