	object_const_def ; object_event constants
	const ALLOYGYM_JASMINE
	const ALLOYGYM_GYM_GUY
	const ALLOYGYM_BOULDER1
	const ALLOYGYM_BOULDER2
	const ALLOYGYM_BOULDER3
	const ALLOYGYM_GENTLEMAN
	const ALLOYGYM_GENTLEMAN2
	const ALLOYGYM_SUPERNERD

AlloyGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .BouldersAlloy
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable


.BouldersAlloy:
	checkevent EVENT_BIRDON_MILK_BAR_FARFETCH_D
	iffalse .skip1alloy
	changeblock 10, 12, $15
.skip1alloy
	checkevent EVENT_BIRDON_MILK_BAR_APPRENTICE
	iffalse .skip2alloy
	changeblock 4, 14, $15
.skip2alloy
	checkevent EVENT_BIRDON_MILK_BAR_BOSS
	iffalse .skip3alloy
	changeblock 4, 0, $15
.skip3alloy
	return
	

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, ALLOYGYM_BOULDER1, .Boulder1
	stonetable 4, ALLOYGYM_BOULDER2, .Boulder2
	stonetable 3, ALLOYGYM_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear ALLOYGYM_BOULDER1
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 10, 12, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_BIRDON_MILK_BAR_FARFETCH_D
	end

.Boulder2:
	disappear ALLOYGYM_BOULDER2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_BIRDON_MILK_BAR_APPRENTICE
	end

.Boulder3:
	disappear ALLOYGYM_BOULDER3
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 0, $15
	opentext
	writetext AlloyGymBoulderFilled
	waitbutton
	closetext
	setevent EVENT_BIRDON_MILK_BAR_BOSS
	end

AlloyGymJasmineScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_JASMINE
	iftrue RematchScriptJasmine
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptJasmine
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall AlloyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end
	
RematchScriptJasmine:
	opentext
	writetext JasmineRematchText
	waitbutton
	closetext
	winlosstext JasmineRematchWinText, 0
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_JASMINE
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptJasmine:
	opentext
	writetext JasmineAfterRematchText
	waitbutton
	closetext
	end

JasmineRematchText:
	text "Sapevo che"
	line "avresti"
	para "trionfato alla"
	line "LEGA #MON!"
	
	para "Ora mostrami"
	line "quanto sei"
	para "migliorato dall'"
	line "ultima volta!"
	done

JasmineRematchWinText:
	text "Sono ancora con-"
	line "vinta che tu sia"
	para "un allenatore"
	line "straordinario!"
	done

JasmineAfterRematchText:
	text "Spero di"
	line "vederti vincere"
	para "in qualsiasi"
	line "sfida"
	cont "affronterai!"
	done


AlloyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

AlloyGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .AlloyGymGuyWinScript
	opentext
	writetext AlloyGymGuyText
	waitbutton
	closetext
	end

.AlloyGymGuyWinScript:
	opentext
	writetext AlloyGymGuyWinText
	waitbutton
	closetext
	end


AlloyGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext JASMINE, JASMINE1, MEM_BUFFER_1
	jumpstd GymStatue2Script

AlloyGymBoulder:
	jumpstd StrengthBoulderScript
	

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end


TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end


TrainerSuperNerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SuperNerdTomSeenText, SuperNerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdTomAfterBattleText
	waitbutton
	closetext
	end


Jasmine_SteelTypeIntro:
	text "Solo chi ha"
	line "mostrato di saper"
	para "affrontare i"
	line "#MON di questa"
	para "PALESTRA può"
	line "ritenersi un"
	para "valido sfidante"
	line "per i miei"
	para "temibili #MON"
	line "ACCIAIO."
	para "Hai battuto gli"
	line "altri allenatori."
	para "Ma sei pronto"
	line "per me?"
	done

