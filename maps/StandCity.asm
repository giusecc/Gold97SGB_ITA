	object_const_def ; object_event constants
	const STANDCITY_ROCKER
	const STANDCITY_POKEFAN_M
	const STANDCITY_TWIN
	const STANDCITY_TEACHER
	const STANDCITY_FRUIT_TREE
	const STANDCITY_MONSTER1
	const STANDCITY_MONSTER2
	const STANDCITY_MONSTER3
	const STANDCITY_BIRD
	const STANDCITY_FAIRY
	const STANDCITY_BLOCKROCKET1
;	const STANDCITY_BLOCKROCKET2
;	const STANDCITY_BLOCKROCKET3
;	const STANDCITY_BLOCKROCKET4
	const STANDCITY_IMPOSTOR
	const STANDCITY_HQBLOCKROCKET
	const STANDCITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .StandCityBlockFence

.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_STAND
	return
	
.StandCityBlockFence:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .Done20
	changeblock  29, 35, $4C ; rock
	changeblock  31, 35, $39 ; rock
.Done20:
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:
	moveobject STANDCITY_TEACHER, 27, 23
	moveobject STANDCITY_TWIN, 29, 23
	moveobject STANDCITY_ROCKER, 28, 24
	moveobject STANDCITY_POKEFAN_M, 27, 25
	appear STANDCITY_POKEFAN_M
	appear STANDCITY_ROCKER
	appear STANDCITY_TWIN
	applymovement PLAYER, ImposterSceneMove2
	turnobject STANDCITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject STANDCITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 25
	turnobject STANDCITY_TEACHER, UP
	pause 3
	turnobject STANDCITY_ROCKER, UP
	pause 3
	turnobject STANDCITY_POKEFAN_M, UP
	pause 30
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	moveobject STANDCITY_IMPOSTOR, 29, 19
	appear STANDCITY_IMPOSTOR
	applymovement STANDCITY_IMPOSTOR, ImposterWalksDown
	pause 10
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement STANDCITY_IMPOSTOR, ImposterWalksUp
	disappear STANDCITY_IMPOSTOR
	setevent EVENT_JADE_FOREST_APPRENTICE
	setscene SCENE_DEFAULT
	playmusic MUSIC_KANTO_REGION
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket2:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket2AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket2AfterImposter
	writetext BlockRocket2BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket2AfterBase
	writetext BlockRocket2AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket2AfterImposter
	writetext BlockRocket2AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket4:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket4AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket4AfterImposter
	writetext BlockRocket4BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket4AfterBase
	writetext BlockRocket4AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket4AfterImposter
	writetext BlockRocket4AfterText
	waitbutton
	closetext
	end
	

StandCitySign:
	jumptext StandCitySignText

OldFuchsiaGymSign:
	jumptext OldFuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

SafariZoneClefairySign:
	jumptext SafariZoneClefairySignText
	
SafariZoneAmpharosSign:
	jumptext SafariZoneAmpharosSignText
	
SafariZoneSkarmorySign:
	jumptext SafariZoneSkarmorySignText
	
SafariZoneGolduckSign:
	jumptext SafariZoneGolduckSignText

NoLitteringSign:
	jumptext NoLitteringSignText

StandCityPokecenterSign:
;	setevent EVENT_STAND_CITY_ZOO_MONS
;	clearevent EVENT_JADE_FOREST_APPRENTICE
;	clearevent EVENT_JADE_FOREST_LASS
	jumpstd PokecenterSignScript

StandCityMartSign:
	jumpstd MartSignScript

StandCityFruitTree:
	fruittree FRUITTREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
	text "Mi sento sempre"
	line "escluso…"
	para "Nessuno mi dice"
	line "cosa sta"
	cont "succedendo…"
	done
	
BlockRocket4AfterBaseText:
	text "Se ne sono andati"
	line "tutti?"
	para "Ha a che vedere"
	line "con te?"
	done

BlockRocket3AfterBaseText:
	text "Dicono che la"
	line "squadra di"
	para "PORTOVEST sia"
	line "stata sconfitta?"
	para "Cosa vuol dire?"
	para "Cos'è successo"
	line "alla base?"
	done
	
BlockRocket2AfterBaseText:
	text "Davvero?"
	para "Dicono che la"
	line "base sia vuota."
	para "Perché siamo"
	line "qui, allora?"
	done
	
BlockRocket1AfterBaseText:
	text "La base è vuota?"
	para "Dove sono"
	line "finiti tutti?"
	done
	
