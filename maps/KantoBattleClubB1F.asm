;It seems like the branching scripts for whether you win or lose are backwards. Apparently this is
;also the case for ones that were in the final game, like rival 1 in crown city. But it's not
;apparent there because the text is the same in either case
	object_const_def ; object_event constants
	const BATTLECLUB_SUNDAY_FLEDGLING
	const BATTLECLUB_MONDAY_YOUNGSTER
	const BATTLECLUB_TUESDAY_LASS
	const BATTLECLUB_WEDNESDAY_SPORTSMAN
	const BATTLECLUB_THURSDAY_INSTRUCTOR
	const BATTLECLUB_FRIDAY_COOLTRAINERF
	const BATTLECLUB_SATURDAY_COOLTRAINERM
	const BATTLECLUB_RECEPTIONIST
	const BATTLECLUB_POKEFANM
	const BATTLECLUB_JANINE
	const BATTLECLUB_YOUNGSTER
	const BATTLECLUB_GENTLEMAN
	const BATTLECLUB_LASS
	const BATTLECLUB_YOUNGSTER2
	const BATTLECLUB_GRANNY


KantoBattleClubB1F_MapScripts:
	db 0 ; scene scripts

	db 0  ; callbacks
	
BattleClubScriptSun:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SundayBattleContinue
	jump BattleClubOver
	end

.SundayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSunday
	writetext SundayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSunday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SUNDAY_FLEDGLING, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SundayLeftWalk
	ifequal RIGHT, .SundayRightWalk
	ifequal UP, .SundayUpWalk
	ifequal DOWN, .SundayDownWalk

.SundayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SundayBattleContinue2
	end
	
.SundayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SundayBattleContinue2
	end
	
.SundayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SundayBattleContinue2
	end
	
.SundayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SundayBattleContinue2
	end
	
.NoBattleNowSunday
	writetext NoBattleNowSundayText
	waitbutton
	closetext
	end
	
.SundayBattleContinue2
	winlosstext SundayWinText, SundayLossText
	loadtrainer FLEDGLING, EARNEST
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSunday
	jump .AfterYourDefeatSunday
	end
	
.AfterVictoriousSunday
	opentext
	writetext SundayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSunday
	opentext
	writetext SundayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSunday
	jump BattleClubOver
	end
	
BattleClubScriptMon:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBattleContinue
	jump BattleClubOver
	end

.MondayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledMonday
	writetext MondayTrainerGreeting
	yesorno
	iffalse .NoBattleNowMonday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_MONDAY_YOUNGSTER, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .MondayLeftWalk
	ifequal RIGHT, .MondayRightWalk
	ifequal UP, .MondayUpWalk
	ifequal DOWN, .MondayDownWalk

.MondayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .MondayBattleContinue2
	end
	
.MondayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .MondayBattleContinue2
	end
	
.MondayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .MondayBattleContinue2
	end
	
.MondayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .MondayBattleContinue2
	end
	
.NoBattleNowMonday
	writetext NoBattleNowMondayText
	waitbutton
	closetext
	end
	
.MondayBattleContinue2
	winlosstext MondayWinText, MondayLossText
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousMonday
	jump .AfterYourDefeatMonday
	end
	
.AfterVictoriousMonday
	opentext
	writetext MondayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatMonday
	opentext
	writetext MondayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledMonday
	jump BattleClubOver
	end
	
BattleClubScriptTues:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .TuesdayBattleContinue
	jump BattleClubOver
	end

.TuesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledTuesday
	writetext TuesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowTuesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_TUESDAY_LASS, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .TuesdayLeftWalk
	ifequal RIGHT, .TuesdayRightWalk
	ifequal UP, .TuesdayUpWalk
	ifequal DOWN, .TuesdayDownWalk

.TuesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .TuesdayBattleContinue2
	end
	
.TuesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .TuesdayBattleContinue2
	end
	
.TuesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .TuesdayBattleContinue2
	end
	
.TuesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .TuesdayBattleContinue2
	end
	
.NoBattleNowTuesday
	writetext NoBattleNowTuesdayText
	waitbutton
	closetext
	end
	
.TuesdayBattleContinue2
	winlosstext TuesdayWinText, TuesdayLossText
	loadtrainer LASS, MICHELLE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousTuesday
	jump .AfterYourDefeatTuesday
	end
	
.AfterVictoriousTuesday
	opentext
	writetext TuesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatTuesday
	opentext
	writetext TuesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledTuesday
	jump BattleClubOver
	end

	
