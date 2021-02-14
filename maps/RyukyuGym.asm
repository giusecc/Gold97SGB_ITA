	object_const_def ; object_event constants
	const RYUKYU_GYM_LASS
	const RYUKYU_GYM_YOUNGSTER
	const RYUKYU_GYM_POKEFAN_M
	const SAFFROM_GYM_GYM_GUY


RyukyuGym_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RyukyuGymTypeChange
	
.RyukyuGymTypeChange:
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .GrassGym
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .FireGym
	jump .doneGym
.GrassGym:
	changeblock  3, 1, $3F ; grass
	changeblock  5, 1, $7D ; grass
	changeblock  3, 3, $3F ; grass
	changeblock  5, 3, $3F ; grass
	changeblock  3, 5, $3F ; grass
	changeblock  5, 5, $7D ; grass
	changeblock  3, 7, $3F ; grass
	changeblock  5, 7, $3F ; grass
	changeblock  3, 9, $3F ; grass
	changeblock  5, 9, $7D ; grass
	changeblock  3, 11, $3F ; grass
	changeblock  5, 11, $3F ; grass
	changeblock  3, 13, $3F ; grass
	changeblock  5, 13, $7D ; grass
	changeblock  3, 15, $3F ; grass
	changeblock  5, 15, $3F ; grass
	changeblock  3, 17, $3F ; grass
	changeblock  5, 17, $7D ; grass
	changeblock  13, 1, $7D ; grass
	changeblock  15, 1, $3F ; grass
	changeblock  13, 3, $3F ; grass
	changeblock  15, 3, $3F ; grass
	changeblock  13, 5, $7D ; grass
	changeblock  15, 5, $3F ; grass
	changeblock  13, 7, $3F ; grass
	changeblock  15, 7, $3F ; grass
	changeblock  13, 9, $7D ; grass
	changeblock  15, 9, $3F ; grass
	changeblock  13, 11, $3F ; grass
	changeblock  15, 11, $3F ; grass
	changeblock  13, 13, $7D ; grass
	changeblock  15, 13, $3F ; grass
	changeblock  13, 15, $3F ; grass
	changeblock  15, 15, $3F ; grass
	changeblock  13, 17, $7D ; grass
	changeblock  15, 17, $3F ; grass
	return
	
.FireGym:
	changeblock  3, 1, $3B ; fire
	changeblock  5, 1, $59 ; fire
	changeblock  3, 3, $3B ; fire
	changeblock  5, 3, $3B ; fire
	changeblock  3, 5, $3B ; fire
	changeblock  5, 5, $59 ; fire
	changeblock  3, 7, $3B ; fire
	changeblock  5, 7, $3B ; fire
	changeblock  3, 9, $3B ; fire
	changeblock  5, 9, $59 ; fire
	changeblock  3, 11, $3B ; fire
	changeblock  5, 11, $3B ; fire
	changeblock  3, 13, $3B ; fire
	changeblock  5, 13, $59 ; fire
	changeblock  3, 15, $3B ; fire
	changeblock  5, 15, $3B ; fire
	changeblock  3, 17, $3B ; fire
	changeblock  5, 17, $59 ; fire
	changeblock  13, 1, $59 ; fire
	changeblock  15, 1, $3B ; fire
	changeblock  13, 3, $3B ; fire
	changeblock  15, 3, $3B ; fire
	changeblock  13, 5, $59 ; fire
	changeblock  15, 5, $3B ; fire
	changeblock  13, 7, $3B ; fire
	changeblock  15, 7, $3B ; fire
	changeblock  13, 9, $59 ; fire
	changeblock  15, 9, $3B ; fire
	changeblock  13, 11, $3B ; fire
	changeblock  15, 11, $3B ; fire
	changeblock  13, 13, $59 ; fire
	changeblock  15, 13, $3B ; fire
	changeblock  13, 15, $3B ; fire
	changeblock  15, 15, $3B ; fire
	changeblock  13, 17, $59 ; fire
	changeblock  15, 17, $3B ; fire
	return
	
