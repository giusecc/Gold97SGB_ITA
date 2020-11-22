	object_const_def ; object_event constants
	const ROUTE110SANDSTORMHOUSE_GRANNY

Route110SandstormHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	buttonsound
	ifgreater 150 - 1, .Loyal
	jump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	buttonsound
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "Qual è l'obiettivo"
	line "per te e i tuoi"
	cont "#MON?"

	para "La LEGA di NIHON?"

	para "I tuoi #MON"
	line "si fidano di te?"

	para "Fammi vedere…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! I tuoi #MON"
	line "hanno molta"
	cont "fiducia in te."

	para "È fantastico"
	line "vedere un alle-"
	cont "natore come te"

	para "Ecco. Un dono per"
	line "il tuo viaggio."
	done

SandstormHouseSandstormDescription:
	text "La MT37 contiene"
	line "TERREMPESTA."

	para "È una mossa che"
	line "danneggia entrambi"
	cont "i #MON."

	para "È solo per allena-"
	line "tori abili."

	para "Usala se ne hai il"
	line "coraggio! Auguri!"
	done

SandstormHouseWomanDisloyalText:
	text "Se non c'è fiducia"
	line "può diventare"

	para "tutto più"
	line "difficile."

	para "La fiducia è ciò"
	line "che lega i #MON"
	cont "agli allenatori."
	done

Route110SandstormHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_110, 3
	warp_event  5,  7, ROUTE_110, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, SandstormHouseBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