BattleClubScriptWed:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdayBattleContinue
	jump BattleClubOver
	end

.WednesdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledWednesday
	writetext WednesdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowWednesday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_WEDNESDAY_SPORTSMAN, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .WednesdayLeftWalk
	ifequal RIGHT, .WednesdayRightWalk
	ifequal UP, .WednesdayUpWalk
	ifequal DOWN, .WednesdayDownWalk

.WednesdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .WednesdayBattleContinue2
	end
	
.WednesdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .WednesdayBattleContinue2
	end
	
.WednesdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .WednesdayBattleContinue2
	end
	
.WednesdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .WednesdayBattleContinue2
	end
	
.NoBattleNowWednesday
	writetext NoBattleNowWednesdayText
	waitbutton
	closetext
	end
	
.WednesdayBattleContinue2
	winlosstext WednesdayWinText, WednesdayLossText
	loadtrainer SPORTSMAN, MANNY
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousWednesday
	jump .AfterYourDefeatWednesday
	end
	
.AfterVictoriousWednesday
	opentext
	writetext WednesdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatWednesday
	opentext
	writetext WednesdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledWednesday
	jump BattleClubOver
	end

BattleClubScriptThurs:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ThursdayBattleContinue
	jump BattleClubOver
	end

.ThursdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledThursday
	writetext ThursdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowThursday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_THURSDAY_INSTRUCTOR, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .ThursdayLeftWalk
	ifequal RIGHT, .ThursdayRightWalk
	ifequal UP, .ThursdayUpWalk
	ifequal DOWN, .ThursdayDownWalk

.ThursdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .ThursdayBattleContinue2
	end
	
.ThursdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .ThursdayBattleContinue2
	end
	
.ThursdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .ThursdayBattleContinue2
	end
	
.ThursdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .ThursdayBattleContinue2
	end
	
.NoBattleNowThursday
	writetext NoBattleNowThursdayText
	waitbutton
	closetext
	end
	
.ThursdayBattleContinue2
	winlosstext ThursdayWinText, ThursdayLossText
	loadtrainer INSTRUCTOR, MORGAN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousThursday
	jump .AfterYourDefeatThursday
	end
	
.AfterVictoriousThursday
	opentext
	writetext ThursdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatThursday
	opentext
	writetext ThursdayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledThursday
	jump BattleClubOver
	end


BattleClubScriptFri:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FridayBattleContinue
	jump BattleClubOver
	end

.FridayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledFriday
	writetext FridayTrainerGreeting
	yesorno
	iffalse .NoBattleNowFriday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_FRIDAY_COOLTRAINERF, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .FridayLeftWalk
	ifequal RIGHT, .FridayRightWalk
	ifequal UP, .FridayUpWalk
	ifequal DOWN, .FridayDownWalk

.FridayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .FridayBattleContinue2
	end
	
.FridayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .FridayBattleContinue2
	end
	
.FridayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .FridayBattleContinue2
	end
	
.FridayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .FridayBattleContinue2
	end
	
.NoBattleNowFriday
	writetext NoBattleNowFridayText
	waitbutton
	closetext
	end
	
.FridayBattleContinue2
	winlosstext FridayWinText, FridayLossText
	loadtrainer COOLTRAINERF, KATE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousFriday
	jump .AfterYourDefeatFriday
	end
	
.AfterVictoriousFriday
	opentext
	writetext FridayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatFriday
	opentext
	writetext FridayAfterYourDefeatText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledFriday
	jump BattleClubOver
	end
	

BattleClubScriptSat:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .SaturdayBattleContinue
	jump BattleClubOver
	end

.SaturdayBattleContinue
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .AlreadyBattledSaturday
	writetext SaturdayTrainerGreeting
	yesorno
	iffalse .NoBattleNowSaturday
	writetext TrainerAcceptsChallenge
	waitbutton
	closetext
	turnobject BATTLECLUB_SATURDAY_COOLTRAINERM, LEFT
	checkcode VAR_FACING
	ifequal LEFT, .SaturdayLeftWalk
	ifequal RIGHT, .SaturdayRightWalk
	ifequal UP, .SaturdayUpWalk
	ifequal DOWN, .SaturdayDownWalk

.SaturdayLeftWalk
	applymovement PLAYER, PlayerWalksToOtherSideLeft
	jump .SaturdayBattleContinue2
	end
	
.SaturdayRightWalk
	applymovement PLAYER, PlayerWalksToOtherSideRight
	jump .SaturdayBattleContinue2
	end
	
