	object_const_def ; object_event constants
	const MEW_SPOT_2
	const MEW_SPOT_3
	const MEW_SPOT_4
	const MEW_SPOT_6
	const MEW_SPOT_7
	const MEW_SPOT_8
	const TI_SLOWKING

TropicalIslandOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MewTextCommon2:
	text "MEW!"
	done

MewSpot2Script:
	opentext
	writetext MewTextCommon2
	cry MEW
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_2
	special FadeInQuickly
	setevent EVENT_MEW_SPOT_2_FOUND
	setevent EVENT_SLOWKING_HINT_3
	appear MEW_SPOT_3
	clearevent EVENT_MEW_SPOT_3_FOUND
	end

MewSpot3Script:
	opentext
	writetext MewTextCommon2
	cry MEW
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_3
	special FadeInQuickly
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_SLOWKING_HINT_4
	appear MEW_SPOT_4
	clearevent EVENT_MEW_SPOT_4_FOUND
	end

MewSpot4Script:
	opentext
	writetext MewTextCommon2
	cry MEW
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_4
	special FadeInQuickly
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_SLOWKING_HINT_5
	clearevent EVENT_MEW_SPOT_5_FOUND
	end

MewSpot6Script:
	opentext
	writetext MewTextCommon2
	cry MEW
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_6
	special FadeInQuickly
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_SLOWKING_HINT_7
	appear MEW_SPOT_7
	clearevent EVENT_MEW_SPOT_7_FOUND
	end

MewSpot7Script:
	opentext
	writetext MewTextCommon2
	cry MEW
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_7
	special FadeInQuickly
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_SLOWKING_HINT_8
	appear MEW_SPOT_8
	clearevent EVENT_MEW_SPOT_8_FOUND
	end

MewTextPrebattle:
	text "MEEEWW!"
	done

MewSpot8Script:
	opentext
	writetext MewTextPrebattle
	cry MEW
	waitbutton
	pause 15
	closetext
	setevent EVENT_MEW_FOUGHT
	setevent EVENT_MEW_SPOT_8_FOUND
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDSWISLANDS
	loadwildmon MEW, 5
	startbattle
	disappear MEW_SPOT_8
	reloadmapafterbattle
	end
	

SlowkingScript:
	faceplayer
	opentext
	checkevent EVENT_MEW_FOUGHT
	iftrue .SlowkingFinal
	checkevent EVENT_SLOWKING_HINT_8
	iftrue .Hint8
	checkevent EVENT_SLOWKING_HINT_7
	iftrue .Hint7
	checkevent EVENT_SLOWKING_HINT_6
	iftrue .Hint6
	checkevent EVENT_SLOWKING_HINT_5
	iftrue .Hint5
	checkevent EVENT_SLOWKING_HINT_4
	iftrue .Hint4
	checkevent EVENT_SLOWKING_HINT_3
	iftrue .Hint3
	checkevent EVENT_SLOWKING_HINT_2
	iftrue .Hint2
	writetext SlowkingHint1Text
	jump .finish
.Hint8
	writetext SlowkingHint8Text
	jump .finish
.Hint7
	writetext SlowkingHint7Text
	jump .finish
.Hint6
	writetext SlowkingHint6Text
	jump .finish
.Hint5
	writetext SlowkingHint5Text
	jump .finish
.Hint4
	writetext SlowkingHint4Text
	jump .finish
.Hint3
	writetext SlowkingHint3Text
	jump .finish
.Hint2
	writetext SlowkingHint2Text
	jump .finish
.SlowkingFinal
	writetext SlowkingFinalText
.finish
	waitbutton
	closetext
	end
	
	
SlowkingHint1Text:
	text "…"
	line "Slow…"
	
	para "SLOWKING indica"
	line "la giungla…"
	done

SlowkingHint2Text:
	text "SLOWKING indica"
	line "il punto a"
	cont "nord-est dell'"
	cont "isola…"
	done

SlowkingHint3Text:
	text "SLOWKING indica"
	line "in alto al"
	cont "centro dell'"
	cont "isola…"
	done

SlowkingHint4Text:
	text "SLOWKING indica"
	line "a ovest"
	cont "dell'isola…"
	done

SlowkingHint5Text:
	text "SLOWKING indica"
	line "di nuovo"
	cont "la giungla…"
	done

SlowkingHint6Text:
	text "SLOWKING indica"
	line "la spiaggia…"
	done

SlowkingHint7Text:
	text "SLOWKING indica"
	line "l'estremo nord"
	cont "dell'isola…"
	done
	
SlowkingHint8Text:
	text "SLOWKING indica"
	line "il punto più"
	cont "alto dell'"
	cont "isola…"
	done

SlowkingFinalText:
	text "… … …"
	
	para "SLOWKING annuisce"
	line "in segno di"
	cont "approvazione…"
	done

TropicalIslandOutside_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 36, 38, TROPICAL_ISLAND_JUNGLE, 1
	warp_event 37, 38, TROPICAL_ISLAND_JUNGLE, 2
	warp_event 45, 24, TROPICAL_ISLAND_JUNGLE, 3
	warp_event 44, 24, TROPICAL_ISLAND_JUNGLE, 4
	warp_event 28, 34, TROPICAL_ISLAND_JUNGLE, 5
	warp_event 29, 34, TROPICAL_ISLAND_JUNGLE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 55, 15, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot2Script, EVENT_MEW_SPOT_2_FOUND
	object_event 28, 20, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot3Script, EVENT_MEW_SPOT_3_FOUND
	object_event  3, 22, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot4Script, EVENT_MEW_SPOT_4_FOUND
	object_event 51, 34, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot6Script, EVENT_MEW_SPOT_6_FOUND
	object_event 37,  7, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot7Script, EVENT_MEW_SPOT_7_FOUND
	object_event 26,  5, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewSpot8Script, EVENT_MEW_SPOT_8_FOUND
	object_event 51, 47, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowkingScript, -1
	
