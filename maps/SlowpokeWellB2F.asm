	object_const_def ; object_event constants
	const SLOWPOKEB2F_SILVER
	const SLOWPOKEB2F_BLUE
	const SLOWPOKEB2F_OAK
	const SLOWPOKEB2F_ROCKET1
	const SLOWPOKEB2F_ROCKET2
	const SLOWPOKEB2F_ROCKET3
	const SLOWPOKEB2F_GYM_GUY
	const SLOWPOKEB2F_ELDER

SlowpokeWellB2F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke2Rockets ; SCENE_DEFAULT
	scene_script .SceneSlowpoke2Nothing ; SCENE_SLOWPOKE2_NOTHING

	db 0 ; callbacks
	
.SceneSlowpoke2Rockets
	end
	
.SceneSlowpoke2Nothing
	end

RocketEncounterScript:
	turnobject SLOWPOKEB2F_BLUE, DOWN
	showemote EMOTE_SHOCK, SLOWPOKEB2F_BLUE, 15
	opentext
	writetext BlueProblemText
	waitbutton
	closetext
	applymovement PLAYER, TwoStepsUpMovement
	turnobject SLOWPOKEB2F_BLUE, UP
	applymovement SLOWPOKEB2F_OAK, OakStepUpMovement
	opentext
	writetext OakStopThisText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakStepBackMovement
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET2, 15
	opentext
	writetext WeDoWhatWeWantText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_SILVER, 15
	opentext
	writetext WeAreAllTrainersText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SLOWPOKEB2F_ROCKET3, 15
	opentext
	writetext WellSeeText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ROCKET1, RocketWalksToBlue
	applymovement SLOWPOKEB2F_ROCKET2, RocketWalksToMe
	applymovement SLOWPOKEB2F_ROCKET3, RocketWalksToSilver
	winlosstext GruntM4SeenText, GruntM4BeatenText
	loadtrainer GRUNTM, GRUNTM_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	opentext
	writetext RocketsPlan
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEB2F_ROCKET1
	disappear SLOWPOKEB2F_ROCKET2
	disappear SLOWPOKEB2F_ROCKET3
	pause 15
	special FadeInQuickly
	pause 15
	applymovement SLOWPOKEB2F_OAK, OakReadyForSpeech
	opentext
	writetext OakSpeechText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_OAK, OakLeavesMovement
	turnobject SLOWPOKEB2F_BLUE, RIGHT
	opentext
	writetext BlueOutText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_BLUE, BlueLeavesMovement
	turnobject SLOWPOKEB2F_SILVER, LEFT
	opentext
	writetext SilverOutText
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_SILVER, SilverLeavesMovement
	disappear SLOWPOKEB2F_BLUE
	disappear SLOWPOKEB2F_OAK
	disappear SLOWPOKEB2F_SILVER
	pause 25
	moveobject SLOWPOKEB2F_ELDER, 9, 13
	appear SLOWPOKEB2F_ELDER
	applymovement SLOWPOKEB2F_ELDER, ELDER_WALKS_TO_PLAYER
	applymovement PLAYER, PLAYER_LOOKS_AT_ELDER
	opentext
	writetext ElderAsksToSeeYou
	waitbutton
	closetext
	applymovement SLOWPOKEB2F_ELDER, ELDER_WALKS_AWAY_FROM_PLAYER
	disappear SLOWPOKEB2F_ELDER
	setevent EVENT_ELDER_IN_WELL
	setevent EVENT_103_SLOWPOKE_SALESMAN
	setevent EVENT_FROSTPOINT_ROCKS_CLEARED
	setscene SCENE_SLOWPOKE2_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	clearevent EVENT_EXPLODING_TRAP_21
	playmapmusic
	end

SlowpokeWellB1FNPCScript:
	end
	
OakLeavesMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
SilverLeavesMovement:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BlueLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

OakReadyForSpeech:
	step UP
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

TwoStepsUpMovement:
	step UP
	step RIGHT
	step UP
	step_end

OakStepUpMovement:
	step UP
	step_end
	
OakStepBackMovement:
	step DOWN
	turn_head UP
	step_end
	
RocketWalksToSilver:
	step DOWN
	step DOWN
	step_end
	
RocketWalksToBlue:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
RocketWalksToMe:
	step DOWN
	step LEFT
	step DOWN
	step_end
	
OneStepUp:
	step UP
	step_end

ELDER_WALKS_TO_PLAYER:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

ELDER_WALKS_AWAY_FROM_PLAYER:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

PLAYER_LOOKS_AT_ELDER:
	turn_head LEFT
	step_end

