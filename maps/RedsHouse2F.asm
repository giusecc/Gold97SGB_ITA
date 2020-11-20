RedsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FN64Text:
	text "<PLAYER> gioca"
	line "con NINTENDO 64."

	para "Meglio andare,"
	line "non c'è tempo"
	cont "da perdere."
	done

RedsHouse2FPCText:
	text "Sembra che nessuno"
	line "l'abbia usato per"
	cont "molto tempo…"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  2,  1, BGEVENT_READ, RedsHouse2FPCScript

	db 0 ; object events
