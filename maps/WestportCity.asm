	object_const_def ; object_event constants
	const WESTPORTCITY_YOUNGSTER1
	const WESTPORTCITY_COOLTRAINER_F
	const WESTPORTCITY_ROCKER
	const WESTPORTCITY_YOUNGSTER2
	const WESTPORTCITY_LASS
	const WESTPORTCITY_GRAMPS
	const WESTPORTCITY_ROCKET1
	const WESTPORTCITY_ROCKET2
	const WESTPORTCITY_ROCKET3
	const WESTPORTCITY_ROCKET4
	const WESTPORTCITY_ROCKET5
	const WESTPORTCITY_ROCKET6
	const WESTPORTCITY_FAIRY
	const WESTPORTCITY_ROCKETEXTRA

WestportCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_WESTPORT
	setflag ENGINE_REACHED_WESTPORT
	return




WestportCityYoungster1Script:
	jumptextfaceplayer WestportCityYoungster1Text

WestportCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext WestportCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext WestportCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

WestportCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext WestportCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext WestportCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

WestportCityYoungster2Script:
	jumptextfaceplayer WestportCityYoungster2Text

WestportCityLassScript:
	jumptextfaceplayer WestportCityLassText

WestportCityGrampsScript:
	jumptextfaceplayer WestportCityGrampsText

WestportCityRocketScoutScript:
	opentext
	writetext WestportCityRocketScoutText1
	buttonsound
	faceplayer
	writetext WestportCityRocketScoutText2
	waitbutton
	closetext
	end

WestportCityRocket1Script:
	jumptextfaceplayer WestportCityRocket1Text

WestportCityRocket2Script:
	jumptextfaceplayer WestportCityRocket2Text

WestportCityRocket3Script:
	jumptextfaceplayer WestportCityRocket3Text

WestportCityRocket4Script:
	jumptextfaceplayer WestportCityRocket4Text

WestportCityRocket5Script:
	jumptextfaceplayer WestportCityRocket5Text

WestportCityRocket6Script:
	jumptextfaceplayer WestportCityRocket6Text


WestportCityRadioTowerSign:
	jumptext WestportCityRadioTowerSignText

WestportDeptStoreSign:
	jumptext WestportDeptStoreSignText

TeknosGymSign:
	jumptext TeknosGymSignText

WestportCitySign:
	jumptext WestportCitySignText


WestportCityNameRaterSign:
;	setevent EVENT_BEAT_ELITE_FOUR
;	giveitem S_S_TICKET
;	setevent EVENT_FAST_SHIP_FIRST_TIME
;	setevent EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
;	clearevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	jumptext WestportCityNameRaterSignText


WestportCityPokecenterSign:
	jumpstd PokecenterSignScript
	
WestportCityDocksSign:
	jumptext WestportCityDocksSignText
	
WestportCityMonScript:
	faceplayer
	opentext
	writetext WestportCityMonText
	cry BLISSEY
	waitbutton
	closetext
	end
	
RivalAfterRadioTower1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject WESTPORTCITY_ROCKET5, 31, 13
	appear WESTPORTCITY_ROCKET5
	applymovement WESTPORTCITY_ROCKET5, WestportSilverWalksUp1
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTower2:
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject WESTPORTCITY_ROCKET5, 31, 13
	appear WESTPORTCITY_ROCKET5
	applymovement WESTPORTCITY_ROCKET5, WestportSilverWalksUp2
	jump RivalAfterRadioTowerMain
	end
	
RivalAfterRadioTowerMain:
	opentext
	writetext SilverHasItFiguredOut
	waitbutton
	closetext
	showemote EMOTE_SHOCK, WESTPORTCITY_ROCKET5, 15
	opentext
	writetext SilverHasItFiguredOut2
	waitbutton
	closetext
	applymovement WESTPORTCITY_ROCKET5, WestportSilverGetsOutOfHere
	setscene SCENE_DEFAULT
	special RestartMapMusic
	disappear WESTPORTCITY_ROCKET5
	setevent EVENT_SILVER_IN_WESTPORT
	end

WestportSilverGetsOutOfHere:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
WestportSilverWalksUp1:
	step UP
;	step UP
	step UP
	step UP
	step UP
	step_end
	
WestportSilverWalksUp2:
	step UP
;	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