.doneGym
	return
	

	
RyukyuGymPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .GotHappaGiveFlambear
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .GotCruiseGiveHappa
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymWater
	writetext PokefanMBeforeTextWater
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, TREVOR
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymWater
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Water
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CRUISEAL, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotHappaGiveFlambear
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymFire
	writetext PokefanMBeforeTextFire
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer HIKER, BAILEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymFire
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Fire
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg FLAMBEAR, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Fire
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.GotCruiseGiveHappa
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattleFakeGymGrass
	writetext PokefanMBeforeTextGrass
	waitbutton
	closetext
	winlosstext PokefanMWinTextFake, PokefanMLossTextFake
	loadtrainer POKEFANM, CARTER
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	opentext
.AfterBattleFakeGymGrass
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Grass
	writetext HaveStarter2Egg
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg HAPPA, 5
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Grass
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.PartyFullStarter2
	writetext NoRoomForStarter2
	waitbutton
	closetext
	end
	
.GetStarter2Egg:
	jumpstd ReceiveTogepiEggScript
	end
	
.eggname2
	db "UOVO@"
	
Trainer1Scene:
	playmusic MUSIC_BEAUTY_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_LASS, 30
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Trainer1GotHappaUseFire
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Trainer1GotCruiseUseGrass
	writetext LassTextBeforeWater
	waitbutton
	closetext
	winlosstext LassWinTextWater, LassLossTextWater
	loadtrainer LASS, LINDA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotHappaUseFire
	writetext LassTextBeforeFire
	waitbutton
	closetext
	winlosstext LassWinTextFire, LassLossTextFire
	loadtrainer LASS, ALICE
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
.Trainer1GotCruiseUseGrass
	writetext LassTextBeforeGrass
	waitbutton
	closetext
	winlosstext LassWinTextGrass, LassLossTextGrass
	loadtrainer PICNICKER, TANYA
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_TRAINER_2
	end
	
Trainer2Scene:
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	showemote EMOTE_SHOCK, RYUKYU_GYM_YOUNGSTER, 30
	opentext
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Trainer2GotHappaUseFire
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeWater
	waitbutton
	closetext
	winlosstext YoungsterWinTextWater, YoungsterLossTextWater
	loadtrainer SCHOOLBOY, KIPP
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotHappaUseFire
	writetext YoungsterTextBeforeFire
	waitbutton
	closetext
	winlosstext YoungsterWinTextFire, YoungsterLossTextFire
	loadtrainer YOUNGSTER, JASON
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end

.Trainer2GotCruiseUseGrass
	writetext YoungsterTextBeforeGrass
	waitbutton
	closetext
	winlosstext YoungsterWinTextGrass, YoungsterLossTextGrass
	loadtrainer YOUNGSTER, OWEN
	startbattle
	reloadmapafterbattle
	setscene SCENE_RYUKYU_GYM_NOTHING
	end
	
RyukyuGymYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Trainer2AfterFire
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Trainer2AfterGrass
	writetext Trainer2AfterWaterText
	waitbutton
	closetext
	end
.Trainer2AfterFire
	writetext Trainer2AfterFireText
	waitbutton
	closetext
	end
.Trainer2AfterGrass
	writetext Trainer2AfterGrassText
	waitbutton
	closetext
	end
	
RyukyuGymLassScript:
	jumptextfaceplayer RyukyuGymLassText
	
RyukyuGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .GymGuyFire
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .GymGuyGrass
	writetext GymGuyWaterText
	waitbutton
	closetext
	end
.GymGuyFire
	writetext GymGuyFireText
	waitbutton
	closetext
	end
.GymGuyGrass
	writetext GymGuyGrassText
	waitbutton
	closetext
	end
