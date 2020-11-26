	object_const_def ; object_event constants
	const BIRDONPOKECENTER1F_NURSE
	const BIRDONPOKECENTER1F_GENTLEMAN
	const BIRDONPOKECENTER1F_FISHING_GURU
	const BIRDONPOKECENTER1F_POKEFAN_F

BirdonPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

BirdonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

BirdonPokecenter1FGentlemanScript:
	jumptextfaceplayer BirdonPokecenter1FGentlemanText

BirdonPokecenter1FFishingGuruScript:
	jumptextfaceplayer BirdonPokecenter1FFishingGuruText

BirdonPokecenter1FPokefanFScript:
	jumptextfaceplayer BirdonPokecenter1FPokefanFText

BirdonPokecenter1FGentlemanText:
	text "I tuoi #MON"
	line "conoscono mosse di"
	cont "MN?"

	para "Queste mosse si"
	line "possono usare"

	para "anche se il #-"
	line "MON è KO."
	done

BirdonPokecenter1FUnusedText:
; unreferenced
	text "Un tale BILL ha"
	line "creato il Sistema"
	cont "Memoria #MON."

	para "Nel PC di BILL"
	line "puoi depositare"
	para "fino a 20 #MON"
	line "per BOX."
	done

BirdonPokecenter1FFishingGuruText:
	text "Nel PC di BILL"
	line "puoi depositare"
	para "fino a 20 #MON"
	line "per BOX."
	done

BirdonPokecenter1FPokefanFText:
	text "Conosci le"
	line "GHICOCCHE?"

	para "Aprine una e"
	line "abbinala ad un"

	para "particolare"
	line "strumento."

	para "In questo modo"
	line "potrai catturare"
	cont "i #MON."

	para "Prima che fossero"
	line "inventate le #,"

	para "BALL, tutti usa-"
	line "vano le GHICOCCHE."
	done

BirdonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BIRDON_TOWN, 1
	warp_event  6,  7, BIRDON_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FNurseScript, -1
	object_event  11,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FGentlemanScript, -1
	object_event  10,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonPokecenter1FPokefanFScript, -1