MovementData_0x198a5f:
	step RIGHT
	step RIGHT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverHasItFiguredOut:
	text "<RIVAL>:<PLAYER>!"
	para "Credo di aver"
	line "capito!"
	para "Il TEAM ROCKET"
	line "vuole usare la"
	para "TORRE RADIO al"
	line "posto dell'antenna"
	para "che abbiamo"
	line "distrutto!"
	done
	
SilverHasItFiguredOut2:
	text "Cosa?"
	para "Avevo ragione!"
	para "Ma ti sei già"
	line "liberato di loro?"
	para "Mi sono perso"
	line "tutto il"
	cont "divertimento!"
	para "Credo che tornerò"
	line "ad allenarmi!"
	para "Mi serve solo più"
	line "una MEDAGLIA prima"
	para "di poter scalare"
	line "il MONTE FUJI e"
	cont "sfidare la LEGA!"
	para "In quello arriverò"
	line "prima io!"
	done
	
WestportCityMonText:
	text "BLISSEY:"
	line "BIBI!"
	done
	
WestportCityDocksSignText:
	text "MOLI PORTOVEST"
	para "Traghetti per"
	line "TECNOPOLI."
	done


WestportCityYoungster1Text:
	text "Hanno aperto un"
	line "NEGOZIO BICI, ma"

	para "non riesco a"
	line "trovarlo."
	done

WestportCityCooltrainerF1Text:
	text "Il signore in"
	line "questa casa"
	para "valuta i sopran-"
	line "nomi dei tuoi"
	cont "#MON!"
	para "Ti permette anche"
	line "di darne di nuovi."
	para "Ma non puoi cam-"
	line "biare nome a un"
	para "#MON ottenuto"
	line "da uno scambio."
	done

WestportCityCooltrainerF1Text_ClearedRadioTower:
	text "Il signore in"
	line "questa casa"
	para "valuta i sopran-"
	line "nomi dei tuoi"
	cont "#MON!"
	para "Ti permette anche"
	line "di darne di nuovi."
	para "Ma non puoi cam-"
	line "biare nome a un"
	para "#MON ottenuto"
	line "da uno scambio."
	done

WestportCityCooltrainerF2Text:
	text "La TORRE RADIO di"
	line "PORTOVEST è un"
	para "punto di"
	line "riferimento."

	para "Ora stanno facendo"
	line "una campagna"
	cont "promozionale."

	para "Modificano il tuo"
	line "#GEAR perché"

	para "si possa usare"
	line "come radio."
	done

WestportCityCooltrainerF2Text_GotRadioCard:
	text "Il tuo #GEAR si"
	line "può usare come"
	cont "radio!"
	done

WestportCityYoungster2Text:
	text "E-he-he-he…"

	para "Sono nei guai per"
	line "aver giocato nei"

	para "sotterranei del"
	line "CENTRO"
	cont "COMMERCIALE."
	done

WestportCityLassText:
	text "Il mio BLISSEY"
	line "può curare i"
	para "#MON con una"
	line "mossa."
	para "Alcuni #MON"
	line "hanno mosse che"
	para "si possono usare"
	line "fuori dalla lotta."
	done

WestportCityGrampsText:
	text "Questa città è"
	line "enorme! Non riesco"
	cont "a orientarmi!"
	done

WestportCityRocketScoutText1:
	text "Questa è la"
	line "TORRE RADIO…"
	done

WestportCityRocketScoutText2:
	text "Cosa vuoi,"
	line "piccola peste!"
	cont "Smamma!"
	done

WestportCityRocket1Text:
	text "Stammi lontano!"
	done

WestportCityRocket2Text:
	text "Occupare la"
	line "TORRE RADIO…"

	para "Cosa? Non è"
	line "affar tuo!"
	done

WestportCityRocket3Text:
	text "#MON? Sono"
	line "solo un modo"

	cont "per fare soldi!"
	done

WestportCityRocket4Text:
	text "Il nostro sogno"
	line "si avvererà…"

	para "Ci è voluto così"
	line "tanto…"
	done

WestportCityRocket5Text:
	text "Marmocchio! Non"
	line "stare qui!"
	cont "Vattene!"
	done

WestportCityRocket6Text:
	text "Assapora il"
	line "vero terrore del"
	cont "TEAM ROCKET!"
	done


WestportCityRadioTowerSignText:
	text "TORRE RADIO"
	line "di PORTOVEST"
	done

