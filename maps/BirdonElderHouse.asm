	object_const_def ; object_event constants
	const BIRDONELDERHOUSE_POKEFAN_M

BirdonElderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonElderHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .GiveSurf
	writetext ElderSlowpokeProblem
	waitbutton
	closetext
	end
	

.GiveSurf
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotSurf
	writetext ElderTakeThisSurfText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderSurfDescriptionText
	waitbutton
	closetext
	end

.NoRoom:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.Refused:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.GotSurf:
	writetext ElderStandardText
	waitbutton
	closetext
	end

BirdonElderHouseBookshelf:
	jumpstd PictureBookshelfScript

ElderSlowpokeProblem:
	text "Le mie vecchie"
	line "ossa sentono che"
	para "il POZZO è in"
	line "pericolo."
	para "È sempre stato"
	line "compito mio"
	para "proteggere gli"
	line "SLOWPOKE."
	para "Non credo di aver"
	line "la forza per fare"
	cont "qualcosa."
	para "Spero che stiano"
	line "bene…"
	done

ElderTakeThisSurfText:
	text "Ah!"
	para "Grazie per"
	line "essere passato!"
	para "Ti sono molto"
	line "riconoscente."
	para "E sono sicuro che"
	line "lo siano anche gli"
	cont "SLOWPOKE!"
	para "Ecco, lascia che"
	line "ti dia qualcosa"
	cont "per sdebitarmi."
	done
	
ElderNoSurf:
	text "Sei sicuro?"
	line "Credo che possa"
	cont "servirti."
	done
	
ElderSurfDescriptionText:
	text "Questa MN permette"
	line "di insegnare ai"
	para "#MON una mossa"
	line "per trasportarti"
	para "attraverso le"
	line "acque."
	para "Non c'è molta"
	line "acqua qui intorno,"
	para "ma sono sicuro che"
	line "ti servirà"
	cont "altrove."
	done
	
ElderStandardText:
	text "Gli SLOWPOKE del"
	line "POZZO devono"
	cont "essere protetti."
	done


BirdonElderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BIRDON_TOWN, 4
	warp_event  4,  7, BIRDON_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, BirdonElderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonElderHousePokefanMScript, -1
