	object_const_def ; object_event constants
	const ROUTE103NATIONALPARKGATE_OFFICER1
	const ROUTE103NATIONALPARKGATE_YOUNGSTER
	const ROUTE103NATIONALPARKGATE_OFFICER2

Route103NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE103NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE103NATIONALPARKGATE_OFFICER1
	appear ROUTE103NATIONALPARKGATE_YOUNGSTER
	appear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE103NATIONALPARKGATE_OFFICER1
	disappear ROUTE103NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route103NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE103NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route103NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route103NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route103NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route103NationalParkGate_NoContestToday
	ifequal MONDAY, Route103NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route103NationalParkGate_NoContestToday
	ifequal FRIDAY, Route103NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	scall Route103NationalParkGate_GetDayOfWeek
	writetext Route103NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route103NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route103NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route103NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route103NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route103NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route103NationalParkGate_FacingLeft
	applymovement PLAYER, Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route103NationalParkGate_FacingLeft:
	applymovement PLAYER, Route103NationalParkGatePlayerEnterParkMovement
	end

Route103NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route103NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route103NationalParkGate_NoRoomInBox

Route103NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route103NationalParkGate_FirstMonIsEgg
	writetext Route103NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route103NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route103NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route103NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route103NationalParkGate_OkayToProceed

Route103NationalParkGate_DeclinedToParticipate:
	writetext Route103NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route103NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route103NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsFainted:
	writetext Route103NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoRoomInBox:
	writetext Route103NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsEgg:
	writetext Route103NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route103NationalParkGate_ContestIsOver:
	writetext Route103NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoContestToday:
	jumptextfaceplayer Route103NationalParkGateOfficer1WeHoldContestsText

Route103NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	writetext Route103NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route103NationalParkGateYoungsterScript:
	jumptextfaceplayer Route103NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route103NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route103NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route103NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route103NationalParkGateOfficer1AskToParticipateText:
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

Route103NationalParkGateOfficer1GiveParkBallsText:
	text "Ecco qui le PARK"
	line "BALL per la"
	cont "Gara."
	done

Route103NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> riceve"
	line "20 PARK BALL."
	done

Route103NationalParkGateOfficer1ExplainsRulesText:
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

Route103NationalParkGateOfficer1AskToUseFirstMonText:
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

Route103NationalParkGateOfficer1WellHoldYourMonText:
	text "Ti terremo noi gli"
	line "altri #MON"
	cont "durante la gara."
	done

Route103NationalParkGatePlayersMonLeftWithHelperText:
	text "I #MON di"
	line "<PLAYER> sono stati"
	para "lasciati con"
	line "l'ASSISTENTE GARA."
	done

Route103NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Scegli il #MON"
	line "che vuoi usare per"

	para "la Gara, e poi"
	line "ritorna qui."
	done

Route103NationalParkGateOfficer1TakePartInFutureText:
	text "Come vuoi. Sarà"
	line "per la prossima"
	cont "volta."
	done

Route103NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh…"
	line "Il primo #MON"

	para "della tua squadra"
	line "non può lottare."

	para "Scambialo di posto"
	line "con il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route103NationalParkGateOfficer1MakeRoomText:
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

Route103NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh…"
	line "Il tuo primo"

	para "#MON è un"
	line "UOVO."

	para "Sostituiscilo con"
	line "il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route103NationalParkGateOfficer1WantToFinishText:
	text "Hai ancora @"
	text_ram wStringBuffer3
	text_start
	line "minuti(o)."

	para "Vuoi terminare"
	line "ora?"
	done

Route103NationalParkGateOfficer1WaitAtNorthGateText:
	text "Come vuoi. Attendi"
	line "l'annuncio dei"

	para "vincitori all'"
	line "Ingresso Nord."
	done

Route103NationalParkGateOfficer1OkGoFinishText:
	text "Bene, allora torna"
	line "fuori e concludi"
	cont "la Gara."
	done

Route103NationalParkGateOfficer1ContestIsOverText:
	text "La Gara di oggi è"
	line "terminata. Spero"

	para "che parteciperai"
	line "in futuro."
	done

Route103NationalParkGateOfficer1WeHoldContestsText:
	text "In determinati"
	line "giorni si svolgono"

	para "delle Gare al"
	line "PARCO. Dovresti"
	cont "partecipare!"
	done

Route103NationalParkGateYoungsterText:
	text "Quando ci sarà la"
	line "prossima Gara"
	cont "Pigliamosche?"
	done

BugCatchingContestExplanationText:
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

Route103NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_103, 3
	warp_event  4,  7, ROUTE_103, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103OfficerScriptContest, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateYoungsterScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateOfficerScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
