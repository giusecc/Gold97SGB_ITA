	object_const_def ; object_event constants
	const STANDPOKE_NURSE1
	const STANDPOKE_FAIRY
	const STANDPOKE_NURSE2

StandPoke_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandPokeNurse1Script:
	faceplayer
	opentext
	writetext StandPokeNurse1Text
	waitbutton
	closetext
	turnobject STANDPOKE_NURSE1, RIGHT
	end
	

StandPokeClefairyScript:
	opentext
	writetext ClefairyWeakText
	setval CLEFAIRY
	special PlaySlowCry
	promptbutton
	writetext StandPokeItsCryIsWeakText
	waitbutton
	closetext
	end
	
StandPokeNurse2Script:
	jumptextfaceplayer StandPokeNurse2Text
	
StandPokeNurse2Text:
	text "Questo è il centro"
	line "medico dello ZOO"
	cont "di INERTOPOLI."
	para "Fortunatamente i"
	line "nostri #MON"
	para "sono tutti in"
	line "salute!"
	done
	
	
ClefairyWeakText:
	text "CLEFAIRY: …Clef…"
	done
	
StandPokeItsCryIsWeakText:
	text "Sembra debole…"
	done


StandPokeNurse1Text:
	text "Questo CLEFAIRY"
	line "sta male."
	para "Gli altri #MON"
	line "dello ZOO sono"
	cont "sul retro."
	para "Spero che stiano"
	line "tutti bene presto."
	done

StandPoke_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, STAND_CITY, 13
	warp_event  4,  7, STAND_CITY, 13

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse1Script, EVENT_CLEARED_RADIO_TOWER
	object_event 3,  3, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeClefairyScript, EVENT_CLEARED_RADIO_TOWER
	object_event 2,  3, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandPokeNurse2Script, EVENT_STAND_CITY_ZOO_MONS

