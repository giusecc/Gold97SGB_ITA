	object_const_def ; object_event constants
	const ALLOYLIGHTHOUSE5F_SAILOR
	const ALLOYLIGHTHOUSE5F_YOUNGSTER
	const ALLOYLIGHTHOUSE5F_POKE_BALL1
	const ALLOYLIGHTHOUSE5F_POKE_BALL2
	const ALLOYLIGHTHOUSE5F_POKE_BALL3

AlloyLighthouse5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperDenis:
	trainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, BirdKeeperDenisSeenText, BirdKeeperDenisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperDenisAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorErnest:
	trainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

AlloyLighthouse5FRareCandy:
	itemball RARE_CANDY

AlloyLighthouse5FGreatBall:
	itemball GREAT_BALL

AlloyLighthouse5FTMSwagger:
	itemball TM_SWAGGER

AlloyLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ALLOY_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

SailorErnestSeenText:
	text "Volevo lottare con"
	line "JASMINE, ma non"

	para "è dell'umore"
	line "adatto. E tu?"
	done

SailorErnestBeatenText:
	text "Ehi, ehi. Ma"
	line "sei una furia!"
	done

SailorErnestAfterBattleText:
	text "Un CAPOPALESTRA"
	line "non dev'essere"

	cont "soltanto forte."
	para "Un vero capo"
	line "sa anche essere"
	cont "compassionevole."
	done

BirdKeeperDenisSeenText:
	text "È piuttosto alto"
	line "quassù: il luogo"

	para "adatto per i miei"
	line "#MON uccello!"
	done

BirdKeeperDenisBeatenText:
	text "Ops… Che botta…"
	done

BirdKeeperDenisAfterBattleText:
	text "I miei #MON"
	line "hanno imparato"
	cont "VOLO a ELIOPOLI."

	para "Siccome ho perso"
	line "userò VOLO per"
	cont "sorvolare il mare…"
	done

AlloyLighthouse5F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  9, 15, ALLOY_LIGHTHOUSE_6F, 1
	warp_event  3,  5, ENDON_CAVE_RUINS_CONNECTION, 2
	warp_event  9,  7, ENDON_CAVE_RUINS_CONNECTION, 3
	warp_event 16,  7, ENDON_CAVE_RUINS_CONNECTION, 9
	warp_event 17,  7, ENDON_CAVE_RUINS_CONNECTION, 10
	warp_event 16,  5, ALLOY_LIGHTHOUSE_6F, 2
	warp_event 17,  5, ALLOY_LIGHTHOUSE_6F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 13, BGEVENT_ITEM, AlloyLighthouse5FHiddenHyperPotion

	db 5 ; object events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorErnest, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperDenis, -1
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AlloyLighthouse5FRareCandy, EVENT_ALLOY_LIGHTHOUSE_5F_RARE_CANDY
	object_event  6, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AlloyLighthouse5FGreatBall, EVENT_ALLOY_LIGHTHOUSE_5F_GREAT_BALL
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AlloyLighthouse5FTMSwagger, EVENT_ALLOY_LIGHTHOUSE_5F_TM_SWAGGER
