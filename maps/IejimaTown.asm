	object_const_def ; object_event constants
	const IEJIMA_GRAMPS
	const IEJIMA_BIKER1
	const IEJIMA_BIKER2
	const IEJIMA_BIKER3
	const IEJIMA_YOUNGSTER
	const IEJIMA_BIKER4
	const IEJIMA_BIKER5
	const IEJIMA_BIKER6
	const IEJIMA_SWIMMERF
	const IEJIMA_SWIMMERM
	const IEJIMA_LASS
	const IEJIMA_TRIWING

IejimaTown_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .NoWater

.NoWater:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .IejimaTownFixed
	changeblock  11,  7, $7A ; floor
	changeblock  13,  7, $7A ; floor
	changeblock  15,  7, $7A ; floor
	changeblock  17,  7, $7A ; floor
	changeblock  13,  9, $7A ; floor
	changeblock  15,  9, $7A ; floor
	changeblock  17,  9, $7A ; floor
	changeblock  11, 11, $7A ; floor
	changeblock  13, 11, $7A ; floor
	changeblock  15, 11, $7A ; floor
	changeblock  17, 11, $7A ; floor
	changeblock  15, 13, $7A ; floor
	changeblock  13, 13, $7A ; floor
	changeblock  11, 13, $7A ; floor
	changeblock  19, 11, $7A ; floor
	changeblock  19,  9, $7A ; floor
	changeblock  19,  7, $6B ; rock
	changeblock  17, 13, $6B ; rock
	changeblock  11,  9, $6B ; rock
	changeblock  13,  1, $60 ; dry
	changeblock  13,  3, $60 ; dry
	changeblock  13,  5, $60 ; dry
	changeblock  15,  1, $60 ; dry
	changeblock  15,  3, $60 ; dry
	changeblock  15,  5, $60 ; dry
	changeblock  17,  1, $60 ; dry
	changeblock  17,  3, $60 ; dry
	changeblock  17,  5, $60 ; dry
	changeblock   9,  7, $10 ; left edge
	changeblock   9,  9, $10 ; left edge
	changeblock   9, 11, $10 ; left edge
	changeblock   9, 13, $10 ; left edge
	changeblock  21,  7, $12 ; right edge
	changeblock  21,  9, $12 ; right edge
	changeblock  21, 11, $12 ; right edge
	return
	
.IejimaTownFixed
	return
	
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_IEJIMA
	return
	
IejimaTownPokecenterSign:
;	setevent EVENT_IEJIMA_TOWN_NOT_FIXED
;	clearevent EVENT_IEJIMA_TOWN_FIXED
;	clearevent EVENT_DAM_IS_OPEN
	jumpstd PokecenterSignScript
	
IejimaTownGrampsBefore:
	jumptextfaceplayer IejimaTownGrampsBeforeText
	
IejimaTownBiker1:
	jumptextfaceplayer IejimaTownBiker1Text
	
IejimaTownBiker2:
	jumptextfaceplayer IejimaTownBiker2Text
	
IejimaTownBiker3:
	jumptextfaceplayer IejimaTownBiker3Text	
	
	
IejimaTownBiker4:
	jumptextfaceplayer IejimaTownBiker4Text
	
	
IejimaTownBiker5:
	jumptextfaceplayer IejimaTownBiker5Text
	
	
IejimaTownBiker6:
	jumptextfaceplayer IejimaTownBiker6Text
	
IejimaTownTriWingItem:
	turnobject IEJIMA_YOUNGSTER, DOWN
	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	disappear IEJIMA_TRIWING
	opentext
;	buttonsound
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
;	waitbutton
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
IejimaTownLass:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .LassNotFixedYet
	writetext IejimaTownLassText
	waitbutton
	closetext
	end
	
.LassNotFixedYet
	writetext IejimaTownLassText2
	waitbutton
	closetext
	end

IejimaTownYoungster:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .YoungsterNotFixedYet
	checkevent EVENT_IEJIMA_TOWN_TRI_WING
	iffalse .GetTriWing
	writetext IejimaTownYoungsterText
	waitbutton
	closetext
	end
	
.GetTriWing
;	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	pause 15
	turnobject IEJIMA_YOUNGSTER, DOWN
	disappear IEJIMA_TRIWING
	pause 15
	faceplayer
	opentext
