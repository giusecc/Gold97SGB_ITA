	object_const_def ; object_event constants
	const TEKNOSITEMFINDERHOUSE_COOLTRAINER_M
	const TEKNOSITEMFINDERHOUSE_POKEDEX

TeknosItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext TeknosItemfinderAdventureText
	yesorno
	iffalse .no
	writetext TeknosItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext TeknosItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

TeknosHistoryBook:
	faceplayer
	opentext
	writetext TeknosHistoryBookText
	waitbutton
	closetext
	end


ItemFinderHouseRadio:
	jumpstd Radio2Script

TeknosItemfinderAdventureText:
	text "Non potrò mai"
	line "ringraziarti"
	para "abbastanza per"
	line "aver ritrovato"
	cont "mia nipote!"
	para "Deve stare più"
	line "attenta in"
	para "futuro, ma ora"
	line "sono solo"
	para "contento che"
	line "stia bene!"
	para "Te la sei cavata"
	line "bene nella CAVA."
	para "Se sai dove"
	line "cercare, puoi"
	para "trovare un sacco"
	line "di strumenti"
	para "nascosti nella"
	line "grotta."
	para "Se vuoi posso"
	line "darti qualcosa"
	para "per trovare"
	line "più strumenti."
	done

TeknosItemfinderTrueSpiritText:
	text "Tieni! Voglio"
	line "darti questo!"
	done

ItemfinderExplanationText:
	text "Molti strumenti"
	line "per terra non sono"

	para "facilissimi da"
	line "vedere."

	para "Con DETECTOR puoi"
	line "trovare uno stru-"

	para "mento per terra"
	line "nelle vicinanze."

	para "Non ti dice il"
	line "punto preciso:"

	para "quello devi"
	line "trovarlo tu!"
	done

TeknosItemfinderToEachHisOwnText:
	text "Sicuro? Credo che"
	line "potrebbe servirti."
	done

TeknosHistoryBookText:
	text "Il nonno non vuole"
	line "che giochi nella"
	cont "CAVA."
	para "Ha ragione."
	line "Vuole che stia"
	cont "al sicuro."
	done


TeknosItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 8
	warp_event  5,  7, TEKNOS_CITY, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosItemfinderGuy, EVENT_BIRDON_GYM_GRAMPS
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosHistoryBook, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