WestportDeptStoreSignText:
	text "Una completa sele-"
	line "zione di articoli"
	cont "sui #MON!"

	para "CENTRO COMMERCIALE"
	line "di PORTOVEST"
	done

TeknosGymSignText:
	text "PORTOVEST"
	line "CAPOPALESTRA:"
	cont "RAFFAELLO"

	para "Maestro degli"
	line "insetti!"
	done

WestportCitySignText:
	text "PORTOVEST"

	para "Metropoli"
	line "scintillante di"
	cont "NIHON"
	done


WestportCityNameRaterSignText:
	text "GIUDICE ONOMASTICO"

	para "Fate valutare i"
	line "nomi dei vostri"
	cont "#MON!"
	done



UnknownText_0x199042:
	text "Posso insegnare"
	line "ai tuoi #MON"

	para "mosse incredibili,"
	line "se ti va."

	para "Vuoi che insegni"
	line "una nuova mossa?"
	done

UnknownText_0x199090:
	text "Ti costerà"
	line "4000 gettoni."
	cont "Ok?"
	done

UnknownText_0x1990b4:
	text "Oh… Ma sono"
	line "incredibile…"
	done

UnknownText_0x1990ce:
	text "Ahahah! Non te"
	line "ne pentirai!"

	para "Quale mossa"
	line "devo insegnare?"
	done

UnknownText_0x199107:
	text "Hm, peccato."
	line "Dovrò prendere"
	para "del denaro"
	line "da casa…"
	done

UnknownText_0x19913a:
	text "Se capisci cos'è"
	line "così incredibile"

	para "di questa mossa,"
	line "sei un buon"
	cont "allenatore."
	done

UnknownText_0x19918b:
	text "Ahahah!"
	line "Ci si vede!"
	done

UnknownText_0x1991a4:
	text "M-ma…"
	done

UnknownText_0x1991ac:
	text "…You don't have"
	line "enough coins here…"
	done

UnknownText_0x1991cf:
	text_start
	done

WestportCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 14, 19, WESTPORT_GYM, 1
	warp_event 32, 19, WESTPORT_HAPPINESS_RATER, 1
	warp_event 35, 15, ROUTE_102_WEST_GATE, 1
	warp_event 26, 19, WESTPORT_NAME_RATER, 1
	warp_event 13,  5, WESTPORT_DEPT_STORE_1F, 1
	warp_event 31,  7, RADIO_TOWER_1F, 1
	warp_event 22,  5, ROUTE_103_WESTPORT_GATE, 3
	warp_event 25, 14, WESTPORT_POKECENTER_1F, 1
	warp_event 14,  5, WESTPORT_DEPT_STORE_1F, 2
	warp_event 23,  5, ROUTE_103_WESTPORT_GATE, 4
	warp_event 32,  7, RADIO_TOWER_1F, 2
	warp_event 15, 19, WESTPORT_GYM, 2
	warp_event 18, 12, WESTPORT_PP_SPEECH_HOUSE, 1
	warp_event  4,  8, WESTPORT_PORT_PASSAGE, 1
	warp_event  4,  9, WESTPORT_PORT_PASSAGE, 2

	db 2 ; coord events
	coord_event 31,  8, SCENE_WESTPORT_CITY_RIVAL, RivalAfterRadioTower1
	coord_event 32,  8, SCENE_WESTPORT_CITY_RIVAL, RivalAfterRadioTower2

	db 7 ; bg events

	bg_event 28,  9, BGEVENT_READ, WestportCityRadioTowerSign
	bg_event 16,  7, BGEVENT_READ, WestportDeptStoreSign
	bg_event 18, 20, BGEVENT_READ, TeknosGymSign
	bg_event 32, 12, BGEVENT_READ, WestportCitySign
	bg_event 24, 20, BGEVENT_READ, WestportCityNameRaterSign
	bg_event 26, 14, BGEVENT_UP, WestportCityPokecenterSign
	bg_event 12, 10, BGEVENT_READ, WestportCityDocksSign

	db 14 ; object events
	object_event 20, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster1Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 22, 17, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF1Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 27, 10, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityCooltrainerF2Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 12,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportCityYoungster2Script, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 30, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityLassScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityGrampsScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 13,  6, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket1Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 26, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket2Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  6, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 15, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_SILVER_IN_WESTPORT
	object_event 32, 20, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 14, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportCityMonScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event 18, 13, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
