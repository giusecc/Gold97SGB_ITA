	object_const_def ; object_event constants
	const STANDGYM_CHUCK
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER
	const STANDGYM_COOLTRAINER2
	const STANDGYM_COOLTRAINER3
	const STANDGYM_COOLTRAINER4

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandGymChuckScript:
	faceplayer
	checkevent EVENT_OKERA_OWES_YOU_ONE
	iffalse OkeraOwesYouOneScript
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue RematchScriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptOkera
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_STAND_CITY_IMPOSTOR
	checkcode VAR_BADGES
;	scall StandGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_COOLTRAINERM_AARON
	setevent EVENT_BEAT_COOLTRAINERF_KELLY
	setevent EVENT_BEAT_COOLTRAINERF_JULIA
	setevent EVENT_BEAT_COOLTRAINERF_IRENE
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

;StandGymActivateRockets:
;	ifequal 7, .RadioTowerRockets
;	ifequal 6, .WestportRockets
;	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript
	
OkeraOwesYouOneScript:
	opentext
	writetext OkeraGivesYouSomething
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	writetext OkeraGivesYouSomething2
	waitbutton
	closetext
	setevent EVENT_OKERA_OWES_YOU_ONE
	end
	
.NoRoom:
	closetext
	end


RematchScriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end




TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	changeblock   23,  31, $3D ; floor
	changeblock   21,  31, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeOutPalettes
	changeblock   23,  31, $39 ; floor
	changeblock   21,  31, $39 ; floor
	reloadmappart
	special FadeInPalettes
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch2:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	changeblock   19,  27, $3F ; floor
	changeblock   25,  23, $3D ; floor
	changeblock   27,  23, $19 ; floor
	changeblock   27,  21, $19 ; floor
	changeblock   27,  19, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeOutPalettes
	changeblock   19,  27, $3B ; floor
	changeblock   25,  23, $39 ; floor
	changeblock   27,  23, $10 ; floor
	changeblock   27,  21, $10 ; floor
	changeblock   27,  19, $10 ; floor
	reloadmappart
	special FadeInPalettes
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch3:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	changeblock   21,  13, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeOutPalettes
	changeblock   21,  13, $10 ; floor
	reloadmappart
	special FadeInPalettes
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch4:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	changeblock   7,  13, $3F ; floor
	changeblock   7,  11, $3F ; floor
	changeblock   7,   9, $3F ; floor
	changeblock  13,  15, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeOutPalettes
	changeblock   7,  13, $3B ; floor
	changeblock   7,  11, $3B ; floor
	changeblock   7,   9, $3B ; floor
	changeblock  13,  15, $39 ; floor
	reloadmappart
	special FadeInPalettes
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch5:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	changeblock    3,  7, $3F ; floor
	changeblock    3,  9, $3F ; floor
	changeblock    7,  9, $3F ; floor
	reloadmappart
	special FadeInPalettes
	special FadeOutPalettes
	changeblock    3,  7, $3B ; floor
	changeblock    3,  9, $3B ; floor
	changeblock    7,  9, $3B ; floor
	reloadmappart
	special FadeInPalettes
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end

;StandGymMovement_ChuckChucksBoulder:
;	set_sliding
;	big_step LEFT
;	big_step UP
;	fast_jump_step RIGHT
;	remove_sliding
;	step_end

OkeraGivesYouSomething:
	text "Ehi!"
	para "Ti devo qualcosa"
	line "per aver scacciato"
	cont "quei farabutti."
	para "Tieni, ho qualcosa"
	line "che potrebbe"
	cont "servirti."
	done
	
OkeraGivesYouSomething2:
	text "Forse ti servirà"
	line "se hai #MON"
	cont "BUIO."
	done

ItsASwitch:
	text "C'è scritto"
	line "'DIFETTOSO'."
	para "Vuoi premerlo?"
	done
	
ItsASwitch2:
	text "Le luci non"
	line "rimangono"
	cont "accese!"
	done
	
	
CooltrainerfIreneSeenText:
	text "Aaah!"
	line "Mi hai trovato!"
	done

CooltrainerfIreneBeatenText:
	text "Ohhh!"
	line "Troppo forte!"
	done

CooltrainerfIreneAfterText:
	text "Il buio può"
	line "spaventare."

	para "Ma può anche"
	line "rassicurare."
	done
	
CooltrainerfJuliaSeenText:
	text "Credi nella"
	line "sfortuna?"
	done

CooltrainerfJuliaBeatenText:
	text "Ho avuto molta"
	line "sfortuna!"
	done

CooltrainerfJuliaAfterText:
	text "Questi interrut-"
	line "tori non sono"
	para "mai stati"
	line "funzionanti."
	done
	


