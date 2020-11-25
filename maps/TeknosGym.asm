	object_const_def ; object_event constants
	const TEKNOSGYM_WHITNEY
	const TEKNOSGYM_LASS1
	const TEKNOSGYM_LASS2
	const TEKNOSGYM_BUENA1
	const TEKNOSGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue RematchScriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptWhitney
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end
	
RematchScriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
	text "Sei tornato solo"
	line "per vedermi?"
	
	para "O vuoi lottare?"
	
	para "In ogni caso,"
	line "avrai entrambi!"
	done

WhitneyRematchWinText:
	text "Aah! Non c'è"
	line "da stupirsi che"
	para "tu mi abbia"
	line "già battuta!"
	done

WhitneyAfterRematchText:
	text "Ho saputo che"
	line "hai sconfitto"
	cont "il TEAM ROCKET!"
	
	para "Non ne ho più"
	line "visti in giro"
	para "da quando erano"
	line "all'ACQUARIO."
	done


TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	iftrue .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
	text "Buona fortuna per"
	line "il tuo viaggio!"
	para "Non farti fermare"
	line "da nessuno!"
	done

WhitneyBeforeText:
	text "Ciao! Sono CHIARA!"

	para "So già chi sei,"
	line "<PLAYER>!"
	para "Ti sei già fatto"
	line "un nome in questa"
	cont "città!"
	para "Di solito è"
	line "compito mio"
	para "occuparmi di"
	line "queste cose,"
	para "ma tu sei"
	line "stato sia"
	para "alla CAVA che"
	line "all'ACQUARIO!"
	para "Voglio davvero"
	line "ringraziarti!"
	para "Ma so che sei qui"
	line "per una lotta!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Ha!"
	para "Sei anche bravo"
	line "a lottare!"
	done



PlayerReceivedPlainBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA PIANA."
	done

Whitney_BadgeSpeech:
	text "La MEDAGLIA PIANA"
	line "potenzia la"
	para "VELOCITÀ"
	line "dei #MON."

	para "Ho ancora qualcosa"
	line "per te: tieni!"
	done

WhitneyAttractText:
	text "È ATTRAZIONE."
	line "Serve per"

	para "sfruttare appieno"
	line "il fascino dei"
	cont "#MON."

	para "Si addice ad una"
	line "carina come me,"
	cont "vero?"
	done


LassCarrieSeenText:
	text "Non farti"
	line "ingannare dai"
	cont "miei #MON!"
	done

LassCarrieBeatenText:
	text "Ehi… Ti avevo"
	line "sottovalutato…"
	done

LassCarrieAfterBattleText:
	text "Piaccio ai"
	line "miei #MON?"
	done

LassBridgetSeenText:
	text "Preferisco i"
	line "#MON carini a"
	cont "quelli forti."

	para "Ma io ho #MON"
	line "forti e carini."
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Provo a battere"
	line "CHIARA, ma…"
	cont "È deprimente."

	para "Però sono forte."
	line "Se perdo, dovrò"

	para "solo impegnarmi"
	line "di più!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. Hai fatto"
	line "piangere CHIARA."

	para "Ma non è niente,"
	line "presto starà"

	para "meglio. Fa sempre"
	line "così quando perde."
	done



BeautySamanthaSeenText:
	text "Fai del tuo"
	line "meglio, o"
	cont "perderai!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "mi dispiace!"
	done

BeautySamanthaAfterBattleText:
	text "Al mio MEOWTH ho"
	line "insegnato mosse"
	para "per tener testa a"
	line "qualsiasi tipo."
	done
	
TeknosGymGuyTextNotHere:
	text "Ehi, CAMPIONE in"
	line "erba!"
	para "CHIARA è sempre"
	line "impegnata ad"
	para "aiutare i suoi"
	line "concittadini."
	para "Voglio dire che"
	line "non è qui ora!"
	para "Dev'essere succes-"
	line "so qualcosa in"
	cont "città."
	done

TeknosGymGuyText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Questa PALESTRA è"
	line "per allenatori di"
	para "#MON di tipo"
	line "normale."

	para "Ti raccomando di"
	line "usare #MON di"
	cont "tipo lotta."
	done

TeknosGymGuyWinText:
	text "Hai vinto? Grande!"
	line "Io ero occupato ad"
	para "ammirare queste"
	line "signore."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 7
	warp_event  3, 17, TEKNOS_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 14, BGEVENT_READ, TeknosGymStatue
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassBridget, -1
	object_event 17,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
