	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_BLACK_BELT2
	const FIGHTINGDOJO_BLACK_BELT3
	const FIGHTINGDOJO_BLACK_BELT4
	const FIGHTINGDOJO_BLACK_BELT5

FightingDojo_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

;FightingDojoBlackBelt:
;	jumptextfaceplayer FightingDojoBlackBeltText

FightingDojoBlackBelt:
	faceplayer
	checkevent EVENT_BEAT_BLACKBELT_YOSHI
	iftrue .CheckNext1
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext1
	checkevent EVENT_BEAT_BLACKBELT_LAO
	iftrue .CheckNext2
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext2
	checkevent EVENT_BEAT_BLACKBELT_NOB
	iftrue .CheckNext3
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.CheckNext3
	checkevent EVENT_BEAT_BLACKBELT_LUNG
	iftrue .BeatAllBlackbelts
	faceplayer
	opentext
	writetext Text_GoBeatBlackbelts
	waitbutton
	closetext
	end
	
.BeatAllBlackbelts
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogueDojo
	opentext
	writetext Text_BeatEm
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoomTyrogue
	writetext UnknownText_0x7e3551
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	writetext Text_FocusBandDescription
	waitbutton
	closetext
	end

.GotTyrogueDojo:
	opentext
	writetext Text_GoodJob
	waitbutton
	closetext
	end
.NoRoomTyrogue:
	writetext UnknownText_0x7e3df1
	waitbutton
	closetext
	end


FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND
TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end
	
UnknownText_0x7e3551:
	text "<PLAYER> riceve"
	line "TYROGUE."
	done
	
UnknownText_0x7e3df1:
	text "Non c'è posto"
	line "nella tua squadra."
	done
	
Text_FocusBandDescription:
	text "TYROGUE si può"
	line "evolvere in tre"
	para "#MON differenti!"
	para "Un allenatore come"
	line "te non avrà"
	para "problemi ad"
	line "allenarlo."
	done
	
Text_GoodJob:
	text "WAHA! Dovresti"
	line "allenarti nel"
	cont "nostro DOJO!"
	done
	
Text_BeatEm:
	text "Ehi ragazzo!"
	para "È stato uno"
	line "spettacolo!"
	para "Ti meriti"
	line "questo!"
	done

Text_GoBeatBlackbelts:
	text "Ehi ragazzo!"
	para "Se batterai i miei"
	line "allievi, ti darò"
	para "un bel premio!"
	done

FightingDojoBlackBeltText:
	text "Ciao!"

	para "Il RE del KARATE,"
	line "maestro del DOJO"

	para "KARATE è in una"
	line "grotta di NIHON"
	cont "per allenarsi."
	done

FightingDojoSign1Text:
	text "Chi semina vento"
	line "raccoglie"
	cont "tempesta!"
	done

FightingDojoSign2Text:
	text "Nemici da ogni"
	line "parte!"
	done

BlackbeltYoshiSeenText:
	text "Io e i miei #-"
	line "MON siamo legati"
	cont "da grande fiducia."

	para "Il nostro legame"
	line "è indistruttibile!"
	done

BlackbeltYoshiBeatenText:
	text "Impossibile!"
	done

BlackbeltYoshiAfterText:
	text "Anche tu hai un"
	line "forte legame con"
	cont "i tuoi #MON!"
	done

BlackbeltLaoSeenText:
	text "Noi non abbiamo"
	line "paura di nulla!"
	done

BlackbeltLaoBeatenText:
	text "Spaventoso!"
	done

BlackbeltLaoAfterText:
	text "I #MON LOTTA"
	line "temono il tipo"
	cont "PSICO…"
	done

BlackbeltNobSeenText:
	text "Le parole sono"
	line "inutili."
	para "Lasciamo parlare"
	line "i pugni!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ho perso! "
	line "Non ho parole!"
	done

BlackbeltLungSeenText:
	text "I miei pugni"
	line "distruggeranno i"
	cont "tuoi #MON!"
	done

BlackbeltLungBeatenText:
	text "Che disfatta!"
	done

BlackbeltLungAfterText:
	text "Ho perso…"
	line "Il… il mio"
	cont "orgoglio…"
	done

FightingDojo_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, ALLOY_CITY, 11
	warp_event  6, 11, ALLOY_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  6,  0, BGEVENT_READ, FightingDojoSign2

	db 6 ; object events
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  4,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  4,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltYoshi, -1
	object_event  7,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLao, -1
	object_event  7,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltNob, -1
	object_event  4,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 0, TrainerBlackbeltLung, -1
