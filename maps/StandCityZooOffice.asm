	object_const_def ; object_event constants
	const SAFARIOFFICE_SUPERNERD
	const SAFARIOFFICE_ROCKER
	const SAFARIOFFICE_POKEFAN_M

StandCityZooOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

SafariOfficeSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText
	waitbutton
	closetext
	end
	
.SafariOfficeSuperNerdRocketsGone
	writetext SafariOfficeSuperNerdText2
	waitbutton
	closetext
	end
	
SafariOfficeRockerScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText
	waitbutton
	closetext
	end
	
.SafariOfficeRockerRocketsGone
	writetext SafariOfficeRockerText2
	waitbutton
	closetext
	end
	
SafariOfficePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText
	waitbutton
	closetext
	end
	
.SafariOfficePokefanMRocketsGone
	writetext SafariOfficePokefanMText2
	waitbutton
	closetext
	end

SafariOfficeSuperNerdText:
	text "Salve! Questo è"
	line "l'ufficio dello"
	cont "ZOO di INERTOPOLI."
	para "Stiamo lavorando"
	line "sodo per capire"
	para "perché i nostri"
	line "#MON stiano"
	cont "male!"
	para "Lo ZOO è chiuso"
	line "fino a nuove"
	cont "disposizioni."
	done
	
SafariOfficeSuperNerdText2:
	text "Benvenuto all'"
	line "ufficio dello"
	cont "ZOO DI INERTOPOLI!"
	para "Stiamo lavorando"
	line "sui dati che"
	para "ricaviamo dai"
	line "nostri #MON per"
	para "imparare di più"
	line "su di loro."
	done
	
SafariOfficeRockerText:
	text "Sembra che i"
	line "#MON soffrano"
	cont "di emicranie…"
	para "Questo è il"
	line "primo sintomo."
	done

SafariOfficeRockerText2:
	text "Portiamo spesso"
	line "i #MON al"
	para "PARCO NAZIONALE,"
	line "così possono"
	para "passare un po'"
	line "di tempo al di"
	para "fuori della"
	line "mostra."
	done
	
SafariOfficePokefanMText:
	text "Non ho mai visto"
	line "qualcosa di"
	cont "simile…"
	done

SafariOfficePokefanMText2:
	text "Gli scienziati di"
	line "questo ZOO hanno"
	para "condotto molte"
	line "ricerche sull'"
	para "alimentazione"
	line "dei #MON."
	done

StandCityZooOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, STAND_CITY, 2
	warp_event  3,  7, STAND_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeSuperNerdScript, -1
	object_event 14,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficeRockerScript, -1
	object_event 10,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariOfficePokefanMScript, -1

