	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_RED_IN_KANTO_GYM
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterRinring
	yesorno
	iffalse .refusetotakeshuckie
	special GiveRinring
	iffalse .partyfull
	writetext ManiaText_TakeCareOfRinring
	promptbutton
	waitsfx
	writetext ManiaText_GotRinring
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_RED_IN_KANTO_GYM
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfRinring
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnRinring
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_RinringNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_RinringLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_RinringIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterRinring:
	text "Che paura!"

	para "Ho subito poco"
	line "fa un furto!"

	para "Mi rimane solo un"
	line "#MON, ma se"
	cont "il ladro tornasse?"

	para "Sembri forte,"
	line "potresti badare"

	para "a lui per un po'?"
	done

ManiaText_TakeCareOfRinring:
	text "Oh, grazie!"

	para "Prenditi cura"
	line "di lui!"
	done

ManiaText_GotRinring:
	text "<PLAYER> riceve un"
	line "#MON."
	done

ManiaText_PartyFull:
	text "La tua squadra è"
	line "al completo."
	done

ManiaText_IfHeComesBack:
	text "Oh, no… Cosa"
	line "farò se tornerà?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Come sta il mio"
	line "#MON?"

	para "Ora dovrei essere"
	line "al sicuro. Posso"
	cont "riaverlo?"
	done

ManiaText_ThankYou:
	text "Grazie!"
	done

ManiaText_RinringNotThere:
	text "Ehi! Non hai il"
	line "mio #MON"
	cont "con te."
	done

ManiaText_RinringLikesYou:
	text "Il mio #MON"
	line "si è affezionato."

	para "Va bene, puoi"
	line "tenerlo."

	para "Ma promettimi"
	line "di trattarlo"
	cont "bene!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, no… È come"
	line "essere rapinati."
	done

ManiaText_HappinessSpeech:
	text "Per un #MON,"
	line "la felicità è"

	para "stare con qualcuno"
	line "che lo tratti"
	cont "bene."
	done

ManiaText_RinringIsYourLastMon:
	text "Se riprendo il mio"
	line "#MON con chi"

	cont "lotterai?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SUNPOINT_CITY, 1
	warp_event  3,  7, SUNPOINT_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
