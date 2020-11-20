	object_const_def ; object_event constants
	const MOTOBUPATHIEJIMAGATE_OFFICER

MotobuPathIejimaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MotobuPathIejimaGateOfficerScript:
;	setevent EVENT_IEJIMA_TOWN_FIXED
	faceplayer
	opentext
	checkevent EVENT_RETURNED_FUEL_LINE
	iffalse .BikersInGate
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .BikersInTown
	writetext MotobuPathIejimaGateOfficerText
	waitbutton
	closetext
	end
	
.BikersInGate
	writetext MotobuPathIejimaGateOfficerText2
	waitbutton
	closetext
	end
	
.BikersInTown
	writetext MotobuPathIejimaGateOfficerText3
	waitbutton
	closetext
	end
	
MotobuPathIejimaGateBikerScript:
	opentext
	writetext BikersInGateText
	waitbutton
	closetext
	end
	
BikersInGateText:
	text "Forza!"
	para "Pronti a partire!"
	done

MotobuPathIejimaGateOfficerText:
	text "La cascata di"
	line "IEJIMA è così"
	cont "bella!"
	done
	
MotobuPathIejimaGateOfficerText2:
	text "Cosa diamine"
	line "vogliono fare"
	para "quei teppisti?"
	done

MotobuPathIejimaGateOfficerText3:
	text "Un gruppo di"
	line "teppisti sta"
	para "causando problemi"
	line "alla CENTRALE."
	para "Sembra che abbiano"
	line "chiuso la diga"
	para "che porta l'acqua"
	line "a IEJIMA."
	done

MotobuPathIejimaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, IEJIMA_TOWN, 1
	warp_event  1,  7, IEJIMA_TOWN, 1
	warp_event  8,  7, MOTOBU_PATH, 1
	warp_event  9,  7, MOTOBU_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateOfficerScript, -1
	object_event  0,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  6, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  0,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  1,  4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  2,  5, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
	object_event  3,  4, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MotobuPathIejimaGateBikerScript, EVENT_RETURNED_FUEL_LINE
