	object_const_def ; object_event constants
	const TEAMROCKETBASEB2F_POKE_BALL1
	const TEAMROCKETBASEB2F_POKE_BALL2
	const TEAMROCKETBASEB2F_POKE_BALL3
	const TEAMROCKETBASEB2F_POKE_BALL4
	const TEAMROCKETBASEB2F_POKE_BALL5
	const TEAMROCKETBASEB2F_GRUNTM17
	const TEAMROCKETBASEB2F_GRUNTM18
	const TEAMROCKETBASEB2F_GRUNTM19
	const TEAMROCKETBASEB2F_GRUNTM20
	const TEAMROCKETBASEB2F_GRUNTM21

TeamRocketBaseB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .DamagedSystemB2F
	
.DamagedSystemB2F:
	checkevent EVENT_ROCKET_MACHINE_DAMAGED
	iffalse .Done
	changeblock 11, 11, $4C ; damage
	changeblock 11, 15, $4D ; damage
	changeblock 11, 17, $4C ; damage
	changeblock 19, 11, $4E ; damage
	changeblock 19, 15, $4F ; damage
	changeblock 19, 17, $4E ; damage
	changeblock 15, 17, $50 ; damage
.Done:
	return

TeamRocketBaseB2FProtein:
	itemball PROTEIN

TeamRocketBaseB2FXSpecial:
	itemball SNAKESKIN

TeamRocketBaseB2FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB2FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB2FUltraBall:
	itemball ULTRA_BALL

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM20:
	trainer GRUNTM, GRUNTM_20, EVENT_BEAT_ROCKET_GRUNTM_20, GruntM20SeenText, GruntM20BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM20AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM21:
	trainer GRUNTM, GRUNTM_21, EVENT_BEAT_ROCKET_GRUNTM_21, GruntM21SeenText, GruntM21BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM21AfterBattleText
	waitbutton
	closetext
	end
	
GruntM21SeenText:
	text "I #MON dello"
	line "ZOO ammalati"
	para "sono solo il"
	line "primo passo"
	para "per il controllo"
	line "completo!"
	done
	
GruntM21BeatenText:
	text "Gasp!"
	done
	
GruntM21AfterBattleText:
	text "Non saresti"
	line "stato capace"
	para "di battermi con"
	line "i #MON sotto"
	para "il nostro"
	line "controllo!"
	done
	
GruntM20SeenText:
	text "Hai trovato"
	line "quello che"
	cont "cercavi?"
	done
	
GruntM20BeatenText:
	text "Grrr!"
	done
	
GruntM20AfterBattleText:
	text "Probabilmente c'è"
	line "della roba in giro"
	para "che potrebbe"
	line "servirti."
	para "Io non ti ho"
	line "detto nulla."
	done
	
GruntM19SeenText:
	text "Cosa fa questo"
	line "macchinario?"
	para "Oh, ci fa"
	line "controllare"
	cont "tutt i #MON!"
	done
	
GruntM19BeatenText:
	text "Ahia!"
	done
	
GruntM19AfterBattleText:
	text "Questo macchinario"
	line "è controllato da"
	cont "un computer."
	para "È veramente"
	line "rumoroso."
	done
	
GruntM18SeenText:
	text "Cosa stai"
	line "facendo qui?"
	done
	
GruntM18BeatenText:
	text "Ecco cosa stai"
	line "facendo qui…"
	done
	
GruntM18AfterBattleText:
	text "Non mi interessa"
	line "cosa sto facendo"
	cont "qui."
	para "Il TEAM ROCKET è"
	line "disorganizzato."
	para "Mi hanno quasi"
	line "lasciato indietro"
	cont "sulla nave…"
	done
	
GruntM17SeenText:
	text "Sono la RECLUTA"
	line "17!"
	para "Il GENERALE mi"
	line "chiama così…"
	done
	
GruntM17BeatenText:
	text "Me lo aspettavo."
	done
	
GruntM17AfterBattleText:
	text "A nessuno dei"
	line "capi interessano"
	cont "i nostri nomi."
	done




TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 12,  2, TEAM_ROCKET_BASE_B1F, 2
	warp_event 23, 15, TEAM_ROCKET_BASE_B1F, 3
	warp_event 26, 26, TEAM_ROCKET_BASE_B1F, 4
	warp_event 16,  0, TEAM_ROCKET_BASE_OFFICE, 1
	warp_event 17,  0, TEAM_ROCKET_BASE_OFFICE, 2


	db 0 ; coord events


	db 0 ; bg events

	db 10 ; object events
	object_event  1,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FProtein, EVENT_TEAM_ROCKET_BASE_B2F_PROTEIN
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FXSpecial, EVENT_TEAM_ROCKET_BASE_B2F_X_SPECIAL
	object_event 23, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FFullHeal, EVENT_TEAM_ROCKET_BASE_B2F_FULL_HEAL
	object_event 24,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FIceHeal, EVENT_TEAM_ROCKET_BASE_B2F_ICE_HEAL
	object_event 25, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FUltraBall, EVENT_TEAM_ROCKET_BASE_B2F_ULTRA_BALL
	object_event 22,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntM17, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  9, 19, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 19, 22, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntM19, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  8,  8, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGruntM20, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntM21, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
