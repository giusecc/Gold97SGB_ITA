	object_const_def ; object_event constants
	const SANSKRITROCKETHOUSE_RECEPTIONIST
	const SANSKRITROCKETHOUSE_OFFICER
	const SANSKRITROCKETHOUSE_SUPER_NERD1
	const SANSKRITROCKETHOUSE_GENTLEMAN
	const SANSKRITROCKETHOUSE_SUPER_NERD2

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SanskritRocketHouseReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseReceptionistText
	waitbutton
	closetext
	end

.GiveKey:
	checkevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	iftrue .AlreadyGotKey
	writetext SanskritRocketHouseReceptionistTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	verbosegiveitem BASEMENT_KEY
	writetext RocketKey_AfterText2
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	end
	
.AlreadyGotKey:
	writetext RocketKey_Afterwards
	waitbutton
	closetext
	end

SanskritRocketHouseOfficerScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseOfficerText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseSuperNerd1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseSuperNerd1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseGentlemanText
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseGentlemanTextKey
	waitbutton
	closetext
	end


SanskritRocketHouseSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseSuperNerd2Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseSuperNerd2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseDirectory:
	jumptext SanskritRocketHouseDirectoryText

SanskritRocketHousePokeFluteSign:
	jumptext SanskritRocketHousePokeFluteSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText

SanskritRocketHouseReceptionistText:
	text "Ha!"
	para "Sta arrivando"
	line "una sacco di merce"
	para "dai MOLI di"
	line "ELIOPOLI!"
	para "Abbiamo tutto"
	line "quello che ci"
	para "serve per la"
	line "prossima fase!"
	para "La squadra di"
	line "INERTOPOLI sarà"
	para "impressionata dal"
	line "nostro lavoro!"
	done

SanskritRocketHouseOfficerText:
	text "MURKROW: CRAAA!"
	done

SanskritRocketHouseSuperNerd1Text:
	text "I CASINÒ sono"
	line "sempre una buona"
	cont "fonte di denaro!"
	para "Ricordatelo!"
	done
	
SanskritRocketHouseSuperNerd1TextKey:
	text "Hm? Una chiave?"
	para "No, non ce l'ho!"
	line "Ma perché la"
	cont "vuoi?"
	para "Stai alla larga"
	line "ragazzino!"
	done

SanskritRocketHouseGentlemanText:
	text "Un moccioso si"
	line "sta intromettendo"
	para "con i nostri"
	line "piani."
	para "Prima all'"
	line "ACQUARIO, poi al"
	cont "POZZO SLOWPOKE…"
	para "Ma non importa!"
	para "Cose di poco"
	line "conto!"
	para "HA!"
	done

SanskritRocketHouseGentlemanTextKey:
	text "Che chiave?"
	line "Non ho nessuna"
	cont "chiave."
	para "Ehi!"
	para "Spero che tu non"
	line "sia quello che"
	para "sta ostacolando i"
	line "nostri piani!"
	para "Smettila, se"
	line "tieni alla pelle!"
	done


SanskritRocketHouseSuperNerd2Text:
	text "Tra un po' potremo"
	line "mostrare al"
	para "mondo di cosa"
	line "è capace il"
	cont "TEAM ROCKET!"
	done

SanskritRocketHouseSuperNerd2TextKey:
	text "No, non ho"
	line "chiavi."
	para "Il CAPITANO non"
	line "si fida di me."
	done

SanskritRocketHouseSuperNerd2Text_GotExpnCard:
	text "Ehi amico!"

	para "Sono il super DI-"
	line "RETTORE MUSICALE."

	para "Sono responsabile"
	line "di tutta la"

	para "musica che passa"
	line "per radio."

	para "Vuoi fare una"
	line "buona azione? Ruba"
	para "la musica dalla"
	line "nostra stazione!"
	done

SanskritRocketHouseDirectoryText:
	text "I #MON esistono"
	line "per la gloria del"
	cont "TEAM ROCKET!"
	done

SanskritRocketHousePokeFluteSignText:
	text "Tutto si ripete…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "È pieno di CD"
	line "di #MON."
	done
	
SanskritRocketHouseReceptionistTextKeyTime:
	text "Una CHIAVE?"
	para "Forse ce l'ho."
	line "A cosa ti serve?"
	done

RocketKey_WinText:
	text "Cosa!?"
	done
	
RocketKey_LossText:
	text "Ha!"
	done
	
RocketKey_AfterText:
	text "Oh no, il CAPITANO"
	line "vorrà la mia testa"
	cont "per questo!"
	done

RocketKey_AfterText2:
	text "Vattene!"
	done
	
RocketKey_Afterwards:
	text "Non parlarmi!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHouseDirectory
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHousePokeFluteSign

	db 5 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseReceptionistScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseOfficerScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseGentlemanScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