.SaturdayUpWalk
	applymovement PLAYER, PlayerWalksToOtherSideUp
	jump .SaturdayBattleContinue2
	end
	
.SaturdayDownWalk
	applymovement PLAYER, PlayerWalksToOtherSideDown
	jump .SaturdayBattleContinue2
	end
	
.NoBattleNowSaturday
	writetext NoBattleNowSaturdayText
	waitbutton
	closetext
	end
	
.SaturdayBattleContinue2
	winlosstext SaturdayWinText, SaturdayLossText
	loadtrainer COOLTRAINERM, ALLEN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictoriousSaturday
	jump .AfterYourDefeatSaturday
	end
	
.AfterVictoriousSaturday
	opentext
	writetext SaturdayAfterVictoriousText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AfterYourDefeatSaturday
	opentext
	writetext SaturdayAfterYourDefeatText
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_ALLEN
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	special HealParty
	playmapmusic
	end
	
.AlreadyBattledSaturday
	jump BattleClubOver
	end

BattleClubOver:
	writetext TrainerClubDone
	waitbutton
	closetext
	end
	
BattleClubReceptionistScript:
	jumptextfaceplayer BattleClubReceptionistText
	
BattleClubPokefanMScript:
	jumptextfaceplayer BattleClubPokefanMText

BattleClubJanineScript:
	jumptextfaceplayer BattleClubJanineText
	
BattleClubYoungsterScript:
	checkevent EVENT_BEAT_COOLTRAINERM_ALLEN
	iftrue .WowYouBeatAllen
	faceplayer
	opentext
	writetext BattleClubYoungsterText
	waitbutton
	closetext
	end

.WowYouBeatAllen
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_22
	iftrue .AlreadyGotTogepi
	writetext IHaveAWeirdEggText
	yesorno
	iffalse .DontTakeTogepi
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullTogepi
	writetext PlayerGotTogepiText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOGEPI, 5
	writetext GiveTogepiText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_22
	end
	
.AlreadyGotTogepi
	writetext BattleClubYoungsterTextBeat
	waitbutton
	closetext
	end
	
.DontTakeTogepi
	writetext NoTogepiText
	waitbutton
	closetext
	end
	
.PartyFullTogepi
	writetext PartyFullTogepiText
	waitbutton
	closetext
	end


BattleClubGentlemanScript:
	jumptextfaceplayer BattleClubGentlemanText
	
	
BattleClubLassScript:
	jumptextfaceplayer BattleClubLassText
	
BattleClubYoungster2Script:
	jumptextfaceplayer BattleClubYoungster2Text
	
BattleClubGrannyScript:
	jumptextfaceplayer BattleClubGrannyText
	
PlayerWalksToOtherSideLeft:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideRight:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideUp:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head RIGHT
	step_end
	
PlayerWalksToOtherSideDown:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
PartyFullTogepiText:
	text "Oh, aspetta!"
	para "Devi avere più"
	line "spazio!"
	done
	
NoTogepiText:
	text "Sicuro?"
	para "Credevo ti sarebbe"
	line "piaciuto."
	done
	
GiveTogepiText:
	text "Sono sicuro che tu"
	line "sia la persona"
	para "migliore per"
	line "tenerlo!"
	done
	
IHaveAWeirdEggText:
	text "Ehi! Hai battuto"
	line "quel FANTALLEN."
	cont "fortissimo!"
	para "Incredibile!"
	para "Senti, ho questo"
	line "strano UOVO"
	cont "#MON."
	para "Si è schiuso"
	line "ieri, ma sembra"
	para "ancora un UOVO!"
	para "È un #MON"
	line "molto strano."
	para "Credo che un"
	line "allenatore esperto"
	para "come te sia adatto"
	line "per prendersene"
	cont "cura."
	para "Lo vuoi?"
	done
	
PlayerGotTogepiText:
	text "<PLAYER> riceve"
	line "TOGEPI."
	done
	
BattleClubYoungsterTextBeat:
	text "Hai battuto dav-"
	line "vero quel tipo?"
	para "Assurdo!"
	done
	
	
BattleClubGrannyText:
	text "In passato ero un"
	line "grande allenatore."
	para "Ora non lotto più"
	line "come prima."
	para "Ma è sempre bello"
	line "venire qui e"
	para "vedere i giovani"
	line "d'oggi darsi"
	cont "battaglia."
	done
	
