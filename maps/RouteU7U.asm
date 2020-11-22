RouteU7U_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "LEGA #MON"

	para "VIA VITTORIA"
	line "INGRESSO"
	done

RouteU7U_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	db 0 ; object events