Jasmine_BetterTrainer:
	text "…Sei un allenatore"
	line "più forte di me,"

	para "e questa lotta"
	line "lo dimostra."

	para "Secondo le regole"
	line "della LEGA, ti"

	para "conferisco questa"
	line "MEDAGLIA."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA MINERALE."
	done

Jasmine_BadgeSpeech:
	text "La MEDAGLIA MINE-"
	line "RALE migliora"
	cont "la DIFESA."
	
	para "Ti permette di"
	line "usare VOLO fuori"
	cont "dalla lotta."

	para "Tieni anche"
	line "questa!"
	done

Text_ReceivedTM09:
	text "<PLAYER> riceve"
	line "MT09."
	done

Jasmine_IronTailSpeech:
	text "Con questa MT"
	line "puoi insegnare"
	cont "CODACCIAIO."
	done

Jasmine_GoodLuck:
	text "Buona fortuna"
	line "per la tua"
	cont "avventura."
	para "Sono sicura che"
	line "conquisterai la"
	cont "LEGA #MON."
	done

AlloyGymGuyText:
	text "JASMINE usa un"
	line "tipo appena"
	cont "scoperto: acciaio."

	para "Non ne so molto."
	done

AlloyGymGuyWinText:
	text "È stata un'"

	line "esperienza"
	cont "incredibile, sai?"

	para "Un incontro"
	line "ravvicinato di non"
	cont "saprei quale tipo!"
	done


	
AlloyGymBoulderFilled:
	text "Il masso riempie"
	line "il buco!"
	done


GentlemanPrestonSeenText:
	text "Hai mai sbattuto"
	line "contro le difese"
	para "dei #MON"
	line "ACCIAIO?"
	done

GentlemanPrestonBeatenText:
	text "Un buon allenatore"
	line "sa affrontare"
	cont "qualsiasi tipo."
	done

GentlemanPrestonAfterBattleText:
	text "I #MON ACCIAIO"
	line "hanno molta"
	cont "DIFESA."
	para "Ma non sono"
	line "imbattibili."
	done


GentlemanAlfredSeenText:
	text "Questa PALESTRA"
	line "usava #MON"
	cont "ROCCIA."
	para "Ma JASMINE era"
	line "affascinata dal"
	cont "tipo ACCIAIO."
	done

GentlemanAlfredBeatenText:
	text "Bella lotta!"
	done

GentlemanAlfredAfterBattleText:
	text "Fino a poco tempo"
	line "fa nessuno sapeva"
	para "che ONIX potesse"
	line "evolversi."
	done
	
SuperNerdTomSeenText:
	text "Il tipo ACCIAIO"
	line "è raro!"
	para "Questo vuol dire"
	line "che devo usarlo"
	cont "per forza!"
	done

SuperNerdTomBeatenText:
	text "Anche le vittorie"
	line "sono rare…"
	done

SuperNerdTomAfterBattleText:
	text "Sono interessato"
	line "solo alle"
	cont "rarità."
	done

AlloyGym_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16, 15, ALLOY_CITY, 2
	warp_event 17, 15, ALLOY_CITY, 13
	warp_event  4,  1, ALLOY_CITY, 1; boulder 3
	warp_event  4, 15, ALLOY_CITY, 1; boulder 2
	warp_event 10, 13, ALLOY_CITY, 1; boulder 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15, 13, BGEVENT_READ, AlloyGymStatue
	bg_event 18, 13, BGEVENT_READ, AlloyGymStatue

	db 8 ; object events
	object_event  1,  5, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyGymJasmineScript, -1
	object_event 19, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyGymGuyScript, -1
	object_event 16,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_BIRDON_MILK_BAR_FARFETCH_D
	object_event 10, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_BIRDON_MILK_BAR_APPRENTICE
	object_event 12,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyGymBoulder, EVENT_BIRDON_MILK_BAR_BOSS
	object_event 18,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGentlemanPreston, -1
	object_event 16,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGentlemanAlfred, -1
	object_event 11,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdTom, -1

