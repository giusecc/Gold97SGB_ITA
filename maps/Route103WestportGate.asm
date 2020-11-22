	object_const_def ; object_event constants
	const ROUTE103WESTPORTGATE_OFFICER
	const ROUTE103WESTPORTGATE_POKEFAN_F
	const ROUTE103WESTPORTGATE_FISHER

Route103WestportGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	writetext UnknownText_0x69ddd
	waitbutton
	closetext
	end
	
GiftSpearowMail:
	db FLOWER_MAIL
	db   "La GROTTA porta"
	next "altrove@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; filler

Route103WestportGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FoughtBipetal
	writetext Route103WestportGatePokefanFText
	waitbutton
	closetext
	end

.FoughtBipetal
	writetext Route103WestportGatePokefanFText_FoughtBipetal
	waitbutton
	closetext
	end

Route103WestportGateFisherScript:
	jumptextfaceplayer Route103WestportGateFisherText

UnknownText_0x69ddd:
	text "PORTOVEST è"
	line "noiosa."
	para "Tutti adorano la"
	line "città, ma io"
	para "preferisco posti"
	line "più tranquilli."
	done

UnknownText_0x69e48:
	text "Lo farai? Grazie!"
	line "Grazie davvero!"

	para "Il mio amico è"
	line "un ragazzo che"
	cont "dorme sempre."

	para "Lo riconoscerai!"
	done

UnknownText_0x69eb8:
	text "<PLAYER> riceve un"
	line "#MON con un"
	cont "MESSAGGIO."
	done

UnknownText_0x69ed6:
	text "Puoi leggerlo, ma"
	line "non perderlo!"
	done

UnknownText_0x69f56:
	text "Non puoi portare"
	line "un altro #MON…"
	done

UnknownText_0x69f74:
	text "Oh… Non importa,"
	line "allora…"
	done

UnknownText_0x69f8b:
	text "Grazie per avermi"
	line "aiutato!"

	para "Ecco qualcosa per"
	line "il disturbo!"
	done

UnknownText_0x69fd9:
	text "Stava dormendo,"
	line "vero? Che ti"
	cont "avevo detto?"
	done

Route103WestportGatePokefanFText:
	text "Il terreno a nord"
	line "è instabile."
	para "Alcune rocce"
	line "hanno bloccato"
	cont "la strada."
	para "Non credo sia"
	line "possibile"
	cont "passare."
	done

Route103WestportGatePokefanFText_FoughtBipetal:
	text "La strada è stata"
	line "liberata."
	para "È grandioso per i"
	line "viaggiatori che"
	para "vogliono visitare"
	line "AVIOPOLI."
	done

Route103WestportGateFisherText:
	text "Mi chiedo quanti"
	line "tipi di #MON"

	para "ci siano al"
	line "mondo."

	para "Un anno fa, il"
	line "PROF.OAK ha"

	para "detto che ce ne"
	line "sono 150."
	done

Route103WestportGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_103, 1
	warp_event  5,  0, ROUTE_103, 2
	warp_event  4,  7, WESTPORT_CITY, 7
	warp_event  5,  7, WESTPORT_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103WestportGatePokefanFScript, -1
	object_event  6,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103WestportGateFisherScript, -1
