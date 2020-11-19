	object_const_def ; object_event constants
	const KANTOMANSION2F_DEVELOPER

KantoMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansion2FComputer:
	jumptext KantoMansion2FComputerText

KantoMansion2FMeetingRoomSign:
	jumptext KantoMansion2FMeetingRoomSignText

KantoMansion2FBookshelf:
	jumpstd DifficultBookshelfScript
	
KantoMansionClerk:
	jumptextfaceplayer KantoMansionClerkText
	
KantoMansionClerkText:
	text "Ehi! Sono il"
	line "traduttore!"
	para "Prima c'era anche"
	para "un programmatore"
	line "qui. Meglio che"
	para "quelli del piano"
	line "di sopra non"
	cont "sappiano di noi!"
	para "Grazie per aver"
	line "giocato fin qui!"
	para "È stato un duro"
	line "lavoro."
	para "Il mio collega"
	line "ha provato a"
	para "rendere tutto il"
	line "più veritiero"
	para "possibile, io a"
	line "tradurlo in modo"
	cont "autentico."
	para "Autentico a parte"
	line "questa rottura di"
	para "quarta parete,"
	line "si intende!"
	done

KantoMansion2FComputerText:
	text "È un computer."
	line "Quanta roba!"
	para "C'è anche una"
	line "strana immagine!"
	para "Sembra una sorta"
	line "di… SNEASEL?"
	cont "Assurdo…"
	done

KantoMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "SALA RIUNIONI"
	done

KantoMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_MANSION_1F, 4
	warp_event  4,  0, KANTO_MANSION_3F, 2
	warp_event  6,  0, KANTO_MANSION_3F, 3
	warp_event  7,  0, KANTO_MANSION_1F, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  6, BGEVENT_READ, KantoMansion2FComputer
	bg_event  4,  9, BGEVENT_UP, KantoMansion2FMeetingRoomSign
	bg_event  0,  1, BGEVENT_READ, KantoMansion2FBookshelf
	bg_event  1,  6, BGEVENT_READ, KantoMansion2FComputer


	db 1 ; object events
	object_event  2,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMansionClerk, -1
