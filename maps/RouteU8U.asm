	object_const_def ; object_event constants
	const ROUTEU8U_YOUNGSTER1
	const ROUTEU8U_YOUNGSTER2

RouteU8U_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

RouteU8USign:
	jumptext RouteU8USignText

BirdKeeperBorisSeenText:
	text "Se cerchi dei"
	line "#MON, devi"

	para "andare nell'erba"
	line "alta."
	done

BirdKeeperBorisBeatenText:
	text "Eeeehi!"
	done

BirdKeeperBorisAfterBattleText:
	text "Sei forte! È stato"
	line "divertente"
	cont "lottare."
	done

BirdKeeperBobSeenText:
	text "La PISTA CICLABILE"
	line "è una scorciatoia"
	cont "per KANTO."
	done

BirdKeeperBobBeatenText:
	text "…Ehi!"
	done

BirdKeeperBobAfterBattleText:
	text "Senza una"
	line "BICICLETTA non"

	para "puoi percorrere"
	line "la scorciatoia."
	done

RouteU8USignText:
	text "PERCORSO 18"

	para "KANTO -"
	line "INERTOPOLI"
	done

RouteU8U_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, SEASIDE_PATH_ISEN_STRAIT_GATE, 3
	warp_event  2,  7, SEASIDE_PATH_ISEN_STRAIT_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, RouteU8USign

	db 2 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
