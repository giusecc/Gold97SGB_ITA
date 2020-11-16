	object_const_def ; object_event constants
	const CROWNPATH_SILVER

CrownPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWNPATH_SILVER, DOWN
	pause 15
	applymovement CROWNPATH_SILVER, UndergroundSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .happa
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.happa
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, UndergroundPlayer1StepToTheSide
	applymovement CROWNPATH_SILVER, UndergroundSilverLeavesMovement
	disappear CROWNPATH_SILVER
	setscene SCENE_UNDERGROUND_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWNCITY_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PATH_HIDDEN_FULL_RESTORE

CrownPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PATH_HIDDEN_X_SPECIAL
	
UndergroundSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
UndergroundPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end
	
UndergroundSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
UndergroundSilverBeforeText:
	text "Ehi, <PLAYER>!"
	para "…"
	para "Vuoi scalare il"
	line "MONTE FUJI, vero?"
	para "È stato un lungo"
	line "viaggio."
	para "Ne abbiamo passate"
	line "molte."
	para "I tuoi #MON"
	line "sono pronti?"
	para "I miei #MON"
	line "sono pronti?"
	para "Scopriamolo"
	line "adesso!"
	para "Una lotta tra"
	line "amici!"
	done
	
UndergroundSilverWinText:
	text "…"
	done
	
UndergroundSilverLossText:
	text "…"
	done
	
UndergroundSilverAfterText:
	text "Sai, ho capito"
	line "qualcosa."
	para "Ero troppo con-"
	line "centrato sulla"
	cont "LEGA #MON."
	para "Volevo solo avere"
	line "i #MON più"
	cont "forti."
	para "Volevo essere"
	line "il migliore"
	cont "allenatore."
	para "Volevo solo bat-"
	line "tere gli altri"
	para "allenatori per"
	line "provare la mia"
	cont "forza."
	para "Ma avere a che"
	line "fare con il TEAM"
	para "ROCKET mi ha"
	line "fatto riflettere."
	para "Loro vedono i"
	line "#MON come armi"
	cont "da sfruttare."
	para "E, mentre le loro"
	line "erano ambizioni"
	para "malvagie, le mie"
	line "erano egoiste."
	para "Ho realizzato di"
	line "trattare i #-"
	para "MON allo stesso"
	line "modo."
	para "Per me, la mia"
	line "squadra era solo"
	cont "simbolo di forza."
	para "Ma non si devono"
	line "allenare i #MON"
	cont "in questo modo."
	para "Ho capito che"
	line "devo trattarli"
	cont "con amore."
	para "Non credo di es-"
	line "sere pronto per"
	para "affrontare la LEGA"
	line "prima di aver"
	para "imparato ad essere"
	line "un miglior allena-"
	para "tore per i miei"
	line "#MON."
	para "Ci vorrà del tempo"
	line "per farcela."
	para "Farò sì che i"
	line "miei #MON siano"
	para "preparati per"
	line "la sfida, in modo"
	para "da poter lottare"
	line "come una squadra!"
	para "Ci vedremo"
	line "presto."
	done

CrownPath_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 33, VICTORY_ROAD_GATE, 3
	warp_event 11, 33, VICTORY_ROAD_GATE, 4
	warp_event 11,  1, CROWN_CITY, 1
	warp_event 12,  1, CROWN_CITY, 2

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPathHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPathHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
