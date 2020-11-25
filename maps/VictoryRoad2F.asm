	object_const_def ; object_event constants
	const VICTORYROAD2F_COOLTRAINER_F
	const VICTORYROAD2F_BIRDKEEPER
	const VICTORYROAD2F_SWIMMER_M
	const VICTORYROAD2F_SOLDIER
	const VICTORYROAD2F_COOLTRAINER_M
	const VICTORYROAD2F_PSYCHIC
	const VICTORYROAD2F_FIREBREATHER
	const VICTORYROAD2F_HIKER
	const VICTORYROAD2F_HIKER2
	const VICTORYROAD2F_COOLTRAINER_M2
	const VICTORYROAD2F_COOLTRAINER_F2
	const VICTORYROAD2F_ITEM_1
	const VICTORYROAD2F_ITEM_2
	const VICTORYROAD2F_ITEM_3

VictoryRoad2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

VictoryRoad2FHelixFossil:
	itemball HELIX_FOSSIL

	
VictoryRoad2FNugget:
	itemball NUGGET
	
VictoryRoad2FToxic:
	itemball TM_TOXIC

VictoryRoad2FHiddenPpUp:
	hiddenitem PP_UP, EVENT_VICTORY_ROAD_2F_HIDDEN_PP_UP

	
TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJennAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBirdkeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdkeeperRoySeenText, BirdkeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperRoyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierAntonio:
	trainer SOLDIER, ANTONIO, EVENT_BEAT_SOLDIER_ANTONIO, SoldierAntonioSeenText, SoldierAntonioBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierAntonioAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainermAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_COOLTRAINERM_ANDY, CooltrainermAndySeenText, CooltrainermAndyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAndyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

BirdkeeperRoySeenText:
	text "I miei #MON"
	line "uccello non hanno"
	para "spazio per volare"
	line "qui dentro!"
	done

BirdkeeperRoyBeatenText:
	text "Atterrato!"
	done

BirdkeeperRoyAfterBattleText:
	text "I miei #MON"
	line "fanno sempre del"
	cont "loro meglio!"
	done

CooltrainerfJennSeenText:
	text "Fammi vedere se"
	line "sei pronto per"
	cont "la LEGA."
	done

CooltrainerfJennBeatenText:
	text "Sei pronto…"
	done

CooltrainerfJennAfterBattleText:
	text "Per conquistare"
	line "la LEGA devi"
	para "affrontare tutti"
	line "i SUPERQUATTRO"
	cont "in fila."
	para "E il CAMPIONE"
	line "dopo di loro."
	para "Ci vorrà un po'."
	para "Devi essere"
	line "pronto!"
	done
	

SwimmermKirkSeenText:
	text "L'acqua è"
	line "calma qui."
	done

SwimmermKirkBeatenText:
	text "Sto annegando!"
	done

SwimmermKirkAfterBattleText:
	text "Dev'essere bello"
	line "navigare su un"
	cont "#MON."
	done

SoldierAntonioSeenText:
	text "Ci vuole un vero"
	line "soldato per"
	para "attraversare"
	line "questa grotta!"
	done
	
SoldierAntonioBeatenText:
	text "Continua così!"
	done
	
SoldierAntonioAfterBattleText:
	text "È tempo di marcia-"
	line "re un po'!"
	done
	
CooltrainermAndySeenText:
	text "Qual è la strada"
	line "giusta?"
	done

CooltrainermAndyBeatenText:
	text "Non credo fosse"
	line "questa."
	done

CooltrainermAndyAfterBattleText:
	text "Era una domanda"
	line "seria."
	para "Non voglio"
	line "perdermi qui."
	done	

PsychicRichardSeenText:
	text "Conosco i tuoi"
	line "desideri più"
	cont "profondi!"
	done

PsychicRichardBeatenText:
	text "Bella lotta!"
	done

PsychicRichardAfterBattleText:
	text "Desideri uscire"
	line "da questa"
	cont "grotta!"
	para "… Credo che"
	line "sia ovvio."
	done
	
FirebreatherWaltSeenText:
	text "Mi piacciono le"
	line "grotte calde."
	para "Questa non lo è."
	done
	
FirebreatherWaltBeatenText:
	text "Oh, caldo!"
	done

FirebreatherWaltAfterBattleText:
	text "Fa fresco qui!"
	para "Sei mai stato"
	line "al POZZO LAVA?"
	para "È molto più"
	line "caldo!"
	done

HikerMichaelSeenText:
	text "Sei audace!"
	line "Ma sai una cosa?"

	para "Quando si tratta"
	line "di audacia,"
	cont "sono il primo!"
	done

HikerMichaelBeatenText:
	text "I miei #MON non"
	line "sono abbastanza"
	cont "audaci!"
	done

HikerMichaelAfterBattleText:
	text "Adoro PS-SU!"
	line "Mmmm, gnamm!"

	para "Continuo a bere"
	line "quello dei miei"
	cont "#MON!"

	para "Devo smettere!"
	done


HikerKennySeenText:
	text "Vorrei catturare"
	line "un ONIX."
	done

HikerKennyBeatenText:
	text "Ho perso…"
	done

HikerKennyAfterBattleText:
	text "Le caratteristiche"
	line "geologiche"
	para "sembrano immuta-"
	cont "bili."

	para "In realtà cambiano"
	line "molto lentamente."
	
	para "Il MONTE FUJI non"
	line "era così alto"
	cont "millenni fa."
	done
	
CooltrainermTylerSeenText:
	text "Questa è l'ultima"
	line "parte prima della"
	cont "cima!"
	para "Ce la farai?"
	done

CooltrainermTylerBeatenText:
	text "Ci sei quasi!"
	done

CooltrainermTylerAfterBattleText:
	text "Sei vicino alla"
	line "LEGA."
	para "Come ti senti?"
	done
	

CooltrainerfCybilSeenText:
	text "Sembri forte."

	para "Gli allenatori"
	line "migliori si"
	para "riconoscono con"
	line "uno sguardo!"
	done

CooltrainerfCybilBeatenText:
	text "No! Non doveva"
	line "andare così."
	done

CooltrainerfCybilAfterBattleText:
	text "Miglioriamo tutti"
	line "con le lotte."

	para "Io ho lottato"
	line "molto per diventa-"
	para "re quello che"
	line "sono oggi."
	done	

VictoryRoad2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 25, 51, MOUNT_FUJI_OUTSIDE, 6
	warp_event 15, 41, MOUNT_FUJI_OUTSIDE, 7
	warp_event  9, 33, MOUNT_FUJI_OUTSIDE, 8
	warp_event 19,  1, FUJI_SUMMIT, 3
	warp_event 28, 41, VICTORY_ROAD, 9

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 20, BGEVENT_ITEM, VictoryRoad2FHiddenPpUp

	db 14 ; object events
	object_event 26, 45, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event 15, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperRoy, -1
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 13, 31, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSoldierAntonio, -1
	object_event 18, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAndy, -1
	object_event 21, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicRichard, -1
	object_event 14, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherWalt, -1
	object_event 26, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerHikerKenny, -1
	object_event 36, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermTyler, -1
	object_event  8, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfCybil, -1
	object_event 37, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FNugget, EVENT_VICTORY_ROAD_2F_NUGGET
	object_event 37,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FToxic, EVENT_VICTORY_ROAD_2F_TOXIC
	object_event  2,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FHelixFossil, EVENT_VICTORY_ROAD_2F_HELIX_FOSSIL