StandCityHQBlockRocketText:
	text "Odiamo tutti fare"
	line "la guardia qui."
	para "Il mio turno è"
	line "quasi finito."
	para "Spero che il"
	line "mio sostituto"
	cont "arrivi presto…"
	done
	
StandCityNationalBlockRocketText:
	text "Nessuno deve"
	line "entrare al PARCO"
	cont "NAZIONALE ora!"
	para "Non finché i #-"
	line "MON staranno male."
	para "Mi prendo cura"
	line "della loro salute."
	done
	
BlockRocket1BeforeText:
	text "Non c'è niente a"
	line "sud di qui!"
	para "Bisogna rimanere"
	line "in città!"
	para "Abbiamo un ospite"
	line "d'eccezione!"
	done

BlockRocket1AfterText:
	text "Ragazzo!"
	para "Non è stato un"
	line "discorso incredi-"
	para "bile del vero e"
	line "originale"
	cont "PROF.OAK?"
	done
	
BlockRocket2BeforeText:
	para "Bisogna rimanere"
	line "in città!"
	para "Arriverà un"
	line "ospite fantastico!"
	done
	
BlockRocket2AfterText:
	text "La nostra ricerca"
	line "salverà il mondo!"
	done
	
BlockRocket3BeforeText:
	text "Non c'è niente a"
	line "sud di qui!"
	para "Bisogna rimanere"
	line "in città!"
	done
	
BlockRocket3AfterText:
	text "Tutti amano il"
	line "PROF.OAK!"
	done
	
BlockRocket4BeforeText:
	text "È quasi tempo di"
	line "mostrare al mondo"
	cont "il nostro piano!"
	done
	
BlockRocket4AfterText:
	text "Stiamo facendo"
	line "grandi cose, non"
	cont "hai sentito?"
	done
	
ImposterText1:
	text "Cittadini di"
	line "INERTOPOLI!"
	done
	
ImposterText2:
	text "Sono io, il"
	line "celebre PROF.OAK!"
	para "Ho delle notizie"
	line "fantastiche su"
	para "una nuova scoperta"
	line "sui #MON!"
	para "Ho collaborato"
	line "col TEAM ROCKET"
	para "per sviluppare"
	line "questa tecnologia!"
	done
	
ImposterText3:
	text "Non preoccupatevi!"
	para "Il TEAM ROCKET sta"
	line "facendo un ottimo"
	para "lavoro nel gene-"
	line "rare un segnale"
	para "radio in grado di"
	line "leggere le menti"
	cont "dei #MON!"
	para "E il segnale ar-"
	line "riva da qui,"
	cont "INERTOPOLI!"
	para "Anche se il"
	line "segnale potrebbe"
	para "far star male i"
	line "#MON esposti…"
	para "…"
	para "Ma non fateci"
	line "caso!"
	para "Staranno bene!"
	para "I risultati di"
	line "questa ricerca ci"
	para "permetterà di"
	line "capire a fondo"
	cont "i #MON!"
	para "Fidatevi di me,"
	line "come vedete sono"
	cont "il PROF.OAK."
	para "È tutto!"
	done

StandCityRockerText:
	text "I #MON che si"
	line "trovano allo"
	para "ZOO non stanno"
	line "bene."
	para "Gli ufficiali"
	line "del parco li"
	para "stanno tenendo"
	line "nel loro CENTRO"
	cont "#MON."
	done
	
StandCityRockerAllGoodText:
	text "Non era il"
	line "vero PROF.OAK?"
	para "Pazzesco!"
	para "Sono contento"
	line "che i #MON"
	cont "stiano meglio."
	done
	
StandCityRockerImposterText:
	text "La causa di tutto"
	line "questo è il TEAM"
	cont "ROCKET?"
	para "Ma il PROF.OAK ha"
	line "detto che staranno"
	para "bene e fa tutto"
	line "parte della"
	cont "ricerca…"
	para "E io mi fido."
	done

StandCityPokefanMText:
	text "Che tristezza"
	line "che i #MON non"
	cont "siano fuori."
	para "Ma è più impor-"
	line "tante che si"
	para "rimettano in"
	line "sesto."
	done
	
StandCityPokefanImposterText:
	text "Il PROF.OAK è"
	line "responsabile"
	para "di questa"
	line "malattia?"
	para "Deve avere un"
	line "buon motivo…"
	done
	
StandCityPokefanAllGoodText:
	text "Sono felice che"
	line "i #MON si siano"
	cont "ripresi!"
	done

