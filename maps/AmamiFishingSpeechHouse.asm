	object_const_def ; object_event constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Sono il GURU"
	line "PESCATORE, il più"
	
	para "vecchio dei FRA-"
	line "TELLI PESCATORI."

	para "Conosci per caso"
	line "il PESCATORE"
	
	para "WILLY? Pesca sul"
	line "PERCORSO 44."


	para "Mi ha dato un"
	line "consiglio stupendo"
	cont "al telefono."

	para "Grazie a lui ho"
	line "catturato un bel"

	para "po' di #MON"
	line "rari! Che pesca!"
	done

FishingDudesHousePhotoText:
	text "Nella foto c'è"
	line "gente che pesca…"

	para "Sembra che si"
	line "divertano…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AMAMI_TOWN, 1
	warp_event  3,  7, AMAMI_TOWN, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
