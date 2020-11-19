	object_const_def ; object_event constants
	const KANTO_LABORATORY_FOSSIL_SCIENTIST
	const KANTO_LABORATORY_SCIENTIST_1
	const KANTO_LABORATORY_GENTLEMAN

KantoLaboratory_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoLaboratoryFossilScientist:
	faceplayer
	opentext
	checkitem OLD_AMBER; old amber
	iftrue .GetAerodactyl
	checkitem HELIX_FOSSIL; helix fossil
	iftrue .GetOmanyte
	checkitem DOME_FOSSIL; dome fossil
	iftrue .GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	closetext
	end
	
.GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveOldAmberText
	yesorno
	iftrue .GetAerodactyl2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetAerodactyl2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullAerodactyl
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnAerodactyl
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 15
	takeitem OLD_AMBER
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullAerodactyl
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
.GetOmanyte
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveHelixFossilText
	yesorno
	iftrue .GetOmanyte2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetOmanyte2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullOmanyte
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnOmanyte
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 15
	takeitem HELIX_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullOmanyte
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	

.GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveDomeFossilText
	yesorno
	iftrue .GetKabuto2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetKabuto2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullKabuto
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAKabuto
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 15
	takeitem DOME_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullKabuto
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
KantoLaboratoryScientist1Script:
	jumptextfaceplayer KantoLaboratoryScientist1Text
	
KantoLaboratoryGentlemanScript:
	jumptextfaceplayer KantoLaboratoryGentlemanText
	
KantoLaboratoryBookshelf:
	jumpstd DifficultBookshelfScript

	
ScientistGoesToMachine1:
	step UP
	step UP
	step UP
	step_end
	
ScientistGoesToMachine2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
ScientistGoesToMachine4:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine5:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
ScientistGoesToMachine6:
	step LEFT
	step UP
	step_end
	
ScientistGoesToMachine7:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KantoLaboratoryGentlemanText:
	text "Questo posto è"
	line "il luogo perfetto"
	para "per i ricercatori"
	line "di NIHON."
	done
	
KantoLaboratoryScientist1Text:
	text "Lo sapevi?"
	para "Abbiamo fatto"
	line "passi da gigante"
	para "nella ricerca"
	line "sui fossili."
	para "Ora possiamo"
	line "riportare in"
	para "vita i fossili"
	line "in pochi secondi!"
	done

ScientistHereYouGoText:
	text "Ecco fatto!"
	para "Tieni!"
	done
	
IfYouHaveAnyOtherFossilsText:
	text "Fammi sapere se"
	line "trovi altri"
	cont "fossili!"
	done
	
NoRoomForFossilmon:
	text "Oh, aspetta! Non"
	line "posso farlo!"
	para "Non hai spazio per"
	line "prendere questo"
	cont "#MON!"
	para "Torna quando avrai"
	line "fatto spazio nella"
	cont "squadra!"
	done
	
PlayerGetsAnOmanyte:
	text "<PLAYER> riceve"
	line "OMANYTE!"
	done
	
PlayerGetsAKabuto:
	text "<PLAYER> riceve"
	line "KABUTO!"
	done
	
PlayerGetsAnAerodactyl:
	text "<PLAYER> riceve"
	line "AERODACTYL!"
	done
	
TimeToGetAFossilmonText:
	text "Allora, lasciami"
	line "vedere questo fos-"
	para "sile e lo farò"
	line "tornare in vita in"
	cont "un attimo!"
	done
	
YouHaveHelixFossilText:
	text "Oh, e questo"
	line "cos'è?"
	para "Un HELIXFOSSILE!"
	para "Vuoi che lo"
	line "riporti in vita?"
	done
	
YouHaveDomeFossilText:
	text "Oh, e questo"
	line "cos'è?"
	para "Un DOMOFOSSILE!"
	para "Vuoi che lo"
	line "riporti in vita?"
	done
	
YouHaveOldAmberText:
	text "Oh, e questo"
	line "cos'è?"
	para "AMBRA ANTICA!"
	para "Vuoi che lo"
	line "riporti in vita?"
	done
	
AnotherTimeFossilText:
	text "Oh, davvero?"
	para "Fammi sapere se"
	line "cambi idea."
	done
	
FossilScientistIntroText:
	text "Ehi! Sono uno"
	line "scienziato"
	para "specializzato in"
	line "fossili #MON!"
	para "Fammi sapere se"
	line "hai dei fossili"
	para "da far tornare"
	line "#MON!"
	done

KantoLaboratory_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2, 15, KANTO_REGION, 28
	warp_event  3, 15, KANTO_REGION, 29
	warp_event 14, 10, KANTO_LABORATORY, 4
	warp_event  2,  7, KANTO_LABORATORY, 3
	warp_event  3,  7, KANTO_LABORATORY, 3
	warp_event 10, 10, KANTO_LABORATORY, 7
	warp_event 14,  5, KANTO_LABORATORY, 6
	warp_event 15,  5, KANTO_LABORATORY, 6

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 14,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 13,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 12,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  7, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  6, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  5, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  4, 13, BGEVENT_READ, KantoLaboratoryBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryFossilScientist, EVENT_SCIENTIST_SEQUENCE
	object_event 17,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryScientist1Script, -1
	object_event 16, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryGentlemanScript, -1