.GymGuyFakeGymAfter
	writetext GymGuyFakeGymAfterText
	waitbutton
	closetext
	end

GymGuyFakeGymAfterText:
	text "È sempre bello"
	line "affrontare una"
	para "PALESTRA, anche"
	line "senza una"
	para "MEDAGLIA da"
	line "vincere."
	done
	
GymGuyFireText:
	text "Cos'è questa?"
	para "Una PALESTRA?"
	para "Non proprio."
	para "PAT ha sempre"
	line "sognato di essere"
	cont "un CAPOPALESTRA."
	para "Tuttavia, è molto"
	line "difficile rendere"
	para "il tutto"
	line "ufficiale."
	para "Ma noi facciamo"
	line "la nostra parte,"
	para "finché non sarà"
	line "realtà!"
	para "Oh, sì. PAT usa"
	line "#MON FUOCO."
	para "Di sicuro sai"
	line "cosa ti serve"
	cont "per vincere."
	done
	
GymGuyWaterText:
	text "Cos'è questa?"
	para "Una PALESTRA?"
	para "Non proprio."
	para "SAVERIO ha sempre"
	line "sognato di essere"
	cont "un CAPOPALESTRA."
	para "Tuttavia, è molto"
	line "difficile rendere"
	para "il tutto"
	line "ufficiale."
	para "Ma noi facciamo"
	line "la nostra parte,"
	para "finché non sarà"
	line "realtà!"
	para "Oh, sì. SAVERIO"
	line "usa #MON ACQUA."
	para "Di sicuro sai"
	line "cosa ti serve"
	cont "per vincere."
	done
	
GymGuyGrassText:
	text "Cos'è questa?"
	para "Una PALESTRA?"
	para "Non proprio."
	para "GERMANO ha sempre"
	line "sognato di essere"
	cont "un CAPOPALESTRA."
	para "Tuttavia, è molto"
	line "difficile rendere"
	para "il tutto"
	line "ufficiale."
	para "Ma noi facciamo"
	line "la nostra parte,"
	para "finché non sarà"
	line "realtà!"
	para "Oh, sì. GERMANO"
	line "usa #MON ERBA."
	para "Di sicuro sai"
	line "cosa ti serve"
	cont "per vincere."
	done
	
RyukyuGymLassText:
	text "Non è divertente?"
	para "È proprio come"
	line "una PALESTRA!"
	done
	
Trainer2AfterFireText:
	text "PAT ha sempre"
	line "voluto essere un"
	cont "CAPOPALESTRA."
	para "Ma è difficile"
	line "avere la giusta"
	cont "autorizzazione."
	done
	
Trainer2AfterGrassText:
	text "SAVERIO ha sempre"
	line "voluto essere un"
	cont "CAPOPALESTRA."
	para "Ma è difficile"
	line "avere la giusta"
	cont "autorizzazione."
	done
	
Trainer2AfterWaterText:
	text "GERMANO ha sempre"
	line "voluto essere un"
	cont "CAPOPALESTRA."
	para "Ma è difficile"
	line "avere la giusta"
	cont "autorizzazione."
	done

TakeGoodCareOfStarter2:
	text "Prenditi cura di"
	line "quel #MON!"
	para "È del mio tipo"
	line "preferito!"
	done
	
HaveStarter2Egg:
	text "Che bella lotta!"
	para "Mi sento un vero"
	line "CAPOPALESTRA,"
	cont "anche se ho perso."
	para "Non posso darti"
	line "una MEDAGLIA, ma"
	para "ho un UOVO di un"
	line "#MON raro del"
	para "mio tipo"
	line "preferito!"
	cont "Ecco, tieni!"
	done
	
NoRoomForStarter2:
	text "Oh, aspetta! Ti"
	line "serve più spazio!"
	done
	
	
