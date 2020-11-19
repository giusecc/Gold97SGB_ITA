	object_const_def ; object_event constants
	const KKC_BB1
	const KKC_BB2
	const KKC_BB3
	const KKC_ITEMBALL1
	const KKC_ITEMBALL2

KikaiCaldera1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBBIzo:
	trainer BLACKBELT_T, IZO, EVENT_BEAT_BLACKBELT_IZO, IzoSeenText, IzoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext IzoAfterBattleText
	waitbutton
	closetext
	end

IzoSeenText:
	text "Ehi! Senti il"
	line "mio spirito"
	cont "focoso!"
	done

IzoBeatenText:
	text "Aaaaah!"
	done
	
IzoAfterBattleText:
	text "Non so cosa sia"
	line "più caldo tra il"
	para "vulcano e la mia"
	line "ardente passione!"
	done

TrainerBBTakeshi:
	trainer BLACKBELT_T, TAKESHI, EVENT_BEAT_BLACKBELT_TAKESHIKKC, TakeshiSeenText, TakeshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TakeshiAfterBattleText
	waitbutton
	closetext
	end
	
TakeshiSeenText:
	text "Benvenuto alla"
	line "Cucina CALDERA!"
	
	para "Ora affronta il"
	line "caldo!"
	done
	
TakeshiBeatenText:
	text "Senti che odore!"
	done
	
TakeshiAfterBattleText:
	text "Chi non sopporta"
	line "il calore non do-"
	cont "vrebbe stare qui!"
	done
	
	
TrainerBBTaro:
	trainer BLACKBELT_T, TARO, EVENT_BEAT_BLACKBELT_TARO, TaroSeenText, TaroBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TaroAfterBattleText
	waitbutton
	closetext
	end

TaroSeenText:
	text "I miei pugni sono"
	line "più veloci del"
	para "sudore per i miei"
	line "sforzi!"
	done
	
TaroBeatenText:
	text "Forse è meglio"
	line "una sauna."
	done
	
TaroAfterBattleText:
	text "I lottatori si"
	line "allenano nella"
	para "CALDERA perché"
	line "il calore rafforza"
	para "il loro cuore!"
	done

KKC1Itemball1:
	itemball PROTEIN
	
KKC1Itemball2:
	itemball FIRE_STONE


KikaiCaldera1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 19, KIKAI_VILLAGE, 5
	warp_event  5,  3, KIKAI_CALDERA_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 19, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBIzo, -1
	object_event 25,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBBTakeshi, -1
	object_event 14,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBBTaro, -1
	object_event  0, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball1, EVENT_KKC1_ITEMBALL1
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KKC1Itemball2, EVENT_KKC1_ITEMBALL2
	
