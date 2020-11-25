	object_const_def ; object_event constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F

TeknosAquarium2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_WHITNEY_2_AQUARIUM
	setevent EVENT_WHITNEY_1_AQUARIUM
	setevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM; this is the event for the rocket objects
	clearflag ENGINE_ROCKETS_IN_SANSKRIT
	checkevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	iffalse .AlreadyRescuedGirl
	special FadeOutPalettes
	special HealParty
	pause 15
	warp TEKNOS_CITY, 6, 28
	end

.AlreadyRescuedGirl:
	clearevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	special FadeOutPalettes
	special HealParty
	pause 15
	warp TEKNOS_CITY, 6, 28
	end

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

AquaPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .PokefanMNoRockets
	writetext AquaPokefanMRocketsText
	waitbutton
	closetext
	end

.PokefanMNoRockets:
	writetext AquaPokefanMNoRocketsText
	waitbutton
	closetext
	end
	
AquaPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .PokefanFNoRockets
	writetext AquaPokefanFRocketsText
	waitbutton
	closetext
	end

.PokefanFNoRockets:
	writetext AquaPokefanFNoRocketsText
	waitbutton
	closetext
	end
	
Aqua2FExhibit1Script:
	jumptext Aqua2FExhibit1Text

Aqua2FExhibit2Script:
	jumptext Aqua2FExhibit2Text
	
Aqua2FExhibit3Script:
	jumptext Aqua2FExhibit3Text
	
Aqua2FExhibit1Text:
	text "I KINGOLD sono"
	line "tra i #MON"
	para "acquatici più"
	line "piccoli."
	done

Aqua2FExhibit2Text:
	text "NUOVA MOSTRA"
	line "IN ARRIVO"
	done
	
Aqua2FExhibit3Text:
	text "TURBAN può soprav-"
	line "vivere sia sulla"
	para "superficie che"
	line "in acqua."
	para "Ha un forte legame"
	line "con gli SLOWPOKE."
	done

GruntM1SeenText:
	text "Cosa vuoi?"

	para "Se intralci il"
	line "nostro lavoro,"
	cont "non avremo pietà!"
	done

GruntM1BeatenText:
	text "Oggi hai vinto,"
	line "ma aspetta la"
	cont "prossima volta!"
	done

TrainerGruntM1WhenTalkText:
	text "Sì, il TEAM ROCKET"
	line "si era sciolto"
	cont "un anno fa."

	para "Ma abbiamo"
	line "continuato le"
	cont "nostre attività."
	
	para "Non abbiamo"
	line "bisogno di"
	para "questo posto!"
	line "Ce ne sono molti"
	para "altri per fare"
	line "soldi!"
	para "Non hai ancora"
	line "visto nulla!"
	done
	

GruntM3SeenText:
	text "Ti mostreremo"
	line "la vera paura!"
	done

GruntM3BeatenText:
	text "Troppo forte!"
	line "Dobbiamo fare"
	cont "attenzione…"
	done

GruntM3AfterBattleText:
	text "Sei troppo forte."

	para "Ma il nostro"
	line "lavoro qui non"
	para "è importante per"
	line "il nostro piano."
	para "Sei solo una"
	line "distrazione."
	done
	
AquaPokefanMRocketsText:
	text "I piantagrane"
	line "devono stare"
	cont "alla larga."
	done
	
AquaPokefanMNoRocketsText:
	text "Erano membri"
	line "del TEAM ROCKET?"
	para "Credevo si fossero"
	line "sciolti un"
	cont "anno fa."
	done
	
AquaPokefanFRocketsText:
	text "Oh, sembrava"
	line "un giorno"
	cont "tranquillo."
	done
	
AquaPokefanFNoRocketsText:
	text "Non mi sono mai"
	line "piaciuti i pesci."
	done

TeknosAquarium2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, TEKNOS_AQUARIUM_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 4 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