PokefanMBeforeTextWater:
	text "Salve!"
	para "Benvenuto nella"
	line "mia PALESTRA!"
	para "…Beh, non è"
	line "ufficiale."
	para "Ma lo sarà!"
	para "Diventerò un"
	line "CAPOPALESTRA!"
	para "Per ora posso solo"
	line "recitare la parte."
	para "Non c'è niente di"
	line "meglio di una"
	cont "bella lotta!"
	para "I #MON ACQUA"
	line "sono i miei"
	cont "preferiti!"
	para "Sei pronto?"
	done

PokefanMLossTextFake:
	text "Sono bravo, però!"
	done
	
PokefanMWinTextFake:
	text "Ahah! Che bella"
	line "lotta!"
	done

	
PokefanMBeforeTextGrass:
	text "Salve!"
	para "Benvenuto nella"
	line "mia PALESTRA!"
	para "…Beh, non è"
	line "ufficiale."
	para "Ma lo sarà!"
	para "Diventerò un"
	line "CAPOPALESTRA!"
	para "Per ora posso solo"
	line "recitare la parte."
	para "Non c'è niente di"
	line "meglio di una"
	cont "bella lotta!"
	para "I #MON ERBA"
	line "sono i miei"
	cont "preferiti!"
	para "Sei pronto?"
	done


	
PokefanMBeforeTextFire:
	text "Salve!"
	para "Benvenuto nella"
	line "mia PALESTRA!"
	para "…Beh, non è"
	line "ufficiale."
	para "Ma lo sarà!"
	para "Diventerò un"
	line "CAPOPALESTRA!"
	para "Per ora posso solo"
	line "recitare la parte."
	para "Non c'è niente di"
	line "meglio di una"
	cont "bella lotta!"
	para "I #MON FUOCO"
	line "sono i miei"
	cont "preferiti!"
	para "Sei pronto?"
	done
	
YoungsterTextBeforeWater:
	text "Tu nuoti?"
	line "I miei #MON"
	para "sì."
	done
	
YoungsterLossTextWater:
	text "Yahoo!"
	done
	
YoungsterWinTextWater:
	text "Sembra che tu"
	line "sappia camminare"
	cont "sulle acque!"
	done

YoungsterTextBeforeFire:
	text "Puoi sopportare"
	line "il calore?"
	done
	
YoungsterLossTextFire:
	text "Yahoo!"
	done
	
YoungsterWinTextFire:
	text "Mi sono"
	line "bruciato!"
	done

YoungsterTextBeforeGrass:
	text "Non ti inciampare"
	line "sulle liane!"
	done
	
YoungsterLossTextGrass:
	text "Yahoo!"
	done
	
YoungsterWinTextGrass:
	text "Sono caduto!"
	done
	
LassTextBeforeGrass:
	text "Non è bellissimo"
	line "qui?"
	para "Ho portato qual-"
	line "cosa per fare"
	cont "un picnic!"
	done
	
LassLossTextGrass:
	text "Yahoo!"
	
LassWinTextGrass:
	text "L'aria è ancora"
	line "profumata."
	done
	
LassTextBeforeWater:
	text "Attento, il"
	line "pavimento è"
	cont "bagnato!"
	done
	
LassLossTextWater:
	text "Yahoo!"
	
LassWinTextWater:
	text "Sono scivolato!"
	done
	
LassTextBeforeFire:
	text "Niente meglio di"
	line "un stanza calda"
	cont "per una lotta!"
	done
	
LassLossTextFire:
	text "Yahoo!"
	
LassWinTextFire:
	text "Troppo calda!"
	done
	
RyukyuGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 9
	warp_event  9, 17, RYUKYU_CITY, 10


	db 2 ; coord events
	coord_event  8, 11, SCENE_DEFAULT, Trainer1Scene
	coord_event  7,  7, SCENE_RYUKYU_GYM_TRAINER_2, Trainer2Scene

	db 0 ; bg events

	db 4 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymLassScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymYoungsterScript, -1
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuGymGuyScript, -1