BattleClubYoungster2Text:
	text "Faccio il tifo per"
	line "il mio fratellino."
	para "È un principiante."
	para "Forse con dei"
	line "#MON più"
	para "deboli potresti"
	line "sfidarlo."
	done
	
BattleClubLassText:
	text "In questo posto"
	line "ci sono allenatori"
	para "diversi ogni"
	line "giorno della"
	cont "settimana."
	para "Gli allenatori più"
	line "forti arrivano"
	cont "a fine settimana."
	done
	
BattleClubRockerText:
	text "Sono stanco di"
	line "tutte queste"
	cont "lotte."
	para "Se vuoi una sfida"
	line "ora, credo che"
	para "ci sia uno"
	line "SPORTIVO laggiù."
	done
	
BattleClubGentlemanText:
	text "Questo posto è"
	line "fantastico per"
	para "gli allenatori che"
	line "non vogliono"
	para "viaggiare, ma"
	line "vogliono ancora"
	para "sfidarsi."
	done
	
BattleClubYoungsterText:
	text "L'altro giorno"
	line "c'era un"
	cont "FANTALLEN."
	para "I suoi #MON"
	line "erano incredibili!"
	para "Non ho avuto"
	line "possibilità."
	para "Credo che venga"
	line "di sabato."
	para "Pensi di batterlo?"
	done
	
BattleClubJanineText:
	text "Alcuni allenatori"
	line "qui sono troppo"
	cont "forti!"
	para "Devo migliorare!"
	done
	
BattleClubPokefanMText:
	text "A tutti piace una"
	line "bella lotta!"
	para "A volte è bello"
	line "anche guardare!"
	done
	
BattleClubReceptionistText:
	text "Benvenuto al"
	line "KANTO BATTLE CLUB."
	para "Qui ci sono"
	line "allenatori di"
	cont "tutti i livelli."
	para "Ci sono alcuni"
	line "allenatori molto"
	cont "forti."
	para "Non avere paura"
	line "di sfidarli!"
	done
	
NoBattleNowSundayText:
	text "Oh, no!"
	para "Forse un'altra"
	line "volta."
	done
	
SundayAfterYourDefeatText:; backwards
	text "Non sono così"
	line "forte, ma ci sto"
	cont "provando!"
	done
	
SundayAfterVictoriousText:; backwards
	text "Il mio #MON"
	line "si rafforza ogni"
	cont "giorno!"
	done
	
SundayWinText:
	text "Ehi! Sei forte!"
	done
	
SundayLossText:
	text "Ho vinto!"
	done

	
SundayTrainerGreeting:
	text "Ehi! Sono un"
	line "novellino per le"
	cont "battaglie!"
	para "Ma il mio sogno"
	line "è di diventare un"
	cont "grande allenatore!"
	para "I miei #MON"
	line "sono intorno al"
	cont "livello 10."
	para "Vuoi lottare?"
	done
	
NoBattleNowMondayText:
	text "Sarò qui se"
	line "cambi idea!"
	done

MondayAfterYourDefeatText:; backwards
	text "Sembra che abbia"
	line "bisogno di più"
	cont "allenamento"
	done
	
MondayAfterVictoriousText:; backwards
	text "L'allenamento"
	line "paga!"
	done
	
MondayWinText:
	text "Sei bravo!"
	done
	
MondayLossText:
	text "Oh sì!"
	done
	
MondayTrainerGreeting:
	text "Vuoi lottare?"
	para "Sto diventando"
	line "più forte, credo."
	para "Uso #MON"
	line "intorno al"
	cont "livello 20."
	para "Vuoi lottare?"
	done
	
NoBattleNowTuesdayText:
	text "Sono troppo"
	line "buono, eh?"
	done
	
TuesdayAfterYourDefeatText:; backwards
	text "Sei tu quello"
	line "forte qui!"
	done
	
TuesdayAfterVictoriousText:; backwards
	text "Sto diventando"
	line "bravo!"
	done
	
TuesdayWinText:
	text "Ecco!"
	done
	
TuesdayLossText:
	text "Assurdo!"
	done

	
TuesdayTrainerGreeting:
	text "Ciao!"
	para "Voglio lottare!"
	line "Mi sento forte!"
	para "I miei #MON"
	line "sono intorno al"
	cont "livello 30."
	para "Credi di farcela?"
	done
	
	
NoBattleNowWednesdayText:
	text "Va bene!"
	para "Starò qui per"
	line "un po'."
	done
	
WednesdayAfterYourDefeatText:; backwards
	text "Sembra che anche"
	line "tu sia forte!"
	done
	