;	buttonsound
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
;	waitbutton
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.YoungsterNotFixedYet
	writetext IejimaTownYoungsterText2
	waitbutton
	closetext
	end
	
IejimaTownSwimmerGirl:
	jumptextfaceplayer IejimaTownSwimmerGirlText
	
IejimaTownSwimmerGuy:
	jumptextfaceplayer IejimaTownSwimmerGuyText
	
ItemWashedUpText:
	text "Ehi! Guarda qua!"
	para "Qualcosa è"
	line "comparso a riva"
	para "quando l'acqua ha"
	line "ripreso a"
	cont "scorrere!"
	para "Sembra una specie"
	line "di piuma."
	para "Io non so cosa"
	line "farci, prendila"
	cont "tu!"
	done
	
GotTriWingText:
	text "<PLAYER> riceve"
	line "TRI-ALA!"
	done
	
IejimaTownLassText:
	text "Sono felice che"
	line "tutto si sia"
	para "risolto alla"
	line "CENTRALE."
	done
	
IejimaTownLassText2:
	text "La cascata e il"
	line "laghetto che"
	para "riempie sono"
	line "l'orgoglio della"
	cont "città."
	para "Se l'acqua non"
	line "scorre è un"
	cont "problema."
	done
	
IejimaTownSwimmerGirlText:
	text "Questo laghetto"
	line "è così bello."
	done
	
IejimaTownSwimmerGuyText:
	text "Mi piace nuotare"
	line "qui per fare"
	cont "esrcizio!"
	done
	
IejimaTownBiker4Text:
	text "Gli sbirri ci"
	line "hanno seguito fino"
	cont "al bacino."
	para "L'acqua ha ripreso"
	line "a scorrere!"
	done
	
IejimaTownBiker5Text:
	text "Nessuno ha gradito"
	line "quando abbiamo"
	para "bloccato la"
	line "cascata."
	para "Forse dovremmo"
	line "smetterla, se"
	para "vogliamo stare"
	line "fuori dai guai."
	done

IejimaTownBiker6Text:
	text "Andrò da qualche"
	line "altra parte."
	done
	
IejimaTownBiker1Text:
	text "Eheh!"
	para "Questo posto è"
	line "fantastico per"
	cont "andare in giro!"
	done
	
IejimaTownBiker2Text:
	text "IEJIMA, attenta!"
	para "Noi restiamo qui!"
	done
	
IejimaTownBiker3Text:
	text "Quest'area si è"
	line "asciugata quando"
	para "abbiamo chiuso la"
	line "diga della"
	cont "CENTRALE!"
	para "C'è un sacco di"
	line "spazio per girare!"
	done
	
IejimaTownYoungsterText:
	text "È così bello stare"
	line "vicino all'acqua."
	done
	
IejimaTownYoungsterText2:
	text "È terribile!"
	para "L'acqua dovrebbe"
	line "arrivare fin qui!"
	para "Cosa sta succeden-"
	line "do alla CENTRALE"
	cont "IDROELETTRICA?"
	done
	
IejimaTownGrampsBeforeText:
	text "Oh!"
	para "Cos'è successo"
	line "alla nostra amata"
	cont "cascata?"
	para "Deve avere a che"
	line "fare con i"
	para "teppisti che ci"
	line "sono da queste"
	cont "parti!"
	done

IejimaTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23,  7, MOTOBU_PATH_IEJIMA_GATE, 1
	warp_event  1,  6, IEJIMA_POKECENTER_1F, 1
	warp_event  7, 15, IEJIMA_HOUSE_1, 1
	warp_event 19, 14, IEJIMA_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_READ, IejimaTownPokecenterSign

	db 12 ; object events
	object_event 13,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownGrampsBefore, EVENT_IEJIMA_TOWN_FIXED
	object_event 11, 11, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker1, EVENT_IEJIMA_TOWN_FIXED
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker2, EVENT_IEJIMA_TOWN_FIXED
	object_event 16,  8, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker3, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownYoungster, -1
	object_event 14, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker4, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 13, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker5, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker6, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGirl, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 17, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGuy, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownLass, -1
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownTriWingItem, EVENT_IEJIMA_TOWN_TRI_WING
