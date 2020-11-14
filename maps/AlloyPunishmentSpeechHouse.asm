	object_const_def ; object_event constants
	const ALLOYPUNISHMENTSPEECHHOUSE_POKEFAN_M

AlloyPunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyPunishmentSpeechHouseDad:
	jumptextfaceplayer AlloyPunishmentSpeechHouseDadText



AlloyPunishmentSpeechHouseBookshelf2:
	jumpstd PictureBookshelfScript

AlloyPunishmentSpeechHouseRadio:
	jumpstd Radio2Script

AlloyPunishmentSpeechHouseDadText:
	text "ISOLA ZUCCHERINO"
	line "è un luogo"
	cont "caratteristico."
	para "Ma è difficile"
	line "raggiungerla."
	para "Le acque a nord"
	line "di qui sono piene"
	cont "di vortici."
	para "È impossibile"
	line "attraversarli"
	cont "senza un #MON."
	done



AlloyPunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 5
	warp_event  5,  7, ALLOY_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  1, BGEVENT_READ, AlloyPunishmentSpeechHouseRadio
	bg_event  4,  0, BGEVENT_READ, AlloyPunishmentSpeechHouseBookshelf2

	db 1 ; object events
	object_event  1,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPunishmentSpeechHouseDad, -1
