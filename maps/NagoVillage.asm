	object_const_def ; object_event constants
	const NAGO_VILLAGE_TEACHER
	const NAGO_VILLAGE_FISHING_GURU

NagoVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_NAGO
	return

NagoVillagePokecenterSign:
	jumpstd PokecenterSignScript
	
NagoVillageSign:
	jumptext NagoVillageSignText

NagoVillageHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_NAGO_VILLAGE
	
NagoVillageTeacherScript:
	jumptextfaceplayer NagoVillageTeacherText
	
NagoVillageFishingGuruScript:
	jumptextfaceplayer NagoVillageFishingGuruText
	
NagoVillageFishingGuruText:
	text "Se non altro,"
	line "questo posto è"
	para "fantastico per"
	line "pescare!"
	done
	
NagoVillageTeacherText:
	text "Arrivi in questo"
	line "vilaggio, ma puoi"
	para "andartene quasi"
	line "subito."
	para "Non c'è molto da"
	line "fare qui. Spero"
	para "che almeno ti"
	line "piaccia il posto."
	done
	
NagoVillageSignText:
	text "VILLAGGIO NAGO"
	para "Placido villaggio"
	line "marino."
	done

NagoVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  4, NAGO_POKECENTER_1F, 1
	warp_event 10, 15, NAGO_IMPOSTOR_HOUSE, 1
	warp_event  5, 21, NAGO_CHARMANDER_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  4, BGEVENT_READ, NagoVillagePokecenterSign
	bg_event  9,  2, BGEVENT_ITEM, NagoVillageHiddenBerserkGene
	bg_event  7, 11, BGEVENT_READ, NagoVillageSign

	db 2 ; object events
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageTeacherScript, -1
	object_event 17, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageFishingGuruScript, -1