OkeraRematchText:
	text "Cosa vuoi?"
	
	para "Non sei il"
	line "CAMPIONE ora?"
	
	para "Vuoi un'altra"
	line "MEDAGLIA o"
	cont "cosa?"
	
	para "Non credere che mi"
	line "tirerò indietro!"
	done

OkeraRematchWinText:
	text "Heh."
	done

OkeraAfterRematchText:
	text "Non mi aspettavo"
	line "di vincere, ma"
	para "non potevo"
	line "rifiutare."
	para "Anche se la sorte"
	line "mi era avversa."
	
	para "Sei sempre lo"
	line "stesso, vero?"
	done


CooltrainerfKellySeenText:
	text "Cosa vedi se"
	line "apri gli occhi"
	cont "nel buio?"
	done

CooltrainerfKellyBeatenText:
	text "Bene. Ho perso."
	done

CooltrainerfKellyAfterBattleText:
	text "Dov'è il"
	line "CAPOPALESTRA?"
	para "Vive nell'ombra,"
	line "dietro ciò che"
	cont "è invisibile."
	done

CooltrainermAaronSeenText:
	text "Paura del buio?"
	done

CooltrainermAaronBeatenText:
	text "Eh…"
	line "Bella lotta."
	done

CooltrainermAaronAfterBattleText:
	text "La PALESTRA non è"
	line "così spaventosa."
	para "Ci sono solo le"
	line "luci spente."
	done

StandGymGuyText2:
	text "Ehi! Campione in"
	line "erba!"
	para "È buio qui, vero?"
	para "ANGELO è un tipo"
	line "cupo e gli piace"
	cont "questo buio."
	para "Ma non farti"
	line "ingannare dal"
	cont "suo modo di fare."
	para "È un allenatore"
	line "tosto!"
	done
	
StandGymGuyWinText2:
	text "Sapevo che non"
	line "avevi paura del"
	cont "buio!"
	done

ChuckIntroText1:
	text "Ehi."
	para "Hai fatto un lungo"
	line "viaggio, vero?"
	para "Hai scoperto un"
	line "sacco di cose."
	para "Fatto nuove"
	line "amicizie."
	para "Affrontato nuove"
	line "sfide."
	para "…"
	para "Ma hai mai"
	line "sfidato la"
	para "forza che si"
	line "cela nel buio?"
	para "I #MON BUIO"
	line "hanno un potere"
	cont "unico."
	para "Pur essendo"
	line "CAPOPALESTRA da"
	para "poco, ho imparato"
	line "molto sul loro"
	cont "potere."
	para "Te lo mostrerò"
	line "ora."
	done


ChuckLossText:
	text "Hm. Ho perso."

	para "Inaspettato."
	para "Ma dimostra che ti"
	line "meriti la MEDAGLIA"
	cont "CREPUSCOLO."
	done

GetStormBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA" ; MEDAGLIA CREPUSCOLO
	cont "CREPUSCOLO."
	done

ChuckExplainBadgeText:
	text "La MEDAGLIA"
	line "CREPUSCOLO farà"

	para "obbedire i #MON"
	line "fino al"
	cont "livello 70."

	para "Ora i tuoi #MON"
	line "possono usare"

	para "SPACCAROCCIA fuori"
	line "dalla lotta."
	
	para "Sono di buon"
	line "umore, prendi"
	cont "anche questa."
	done

ChuckExplainTMText:
	text "Contiene"
	line "FURTO."

	para "Danneggia il"
	line "nemico e può"
	para "rubare lo"
	line "strumento tenuto."
	done

ChuckAfterText:
	text "È stata una bella"
	line "lotta."
	para "Ne è valsa la"
	line "pena."
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 26, 35, STAND_CITY, 3
	warp_event 27, 35, STAND_CITY, 12
	warp_event 26, 33, STAND_GYM, 4
	warp_event  7, 35, STAND_GYM, 3

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 33, BGEVENT_READ, StandGymStatue
	bg_event 28, 33, BGEVENT_READ, StandGymStatue
	bg_event 24, 28, BGEVENT_READ, LightSwitch
	bg_event 22, 22, BGEVENT_READ, LightSwitch2
	bg_event 20,  8, BGEVENT_READ, LightSwitch3
	bg_event  8, 12, BGEVENT_READ, LightSwitch4
	bg_event  4,  4, BGEVENT_READ, LightSwitch5

	db 6 ; object events
	object_event  6, 33, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandGymChuckScript, EVENT_OKERA_NOT_IN_GYM
	object_event 29, 33, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 25, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event 23,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event 10, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  5,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1