StandCityTwinText:
	text "Lo ZOO è"
	line "chiuso…"
	
	para "Che tristezza,"
	line "è l'attrazione"
	para "principale di"
	line "INERTOPOLI."
	
	para "Spero che i #-"
	line "MON stiano bene."
	done
	
StandCityTwinImposterText:
	text "Il TEAM ROCKET è"
	line "tornato?"
	para "E con il PROF.OAK?"
	para "Non può essere"
	line "vero…"
	done
	
StandCityTwinAllGoodText:
	text "Sìì! Lo ZOO ha"
	line "riaperto!"
	done

StandCityTeacherText:
	text "Cosa ci fanno"
	line "questi membri"
	para "del TEAM"
	line "ROCKET qui?"
	para "Ho paura!"
	done
	
StandCityTeacherImposterText:
	text "C'era qualcosa di"
	line "strano nel"
	cont "PROF.OAK…"
	done

StandCityTeacherAllGoodText:
	text "Sono felice che"
	line "sia tutto tornato"
	cont "alla normalità"
	done

StandCitySignText:
	text "INERTOPOLI"

	para "Utopia di"
	line "persone e #MON"
	done

OldFuchsiaGymSignText:
	text "INERTOPOLI"
	line "CAPOPALESTRA:"
	cont "ANGELO"

	para "Il ragazzo che"
	line "si cela nel"
	cont "buio"
	done

SafariZoneOfficeSignText:
	text "C'è un cartello"
	line "qui…"

	para "UFFICIO ZONA"
	line "SAFARI chiuso"
	para "fino a nuove"
	line "disposizioni."
	done

WardensHomeSignText:
	text "ZOO INERTOPOLI"
	line "Centro Medico"
	done

SafariZoneClosedSignText:
	text "#MON:"
	line "KANGASKHAN"
	para "Se è al sicuro, il"
	line "piccolo esce dal"
	para "marsupio e inizia"
	line "a giocare sotto"
	para "gli occhi vigili"
	line "dell'adulto."
	done

SafariZoneClefairySignText:
	text "#MON:"
	line "CLEFAIRY"
	para "Sembra che la luce"
	line "lunare che racco-"
	para "glie nelle ali sul"
	line "dorso gli permetta"
	para "di volare"
	line "a mezz'aria."
	done
	
SafariZoneAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"
	para "La punta della,"
	line "coda è molto lumi-"
	para "nosa, visibile da"
	line "grandi distanze."
	para "Fa da segnale per"
	line "chi si è perso."
	done
	
SafariZoneSkarmorySignText:
	text "#MON:"
	line "SKARMORY"
	para "Le imponenti ali"
	line "sembrano pesanti,"
	para "ma in realtà sono"
	line "vuote e leggere, e"
	para "lo fanno volare"
	line "libero nel cielo."
	done
	
SafariZoneGolduckSignText:
	text "#MON:"
	line "GOLDUCK"
	para "Quando nuota a"
	line "tutta velocità con"
	para "i suoi lunghi arti"
	line "palmati, la fronte"
	para "gli diventa"
	line "incandescente."
	done

NoLitteringSignText:
	text "ZOO INERTOPOLI"
	line "Ufficio centrale"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_CITY_ZOO_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  1,  0, SAFARI_ZONE_STAND_GATE_BETA, 3 ; inaccessible
	warp_event 30, 13, ROUTE_112_STAND_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_GATE, 4
	warp_event  6, 17, STAND_CITY_NATIONAL_PARK_GATE, 4
	warp_event  0,  0, MERIDIAN_PATH_RYUKYU_GATE, 2
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_POKE, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro1
	coord_event  35, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro2

	db 12 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, OldFuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 24, 20, BGEVENT_READ, WardensHomeSign
	bg_event  8,  8, BGEVENT_READ, SafariZoneClosedSign
	bg_event 18, 21, BGEVENT_READ, NoLitteringSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, SafariZoneClefairySign
	bg_event 20, 10, BGEVENT_READ, SafariZoneAmpharosSign
	bg_event 16, 16, BGEVENT_READ, SafariZoneSkarmorySign
	bg_event 10, 20, BGEVENT_READ, SafariZoneGolduckSign

	db 14 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 28, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
;	object_event 28, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket2, EVENT_CLEARED_RADIO_TOWER
;	object_event 30, 35, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket3, EVENT_CLEARED_RADIO_TOWER
;	object_event 31, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket4, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_OLD_FUCHSIA_GYM_1, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 32, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_CHUCK
	object_event  6, 18, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

