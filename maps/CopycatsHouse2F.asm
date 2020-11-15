	object_const_def ; object_event constants
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	writetext CopycatText_Male_1
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	writetext CopycatText_Male_2
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Male_3
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
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

CopycatText_Male_1:
	text "<PLAYER>: Ti piac-"
	line "ciono i #MON?"

	para "<PLAYER>: No, era"
	line "tanto per parlare."

	para "<PLAYER>: Come?"
	line "Sei strano!"
	done

CopycatText_QuickMimicking:
	text "COPIONA: Perché"
	line "dovrei smettere?"

	para "Mimare è la mia"
	line "passione!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Ciao!"
	line "Ho sentito che hai"

	para "perso la tua #"
	line "BAMBOLA preferita."

	para "<PLAYER>: Se te la"
	line "trovo mi dai un"
	para "ABBONAMENTO del"
	line "treno?"

	para "<PLAYER>: Te la"
	line "cercherò."

	para "Pensi di averla"
	line "persa a NAZE?"
	done

CopycatText_Worried:
	text "COPIONA: Lo so!"

	para "Non devo essere io"
	line "a decidere cosa"
	cont "devi fare!"

	para "Ma sono preoccupa-"
	line "ta, capisci?! E se"
	cont "la trova qualcuno?"
	done

CopycatText_GiveDoll:
	text "COPIONA: Ehi, ma"
	line "è la mia # BAM-"
	cont "BOLA di CLEFAIRY!"

	para "La riconosco"
	line "da questo strappo"

	para "all'attaccatura"
	line "della gamba!"
	done

CopycatText_GivePass:
	text "Bene! Ti darò"
	line "l'ABBONAMENTO del"
	para "SUPERTRENO,"
	line "come promesso."
	done

CopycatText_ExplainPass:
	text "COPIONA: Questo è"
	line "l'ABBONAMENTO del"
	cont "SUPERTRENO."

	para "Me l'ha regalato"
	line "la società ferro-"

	para "viaria quando"
	line "ha abbattuto"
	para "casa mia per farci"
	line "la STAZIONE."
	done

CopycatText_Male_3:
	text "<PLAYER>: Ciao!"
	line "Grazie per"
	cont "L'ABBONAMENTO!"

	para "<PLAYER>: Come?"

	para "<PLAYER>: È così"
	line "divertente mimare"
	cont "la gente?"
	done

CopycatText_ItsAScream:
	text "COPIONA: Puoi"
	line "scommetterci! È"
	cont "grandioso!"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "SPECCHIO DELLE MIE"
	line "BRAME, CHI È LA"

	para "PIÙ BELLA DEL"
	line "REAME?"
	done

CopycatsHouse2FDollText:
	text "È un #MON"
	line "raro! Ah, no!"

	para "È una bambola…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	db 5 ; object events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
