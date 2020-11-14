	object_const_def ; object_event constants
	const BIRDONGYM_MORTY
	const BIRDONGYM_GYM_GUY
	const BIRDONGYM_GRAMPS
	const BIRDONGYM_GRANNY1
	const BIRDONGYM_GRANNY2

BirdonGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	end


.DummyScene:
	end
	


TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end


TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script
	

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

BirdonGymMortyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_MORTY
	iftrue RematchScriptMorty
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptMorty
	
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall BirdonGymActivateRockets
	;setmapscene TEKNOS_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	;setevent EVENT_RANG_HELIX_FOSSIL_1
	;setevent EVENT_RANG_HELIX_FOSSIL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	;setevent EVENT_BEAT_SAGE_JEFFREY
	;setevent EVENT_BEAT_SAGE_PING
	;setevent EVENT_BEAT_MEDIUM_MARTHA
	;setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end
	
RematchScriptMorty:
	opentext
	writetext MortyRematchText
	waitbutton
	closetext
	winlosstext MortyRematchWinText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_MORTY
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptMorty:
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

MortyRematchText:
	text "Sei un fantasma"
	line "o sei tornato"
	para "di nuovo nella"
	line "mia PALESTRA?"
	
	para "Se è così"
	line "sfidiamoci"
	para "di nuovo in una"
	line "lotta, così"
	para "potrò affinare"
	line "le mie capacità!"
	done

MortyRematchWinText:
	text "Impeccabile…"
	done

MortyAfterRematchText:
	text "L'uccello della"
	line "leggenda… Lo hai"
	para "visto durante il"
	line "tuo viaggio?"
	
	para "Se dovesse appari-"
	line "re a qualcuno,"
	para "credo che lo farà"
	line "con te."
	done



BirdonGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript







BirdonGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .BirdonGymGuyWinScript
	writetext BirdonGymGuyText
	waitbutton
	closetext
	end

.BirdonGymGuyWinScript:
	writetext BirdonGymGuyWinText
	waitbutton
	closetext
	end

BirdonGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BirdonGymPlayerStepUpMovement:
	step UP
	step_end

BirdonGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

BirdonGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Sono felice che tu"
	line "sia venuto."

	para "Qui ad AVIOPOLI,"
	line "veneriamo i"
	cont "#MON."

	para "Si dice che un"
	line "#MON arcobaleno"

	para "scenderà per"
	line "mostrarsi a un"

	para "allenatore molto"
	line "abile."

	para "Credo in questa"
	line "leggenda, perciò"

	para "mi sono allenato"
	line "in segreto per"
	cont "tutta la vita."

	para "Così ora posso"
	line "vedere ciò che gli"
	cont "altri non possono."

	para "Manca poco…"

	para "Manca poco a quel"
	line "giorno in cui"

	para "potrò incontrare"
	line "il #MON dai colori"
	cont "dell'arcobaleno."

	para "E tu mi aiuterai a"
	line "raggiungere quel"
	cont "livello!"
	done

MortyWinLossText:
	text "Non sono ancora"
	line "al massimo…"

	para "E va bene. La"
	line "MEDAGLIA è tua."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA NEBBIA."
	done

MortyText_FogBadgeSpeech:
	text "Con la MEDAGLIA"
	line "NEBBIA, i #MON"

	para "fino al livello 50"
	line "ti obbediranno."

	para "Inoltre, i #MON"
	line "che hanno SURF po-"

	para "tranno usarlo in"
	line "qualsiasi momento."

	para "Prendi anche"
	line "questa."
	done

MortyText_ShadowBallSpeech:
	text "È una PALLA"
	line "OMBRA. Causa danni"

	para "e riduce la DIFESA"
	line "SPECIALE."

	para "Usala se ti va!"
	done

MortyFightDoneText:
	text "Capisco…"

	para "Il tuo viaggio ti"
	line "ha portato molto"
	cont "lontano."

	para "E hai visto molte"
	line "più cose di me."

	para "Ti invidio un"
	line "po'…"
	done


MediumRebeccaSeenText:
	text "La forza di tutti"
	line "quelli che hai"
	cont "battuto è mia!"
	done

MediumRebeccaBeatenText:
	text "Sei forte…"
	line "Troppo forte…"
	done

MediumRebeccaAfterBattleText:
	text "Da dove arriva"
	line "questa forza?"
	done

BirdonGymGuyText:
	text "Questa PALESTRA è"
	line "piena di buchi che"
	para "possono riportarti"
	line "all'entrata."
	para "Ma alcuni possono"
	line "essere"
	cont "attraversati."
	para "Fai attenzione!"
	done

BirdonGymGuyWinText:
	text "Ehi, <PLAYER>."
	line "Ottimo lavoro!"

	para "Mi ero nascosto"
	line "in un angolo per"
	cont "la paura!"
	done



MediumDorisSeenText:
	text "Fufufufu…"
	line "La vedo bene."

	para "Posso vedere la"
	line "tua anima!"
	done

MediumDorisBeatenText:
	text "Ho visto la tua"
	line "anima, e ho perso…"
	done

MediumDorisAfterBattleText:
	text "Acc! Ho scordato"
	line "di aver predetto"
	cont "che avrei perso."
	done

BirdonGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  2,  9, BIRDON_TOWN, 5
	warp_event  3,  9, BIRDON_TOWN, 9
	warp_event  2,  7, BIRDON_GYM, 4
	warp_event  1,  0, BIRDON_GYM, 3
	warp_event  2,  0, BIRDON_GYM, 3
	warp_event  3,  0, BIRDON_GYM, 3
	warp_event  9,  9, BIRDON_GYM, 3
	warp_event 13,  0, BIRDON_GYM, 3
	warp_event 17,  4, BIRDON_GYM, 3
	warp_event  0,  0, BIRDON_GYM, 3
	warp_event  4,  0, BIRDON_GYM, 3
	warp_event  5,  0, BIRDON_GYM, 3
	warp_event  7,  0, BIRDON_GYM, 3
	warp_event 12,  0, BIRDON_GYM, 3
	warp_event 14,  0, BIRDON_GYM, 3
	warp_event  8,  0, BIRDON_GYM, 3
	warp_event 16,  4, BIRDON_GYM, 3
	warp_event 10,  0, BIRDON_GYM, 3
	warp_event 15,  0, BIRDON_GYM, 3
	warp_event  6,  4, BIRDON_GYM, 3
	warp_event  6,  5, BIRDON_GYM, 3
	warp_event  7,  8, BIRDON_GYM, 3
	warp_event  6,  8, BIRDON_GYM, 3
	warp_event 18,  0, BIRDON_GYM, 3
	warp_event 17,  0, BIRDON_GYM, 3
	warp_event  2,  4, BIRDON_GYM, 3
	warp_event  3,  4, BIRDON_GYM, 3
	warp_event 19,  0, BIRDON_GYM, 3
	warp_event 16,  0, BIRDON_GYM, 3
	warp_event 17,  6, BIRDON_GYM, 3
	warp_event 17,  7, BIRDON_GYM, 3
	warp_event 12,  8, BIRDON_GYM, 3
	warp_event 13,  8, BIRDON_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, BirdonGymStatue
	bg_event  4,  7, BGEVENT_READ, BirdonGymStatue

	db 4 ; object events
	object_event 16,  2, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonGymMortyScript, -1
	object_event  0,  7, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BirdonGymGuyScript, -1
	object_event  5,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event 11,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1