WednesdayAfterVictoriousText:; backwards
	text "I miei #MON"
	line "sono sempre pronti"
	cont "a lottare!"
	done
	
WednesdayWinText:
	text "Ehi! Bella lotta!"
	done
	
WednesdayLossText:
	text "Che lotta!"
	done

WednesdayTrainerGreeting:
	text "Ehi! Sono qui"
	line "dopo una corsa"
	para "con i #MON!"
	para "Sono bravo a"
	line "lottare."
	para "I miei #MON"
	line "sono intorno al"
	cont "livello 40."
	para "Vuoi sfidarmi?"
	done
	
	
NoBattleNowThursdayText:
	text "Va bene, allora."
	done
	
ThursdayAfterYourDefeatText:; backwards
	text "Bella sfida."
	done
	
ThursdayAfterVictoriousText:; backwards
	text "I miei #MON"
	line "sono forti."
	done
	
ThursdayWinText:
	text "Fantastico."
	done
	
ThursdayLossText:
	text "Ah, vittoria."
	done

	
ThursdayTrainerGreeting:
	text "Salve."
	para "Mi alleno nella"
	line "lotta."
	para "La mia squadra è"
	line "intorno al"
	cont "livello 50."
	para "Vuoi lottare?"
	done
	

NoBattleNowFridayText:
	text "Va bene, molti"
	line "non vogliono."
	done
	
FridayAfterYourDefeatText:; backwards
	text "Oh, ho perso!"
	done
	
FridayAfterVictoriousText:; backwards
	text "Un'altra vittoria"
	line "per me!"
	done
	
FridayWinText:
	text "Che shock!"
	done
	
FridayLossText:
	text "Ben fatto!"
	done

	
FridayTrainerGreeting:
	text "Oh, ciao!"
	para "Non vorrei"
	line "vantarmi, ma sono"
	cont "abbastanza forte."
	para "I miei #MON"
	line "sono intorno al"
	cont "livello 60."
	para "Credi di potercela"
	line "fare?"
	done
	

NoBattleNowSaturdayText:
	text "Un giorno potresti"
	line "essere abbastanza"
	para "forte da"
	line "sfidarmi."
	done
	
SaturdayAfterYourDefeatText:; backwards
	text "Sei uno dei pochi"
	line "che è riuscito a"
	cont "battermi."
	para "Ben fatto."
	done
	
SaturdayAfterVictoriousText:; backwards
	text "Questo era il"
	line "giusto esito."
	done
	
SaturdayWinText:
	text "Incredibile!"
	done
	
SaturdayLossText:
	text "Ancora una volta,"
	line "vittoria!"
	done

	
;SaturdayTrainerGreeting:
;	text "Hi I'm strong."
;	line "My #MON is at"
;	cont "level 70."
;	para "I am the bestest +"
;	para "Shall we battle?"
;	done

SaturdayTrainerGreeting:
	text "È difficile"
	line "trovare allenatori"
	para "del mio livello."
	para "I miei #MON"
	line "sono intorno al"
	cont "livello 60."
	para "Dimmi, credi"
	line "di potermi"
	para "sfidare?"
	done
	
	
TrainerAcceptsChallenge:
	text "Ok!"
	para "Mettiti al lato"
	line "opposto e"
	cont "lottiamo!"
	done
	
TrainerClubDone:
	text "Phew!"
	para "Niente più lotte"
	line "oggi."
	para "Torna domani e"
	line "sfida qualcuno!"
	done
	

KantoBattleClubB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, KANTO_BATTLE_CLUB_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSun, EVENT_SWITCH_1
	object_event 14, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptMon, EVENT_SWITCH_2
	object_event 16,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptTues, EVENT_SWITCH_3
	object_event 16,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptWed, EVENT_SWITCH_4
	object_event  6, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptThurs, EVENT_SWITCH_5
	object_event 14, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptFri, EVENT_SWITCH_6
	object_event  6, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubScriptSat, EVENT_SWITCH_7
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubReceptionistScript, -1
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubPokefanMScript, -1
	object_event  3, 15, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubJanineScript, -1
	object_event  9,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungsterScript, EVENT_SWITCH_2
	object_event 13, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubGentlemanScript, EVENT_SWITCH_3
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubLassScript, EVENT_SWITCH_5
	object_event  3, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubYoungster2Script, EVENT_SWITCH_1
	object_event 13,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleClubGrannyScript, EVENT_SWITCH_6
