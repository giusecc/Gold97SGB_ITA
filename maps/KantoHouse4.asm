	object_const_def ; object_event constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_KIKAI_VILLAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_KIKAI_VILLAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_KIKAI_VILLAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_KikaiVillageHistory
	waitbutton
	closetext
	setevent EVENT_KIKAI_VILLAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_KIKAI_VILLAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_KIKAI_VILLAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_KIKAI_VILLAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

KikaiVillageMagikarpHouseUnusedRecordSign:
; unused
	jumptext KikaiVillageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_KikaiVillageHistory:
	text "DEBUG TEXT"
	line "You should never"
	cont "see this dialogue."
	para "If you are, you've"
	line "either stumbled"
	para "upon a glitch, or"
	line "you're sequence"
	cont "breaking."
	para "This text only"
	line "displays if you"
	para "talk to this guy"
	line "before beating"
	para "TEAM ROCKET in the"
	line "RADIO TOWER."
	para "And you shouldn't"
	line "be here if you"
	cont "haven't done that."
	para "The developer"
	line "didn't feel like"
	para "changing the"
	line "script for this"
	para "guy since it's not"
	line "really necessary."
	para "So what are you up"
	line "to here?"
	para "You should go back"
	line "and do what you're"
	cont "supposed to do."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Vattene via,"
	line "ragazzino."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Amo i MAGIKARP da"
	line "quando sono"
	cont "piccolo."

	para "Ora posso realiz-"
	line "zare il mio sogno"
	para "di trovare il MA-"
	line "GIKARP più grande"
	cont "del mondo!"

	para "Hai un AMO? Se ce"
	line "l'hai, mi daresti"
	cont "una mano?"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, vedo che hai"
	line "un MAGIKARP!"

	para "Vediamo un po'"
	line "quant'è grosso."
	done

MagikarpLengthRaterText_Memento:
	text "Uauh, ma questo"
	line "è enorme!"

	para "Mi inchino alla"
	line "tua classe!"

	para "Prendi questo come"
	line "ricordo!"
	done

MagikarpLengthRaterText_Bonus:
	text "È importante"
	line "battere il record."

	para "È una specie di"
	line "bonus, capisci?"
	done

MagikarpLengthRaterText_TooShort:
	text "Uauh! Ma questo è"
	line "enorme!"

	para "…Mi piacerebbe"
	line "poter dire così"

	para "ma ne ho visti di"
	line "più grossi."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Come? Ma non è un"
	line "MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Non riesci"
	line "a prenderne uno"

	para "abbastanza grande?"
	line "Sarà per un'altra"
	cont "volta."
	done

KikaiVillageMagikarpHouseUnusedRecordText:
	text "RECORD ATTUALE"

	para "@"
	text_ram wStringBuffer3
	text " cm preso da"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 27
	warp_event  5,  7, KANTO_REGION, 27

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