SlowpokeWellB2FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuyText
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuyText_GotKingsRock
	waitbutton
	closetext
	end
	
ElderAsksToSeeYou:
	text "Oh!"
	para "Sembra che non"
	line "vogliano più"
	para "infastidire gli"
	line "SLOWPOKE!"
	para "Ai miei tempi me"
	line "ne sarei occupato"
	cont "io stesso!"
	para "Ma ora sono troppo"
	line "vecchio per queste"
	cont "cose."
	para "Grazie per il"
	line "tuo aiuto!"
	para "Passa a trovarmi"
	line "più tardi, ti"
	para "darò una"
	line "ricompensa."
	done

SlowpokeWellB2FGymGuyText:
	text "Voglio vedere"
	line "l'evoluzione degli"
	cont "SLOWPOKE."

	para "Sai, ho fatto una"
	line "grande scoperta."

	para "Uno SLOWPOKE con"
	line "ROCCIA DI RE"

	para "viene morso da"
	line "un TURBAN."

	para "Ecco, tieni una"
	line "ROCCIA DI RE."
	done

SlowpokeWellB2FGymGuyText_GotKingsRock:
	text "Voglio essere"
	line "come SLOWPOKE."

	para "Aspetterò pazien-"
	line "temente per vedere"
	cont "uno evolversi."
	done
	
OakSpeechText:
	text "OAK: Bene…"
	
	para "Il viaggio non"
	line "è andato come"
	cont "precisto…"
	
	para "Tuttavia…"
	
	para "Abbiamo salvato"
	line "gli SLOWPOKE."
	
	para "Ora possono vivere"
	line "lontano dalle"
	para "grinfie del"
	line "TEAM ROCKET."
	
	para "Ma il loro"
	line "ritorno…"
	
	para "È un bel"
	line "problema."
	
	para "BLU, meglio torna-"
	line "re al laboratorio"
	cont "e indagare."
	
	para "<PLAYER>, <RIVAL>!"
	line "Voi due dovreste"	
	para "continuare il"
	line "vostro viaggio."
	
	para "Se avete bisogno"
	line "di me, sapete"
	cont "dove trovarmi."
	done
	
BlueOutText:
	text "BLU: Grazie per"
	line "il vostro aiuto,"
	cont "ragazzi."
	done
	
SilverOutText:
	text "<RIVAL>: Ci si"
	line "vede, <PLAYER>!"
	para "Non rimanere"
	line "troppo indietro!"
	done

RocketsPlan:
	text "Non importa."
	para "Il TEAM ROCKET è"
	line "già a buon punto"
	cont "con il suo piano."
	line "Contrattempi come"
	para "questo sono"
	line "insignificanti!"
	para "Vedrai!"
	line "Presto tutti i"
	para "#MON saranno"
	line "sotto il nostro"
	cont "controllo!"
	para "Squadra! Ritirata!"
	done

GruntM4SeenText:
	text "AAH! Battuto da"
	line "ragazzini?"
	done

GruntM4BeatenText:
	text "Ah! Che botta!"
	done

WeDoWhatWeWantText:
	text "Il TEAM ROCKET"
	line "fa quel che vuole!"
	para "Non potete"
	line "fermarci!"
	done
	
WeAreAllTrainersText:
	text "<RIVAL>: BLU,"
	line "<PLAYER>, e IO"
	cont "siamo allenatori!"
	para "Certo che possiamo"
	line "fermarvi!"
	para "I miei #MON"
	line "sono più forti di"
	para "quelli di"
	line "chiunque altro!"
	done
	
WellSeeText:
	text "Ha!"
	para "Lo vedremo!"
	done

BlueProblemText:
	text "BLU: <PLAYER>!"
	line "Meno male che"
	para "tu e <RIVAL>"
	line "siete arrivati!"
	para "Abbiamo un"
	line "problema!"
	done

OakStopThisText:
	text "OAK: State facendo"
	line "del male a questi"
	cont "povere SLOWPOKE!"
	para "È sbagliato"
	line "tagliare la loro"
	para "CODA per trarne"
	line "profitto!"
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 15, SLOWPOKE_WELL_B1F, 2
	warp_event  9, 15, SLOWPOKE_WELL_B1F, 2

	db 1 ; coord events
	coord_event  9, 10, SCENE_DEFAULT, RocketEncounterScript


	db 0 ; bg events

	db 9 ; object events
	object_event 11,  8, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  9,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  8,  8, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  8,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event 10,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FNPCScript, EVENT_103_SLOWPOKE_SALESMAN
	object_event  4,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_EXPLODING_TRAP_21
	object_event 11,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGymGuyScript, EVENT_ELDER_IN_WELL
