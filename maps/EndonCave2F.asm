	object_const_def ; object_event constants
	const ENDONCAVE2F_SAILOR
	const ENDONCAVE2F_GENTLEMAN
	const ENDONCAVE2F_YOUNGSTER
	const ENDONCAVE2F_POKE_BALL
	const ENDONCAVE2F_POKE_BALL_2

EndonCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

TatsugoPathElixer:
	itemball ELIXER


TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end



TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end
	

EndonCave2FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "I miei stupendi"
	line "#MON uccello"
	para "non possono"
	line "VOLARE qui!"
	done

BirdKeeperTheoBeatenText:
	text "Sai come si esce"
	line "da qui?"
	done

BirdKeeperTheoAfterBattleText:
	text "Come diamine si"
	line "esce da qui?"

	para "Voglio VOLARE!"
	line "VOLARE via!"
	done

SailorTerrellSeenText:
	text "I marinai sono"
	line "gentili, ma forti."
	cont "E tu?"
	done

SailorTerrellBeatenText:
	text "Anche tu sei"
	line "gentile e forte…"
	done

SailorTerrellAfterBattleText:
	text "Ho saputo che c'è"
	line "un nuovo PONTILE"
	para "a sud di VESTIGIA."
	done
	
CooltrainermNickSeenText:
	text "I tuoi #MON"
	line "sono capaci di"
	para "trasportarti sull'"
	line "acqua?"
	para "Un vecchio signore"
	line "di AVIOPOLI l'ha"
	cont "insegnato ai miei!"
	done

CooltrainermNickBeatenText:
	text "Lo conosci già?"
	done

CooltrainermNickAfterBattleText:
	text "Non sono in molti"
	line "a venire fin qui"
	cont "a lottare."
	done


EndonCave2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, ENDON_CAVE_1F, 3
	warp_event 51, 11, ENDON_CAVE_1F, 4
	warp_event 29,  7, ENDON_CAVE_RUINS_CONNECTION, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 34, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorTerrell, -1
	object_event 48, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermNick, -1
	object_event  8,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperTheo, -1
	object_event 21,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave2FEther, EVENT_ENDON_CAVE_2F_ETHER
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TatsugoPathElixer, EVENT_TATSUGO_PATH_ELIXER
