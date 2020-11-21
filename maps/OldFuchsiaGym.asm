	object_const_def ; object_event constants
	const OLDFUCHSIAGYM_JANINE
	const OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_1
	const OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_2
	const OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_3
	const OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_4
	const OLDFUCHSIAGYM_GYM_GUY

OldFuchsiaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OldFuchsiaGymJanineScript:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement OLDFUCHSIAGYM_JANINE, Movement_NinjaSpin
	faceplayer
	opentext
	writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_OLD_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_OLD_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_OLD_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	sjump .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext JanineText_ApplyMyself
	waitbutton
	closetext
	end

LassAliceScript:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceUnmasked
	applymovement OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_OLD_FUCHSIA_GYM_1, SPRITE_LASS
	special LoadUsedSpritesGFX
.AliceUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceAfterScript
	writetext LassAliceBeforeText
	waitbutton
	closetext
	winlosstext LassAliceBeatenText, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue .AliceBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

.AliceBecomesJanine:
	variablesprite SPRITE_OLD_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

.AliceAfterScript:
	writetext LassAliceAfterText
	waitbutton
	closetext
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaUnmasked
	applymovement OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_LASS
	special LoadUsedSpritesGFX
.LindaUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaAfterScript
	writetext LassLindaBeforeText
	waitbutton
	closetext
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

.LindaAfterScript:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyUnmasked
	applymovement OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_OLD_FUCHSIA_GYM_3, SPRITE_LASS
	special LoadUsedSpritesGFX
.CindyUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyAfterScript
	writetext PicnickerCindyBeforeText
	waitbutton
	closetext
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_OLD_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

.CindyAfterScript:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryUnmasked
	applymovement OLDFUCHSIAGYM_OLD_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_OLD_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
.BarryUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryAfterScript
	writetext CamperBarryBeforeText
	waitbutton
	closetext
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_OLD_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

.BarryAfterScript:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

OldFuchsiaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .OldFuchsiaGymGuyWinScript
	writetext OldFuchsiaGymGuyText
	waitbutton
	closetext
	end

.OldFuchsiaGymGuyWinScript:
	writetext OldFuchsiaGymGuyWinText
	waitbutton
	closetext
	end

OldFuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JANINE, JANINE1
	jumpstd GymStatue2Script

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

JanineText_DisappointYou:
	text "Fufufufu…"

	para "Non vorrei"
	line "deluderti, ma…"

	para "Sto scherzando!"

	para "Sono quella vera!"

	para "Sono NINA di"
	line "INERTOPOLI!"
	done

JanineText_ToughOne:
	text "NINA: Sei un"
	line "tipo in gamba: hai"
	cont "vinto…"

	para "Eccoti la MEDAGLIA"
	line "ANIMA."
	done

Text_ReceivedSoulBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA ANIMA."
	done

JanineText_ToxicSpeech:
	text "NINA: Sei cosi"
	line "forte che voglio"
	para "darti un dono"
	line "speciale."

	para "È TOSSINA, un"
	line "potente veleno che"

	para "progressivamente"
	line "esaurisce i PS"
	cont "della vittima."
	done

JanineText_ApplyMyself:
	text "NINA: Mi dovrò"
	line "davvero impegnare"

	para "per migliorare le"
	line "mie capacità."

	para "Voglio superare"
	line "sia mio padre che"
	cont "te!"
	done

LassAliceBeforeText:
	text "Fufufu!"

	para "Sono NINA, la"
	line "CAPOPALESTRA!"

	para "Non è vero! Ci sei"
	line "cascato, poppante!"
	done

LassAliceBeatenText:
	text "T'avevo preso in"
	line "giro…"
	done

LassAliceAfterText:
	text "Non è facile"
	line "distinguere il"
	cont "vero CAPOPALESTRA!"
	done

LassLindaBeforeText:
	text "T'ho preso in"
	line "giro! Ahahah!"
	done

LassLindaBeatenText:
	text "Ooh… Ho perso…"
	line "Non sei male…"
	done

LassLindaAfterText:
	text "Ma il mio trave-"
	line "stimento era"
	cont "perfetto, vero?"
	done

PicnickerCindyBeforeText:
	text "Sono io NINA!"

	para "Come hai fatto a"
	line "capire che ero"
	cont "quella vera?"

	para "Lottiamo!"
	done

PicnickerCindyBeatenText:
	text "Accidenti!"
	line "Volevo vincere!"
	done

PicnickerCindyAfterText:
	text "Prima o poi ti"
	line "dovrai stancare!"
	done

CamperBarryBeforeText:
	text "Ahahahahah!"

	para "Sono io NINA, puoi"
	line "scommetterci!"
	done

CamperBarryBeatenText:
	text "Ma il mio trave-"
	line "stimento era ok!"
	done

CamperBarryAfterText:
	text "Ehi, amico! Il mio"
	line "travestimento era"
	cont "carino, vero?"
	done

OldFuchsiaGymGuyText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Guardati un po' in"
	line "giro: gli allena-"

	para "tori sono tutti"
	line "identici al CAPO-"
	cont "PALESTRA, NINA."

	para "Chi sarà la vera"
	line "NINA?"
	done

OldFuchsiaGymGuyWinText:
	text "E stata una gran"
	line "bella lotta, alle-"
	cont "natore di NIHON!"
	done

OldFuchsiaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, STAND_CITY, 3
	warp_event  5, 17, STAND_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, OldFuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, OldFuchsiaGymStatue

	db 6 ; object events
	object_event  1, 10, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldFuchsiaGymJanineScript, -1
	object_event  5,  7, SPRITE_OLD_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassAliceScript, -1
	object_event  5, 11, SPRITE_OLD_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_OLD_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_OLD_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldFuchsiaGymGuyScript, -1
